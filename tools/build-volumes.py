#!/usr/bin/env python3
"""Build private PULT/KADRY 2068 and an empty teaching database 2060."""
import argparse
import hashlib
import json
from pathlib import Path

from monitor import monitor, BASE, CONTEXT, COMMAND
from volume import ZONE, MASK, GOST, gost, words, put, catalog

ROOT = Path(__file__).resolve().parents[1]
MODULES = [('СПРАВ', 0o540, 0o1540, 5), ('АНКЕТА', 0o545, 0o1545, 6),
           ('СЛУЖЕБ', 0o553, 0o1553, 5), ('ШКОКАД', 0o560, 0o1560, 5),
           ('ОТЧЕТ', 0o565, 0o1565, 5), ('ПОЛЯ', 0o572, 0o1572, 1),
           ('РАБОЧ', 0o1225, 0o225, 3)]


def database():
    image = bytearray((0o2000+4)*ZONE)
    empty = [2 << 48]*1024
    empty[0] |= gost('!КАДРЫ')
    for zone in (112, 189, 190, 191, 0o400, 0o401, 0o402, 0o403):
        put(image, zone, empty, 2060)
    cat = empty.copy(); cat[1] |= gost('КАТАЛО')
    put(image, 112, cat, 2060)
    dictionaries = {
        2: (3, ['НЕТ', 'МУЖ', 'ЖЕН']),
        10: (3, ['НЕТ', 'РУС', 'УКР', 'БЕЛ']),
        214: (3, ['НЕТ', 'ВЫС', 'СРЕ']),
        232: (3, ['НЕТ', 'ДОК', 'КАН']),
        264: (3, ['НЕТ', 'ПРО', 'ДОЦ']),
        296: (3, ['НЕТ', 'ХОЛ', 'ЖЕН', 'ЗАМ']),
        308: (3, ['НЕТ', 'ОТД', 'ЛАБ', 'ЦЕХ']),
        510: (3, ['НЕТ', 'ИНЖ', 'ТЕХ', 'НАЧ', 'БУХ']),
        800: (3, ['НЕТ', 'РАБ', 'УЧЕ']),
        832: (3, ['НЕТ', 'ВОЕ', 'НЕВ']),
        914: (3, ['НЕТ', 'РЯД', 'ОФИ']),
        924: (3, ['НЕТ', 'ДА']),
        934: (3, ['НЕТ', 'ДА']),
        942: (3, ['ЯНВ', 'ФЕВ', 'МАР', 'АПР', 'МАЙ', 'ИЮН',
                  'ИЮЛ', 'АВГ', 'СЕН', 'ОКТ', 'НОЯ', 'ДЕК'])}
    for zone, label in [(190, '!ЗОНКД'), (191, '!ЗОНПЧ')]:
        data = [gost('******') | (2 << 48)]*1024
        data[0] = gost('!КАДРЫ') | (2 << 48)
        data[1] = gost(label) | (2 << 48)
        for offset, (length, names) in dictionaries.items():
            data[offset] = length | (2 << 48)
            data[offset+1] = len(names) | (2 << 48)
            for i, name in enumerate(names):
                data[offset+2+2*i] = gost(name.ljust(6, '*')) | (2 << 48)
                data[offset+3+2*i] = gost('******') | (2 << 48)
        put(image, zone, data, 2060)
    return image


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--source', type=Path, default=Path('/usr/local/share/besm6/2148'))
    parser.add_argument('--output', type=Path, default=ROOT/'build/volumes')
    args = parser.parse_args()
    args.output.mkdir(parents=True, exist_ok=True)
    for name in ('2068', '2060'):
        if (args.output/name).exists():
            parser.error(f'{args.output/name} exists; select a new --output directory')
    original = args.source.read_bytes()
    assert words(original, 0o541)[0o1206] & MASK == 0o3463000000000000, \
        'unexpected main-block physical device query; refusing an unchecked memory adaptation'
    image = bytearray((0o2000+4)*ZONE)
    copied = []

    def copy(source, destination, count, name):
        payload = []
        for i in range(count):
            data = words(original, source+i)
            put(image, destination+i, data)
            payload.append(bytes().join(v.to_bytes(8, 'little') for v in data))
        copied.append(dict(name=name, source=f'{source:04o}', destination=f'{destination:04o}',
                           count=count, sha256=hashlib.sha256(b''.join(payload)).hexdigest()))

    # Only the command loop, archive dispatcher, terminal/runtime services.
    for zone in (0, 5, 6, 0o35, 0o36, 0o37, 0o40, 0o41, 0o51):
        copy(0o1000+zone, zone, 1, 'ПУЛЬТ')
    for name, source, destination, count in MODULES:
        copy(source, destination, count, name)
    copy(0o755, 0o1755, 3, 'СПРАВКА')

    # Retain executable service code in the catalog's tail, but list only
    # files actually supplied on this minimal volume.
    system_catalog = words(image, 0)
    system_entries = []
    retained = {5, 6, 0o35, 0o36, 0o37, 0o40, 0o41, 0o51}
    for i in range(1, 0o75, 2):
        descriptor = system_catalog[i+1] & MASK
        if descriptor >> 24 in retained:
            system_entries.append((system_catalog[i] & MASK, descriptor))
    for i in range(1, 0o77):
        system_catalog[i] = 2 << 48
    system_entries.append((gost('КАДРЫ'), (0o101 << 24) | 1))
    for i, (name, descriptor) in enumerate(system_entries):
        system_catalog[2*i+1] |= name
        system_catalog[2*i+2] |= descriptor
    system_catalog[0o377] = (2*len(system_entries)+1) | (2 << 48)
    put(image, 0, system_catalog)
    # The 2148 resident's catalog-list descriptor uses an unrelated old offset.
    resident = words(image, 0o35)
    old = resident[0o12] & MASK
    assert old == 0o10010000402667
    resident[0o12] = (resident[0o12] & ~MASK) | 0o10010000400037
    put(image, 0o35, resident)

    entries = [('КАДРЫ', 1, 1), ('МОНИТ', 2, 1)]
    entries += [(name, dest-0o100, count) for name, _, dest, count in MODULES]
    put(image, 0o100, catalog('КАДРЫ', entries))
    code = monitor()
    monitor_words = code.build()
    context = [0]*56
    context[7] = 100000000  # generous session CPU budget in 1/50 sec
    context[8] = gost('УЧЕБА'); context[9] = gost('501300')
    context[10] = MASK  # local teaching operator has all block permissions
    context[13] = context[14] = 1
    for i, value in enumerate(context):
        monitor_words[CONTEXT-BASE+i] = value | (2 << 48)
    # The command area occupies the following page and survives overlay loads.
    command_words = [2 << 48]*1024
    for i, ch in enumerate('КАДРЫ'):
        command_words[i] |= GOST.index(ch)
    command_words[5] |= 0o377
    put(image, 0o102, monitor_words)
    put(image, 0o103, command_words)

    # PULT user command: UJ 10 with its required ЫЫЫ marker in the unused half.
    stub = [1 << 48]*1024
    stub[7] |= ((0o3000000 | 0o10) << 24) | 0x3a3a3a
    stub[0o10] |= (0o700000 | 0o30) << 24  # E70 30
    stub[0o11] |= (0o700000 | 0o31) << 24
    stub[0o12] |= (0o3000000 | BASE) << 24
    stub[0o30] = 0o10300000400102 | (2 << 48)
    stub[0o31] = 0o10310000400103 | (2 << 48)
    put(image, 0o101, stub)

    for name, data in [('2068', image), ('2060', database())]:
        (args.output/name).write_bytes(data)
    report = dict(source=str(args.source.resolve()),
                  source_sha256=hashlib.sha256(original).hexdigest(),
                  copied=copied, monitor_entries={k:f'{v:05o}' for k,v in code.labels.items()
                                                 if k in ('boot', 'enter', 'exec', 'quit')},
                  patches=[dict(zone='0035', word='0012', old=f'{old:016o}',
                                new='0010010000400037', reason='relocate archive list'),
                           dict(zone='0000', reason='list only retained files and KADRY launcher')],
                  memory_adaptations=[dict(program='СПРАВ', address='03206',
                                           old='3463000000000000', new='0010000000000000',
                                           reason='E63 physical device table is unavailable in DISPAK')],
                  hashes={v:hashlib.sha256((args.output/v).read_bytes()).hexdigest()
                          for v in ('2068', '2060')})
    (args.output/'provenance.json').write_text(json.dumps(report, ensure_ascii=False, indent=2)+'\n')
    assert hashlib.sha256(args.source.read_bytes()).hexdigest() == report['source_sha256']
    print(f'Created {args.output}/2068 and /2060; source 2148 unchanged')


if __name__ == '__main__':
    main()
