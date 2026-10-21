#!/usr/bin/env python3
"""Populate and verify the historical program on private local volumes."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import subprocess

from volume import words, MASK

ROOT = Path(__file__).resolve().parents[1]
NAMES = ('ИВАНОВ', 'ПЕТРОВА', 'СИДОРОВ', 'КУЗНЕЦОВ', 'СМИРНОВА', 'ОРЛОВ')


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def session(volumes, name, commands):
    logs = volumes.parent/'logs'
    logs.mkdir(exist_ok=True)
    result = subprocess.run([str(ROOT/'run-kadry.sh'), '-t'],
                            input=commands, text=True, capture_output=True, timeout=25,
                            env=dict(os.environ, KADRY_VOLUMES=str(volumes.resolve())))
    for suffix, value in [('input', commands), ('out', result.stdout), ('trace', result.stderr)]:
        (logs/(name+'.'+suffix)).write_text(value)
    assert result.returncode == 0, (result.returncode, result.stderr[-2000:])
    for error in ('АВОСТ', 'ОШ.АДСИС', 'БАНК ИСПОРЧЕН', 'АНКЕТА НЕ ВВЕДЕНА',
                  'НЕ СУЩЕСТВУЕТ', 'ВАМ НЕЛЬЗЯ', 'НЕ ПОНИМАЮ', 'НЕПОНЯТНО'):
        assert error not in result.stdout, (error, result.stdout)
    assert 'ВРЕМЯ РЕШ:' in result.stdout, 'PULT did not exit normally'
    return result


def check(volumes):
    provenance = json.loads((volumes/'provenance.json').read_text())
    source = Path(provenance['source'])
    assert digest(source) == provenance['source_sha256']
    original, relocated = source.read_bytes(), (volumes/'2068').read_bytes()
    for entry in provenance['copied']:
        start, destination = int(entry['source'], 8), int(entry['destination'], 8)
        for i in range(entry['count']):
            expected, actual = words(original, start+i), words(relocated, destination+i)
            if destination+i == 0:
                # Catalog entries and its lookup bound were rebuilt; its code tail stays exact.
                assert expected[0o77:0o377] == actual[0o77:0o377]
                assert expected[0o400:] == actual[0o400:]
            else:
                if destination+i == 0o35:
                    expected[0o12] = (expected[0o12] & ~MASK) | 0o10010000400037
                assert expected == actual, entry
    before = {v:digest(volumes/v) for v in ('2068', '2060')}
    result = session(volumes, 'check', (ROOT/'sessions/check.txt').read_text())
    for name in NAMES:
        assert name in result.stdout, (name, result.stdout)
    assert 'ЧИСЛО АНКЕТ:0006' in result.stdout
    assert 'ЧИСЛО АНКЕТ:0001' in result.stdout  # surname selection after returning from WORKER
    for text in ('ВЫ ВОШЛИ В БЛОК  "ОТЧЕТ"', 'НЕТ, МУЖ, ЖЕН',
                 'ДАЙ РАБОТУ <ТАБ,АНК,КОН,ВЫХ>', 'ОТД  1', 'ЛАБ  1'):
        assert text in result.stdout, (text, result.stdout)
    for zone in ('1540', '1545', '1553', '1560', '1565', '1572', '0225'):
        assert f'000040{zone})' in result.stderr, zone
    assert before == {v:digest(volumes/v) for v in before}, 'read session changed a disk'
    assert digest(source) == provenance['source_sha256']
    report = dict(passed=True, records=6, departments=2,
                  overlays=['СПРАВ', 'АНКЕТА', 'СЛУЖЕБ', 'ШКОКАД', 'ОТЧЕТ', 'ПОЛЯ', 'РАБОЧ'],
                  checks=['exact copied payloads and tags', 'restart and list six records',
                          'select one surname', 'all seven overlay entry zones',
                          'normal PULT exit', 'read-session disk immutability',
                          'source 2148 immutability'], hashes=before)
    (volumes.parent/'logs/check.json').write_text(json.dumps(report, ensure_ascii=False, indent=2)+'\n')
    print('PASS: 6 records, 2 departments, all 7 overlays; source and local disks unchanged by check')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--volumes', type=Path, default=ROOT/'build/volumes')
    parser.add_argument('--check', action='store_true')
    args = parser.parse_args()
    volumes = args.volumes.resolve()
    if not (volumes/'2068').exists():
        subprocess.run(['python3', str(ROOT/'tools/build-volumes.py'), '--output', str(volumes)], check=True)
    if not args.check and not (volumes/'demo.json').exists():
        catalog = words((volumes/'2060').read_bytes(), 112)
        if catalog[3] & 0o177:
            parser.error('database already has departments; use a new --volumes directory')
        system_hash = digest(volumes/'2068')
        result = session(volumes, 'populate', (ROOT/'sessions/populate.txt').read_text())
        assert result.stdout.count('АНКЕТА ВВЕДЕНА') == 6, result.stdout
        assert 'ЧИСЛО АНКЕТ:0006' in result.stdout, result.stdout
        assert digest(volumes/'2068') == system_hash
        (volumes/'demo.json').write_text(json.dumps(dict(names=NAMES, records=6,
                                                         database_sha256=digest(volumes/'2060')),
                                                   ensure_ascii=False, indent=2)+'\n')
    check(volumes)


if __name__ == '__main__':
    main()
