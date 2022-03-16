(*=p-,t-,m-,l-,k10*)
_program ОТЧЕТ;
_label 10577, 10723, 10726,10604,10606;
_const z1 = 3401751B; main=5401540B;
dbVol=2060;c112=112;c189=189;c190=190;c191=191;
pl='+';c146=146B;c2=2;c4=4;c7=7;c8=8;c16=16;
sl='/';
gt='>';
c1731=1731;
c214=214;c232=232;c264=264;c296=296;c308=308;c510=510;
c800=800;c832=832;c914=914;c924=924;c934=934;c942=942;
c2048=2048;c50=50;c3=3;c5=5;c6=6;
dot='.';c17=17;c9=9;
minus='-';c40=40;c28=28;c24=24;c38=38;c43=43;c46=46;
comma=',';c20=20;c36=36;c41=41;
c42=42;c26=26;c21=21;c23=23;c22=22;
c120=120;c56=56;
etx='{377';
sp=' ';
c81=81;
opar='(';cpar=')';
valet='ВАЛЕТ ';
c172b=172b;c175b=175b;
spaces='      ';
star='*';
ornament='-=O=- ';
kadry='!КАДРЫ';
zonkd='!ЗОНКД';
zonpch='!ЗОНПЧ';
stars='******';

_type letter='A'..'Z';
digit='0'..'9';
bitset=_set _of 0..47;
a15=_array[1..15] _of integer;
a17=_array[1..17] _of integer;
a121=_array[0..120] _of integer;
word=_record _case integer _of
0:(i:integer);
4:(p15:@a15);
3:(b:boolean);
2:(p:@word);
1:(a:alfa)
_end;
cmdarr=_array [1..31] _of alfa;
page= _array[0..1023] _of word;
sixchars=_array [1..6] _of char;
tx=0..64;ty=0..1020;
arr = _array [1..39] _of word;
rec1 = _record dummy:integer; a:_array[0..0] _of word _end;
rec2 = _record _case integer _of
0: (f0: _array [1..15] _of integer);
1: (w0: _array [1..15] _of word);
2:(da, db: integer; f2:_array [0..10] _of integer);
5:(dx, dy, dz, du, dv: integer; f5:_array[0..9] _of integer)
_end;
arr120 = _record a: _array [1..120] _of word; b: @rec2 _end;

setting = _record
sizeof:integer;
s1:integer;
s2:alfa;
s3:boolean;
 s4,
 s5,
 s6,
 s7,
 s8,
s9:integer;
s10, s11, s12:integer;
s13, s14, s15:integer;
s16, s17, s18:integer;
s19, s20, s21: integer
_end;
data = _record
d1, d2, d3, curVol: integer;
d5, d6, d7:boolean;
timeLimit: integer;
d9:alfa;
d10:alfa;
perms:bitset;
flags:bitset; 
prnEnable:boolean;
d14:boolean;
dpyEnable:boolean;
d16, d17:integer;
statArr:arr
_end;

_var
cmd:alfa;
cmd2:alfa;
g12z:alfa;
listA,listB:page;
g2061z:integer;
ЗАПРЕТ:boolean;
debug:boolean;
g2064z:boolean;
g2065z:boolean;
g2066z:integer;
ii:integer;
g2068z:integer;
g2069z:integer;
g2070z:integer;
g2071z, g2072z, g2073z:integer;
g2074z, g2075z: integer;
g2076z:integer;
g2077z, g2078z, g2079z, g2080z: integer;
g2081z:integer;
g2082z:integer;
g2083z:boolean;
g2084z:_array[0..2] _of bitset;
g2087z, g2088z:integer;
g2089z:@a17;
g2090z:@a17;
pg32ptr:@page;
g2092z, g2093z:@word;
g2094z, g2095z, g2096z:integer;
g2097z:boolean;
g2098z:boolean;
g2099z, g2100z: integer;
g2101z, g2102z, g2103z, g2104z:integer;
g2105z, g2106z:integer;
g2107z: @arr;
g2108z:_record _case integer _of
0: (z:_array[0..0] _of @arr120);
1: (m:_array[0..0] _of @rec1)
_end;

g2109z, g2110z:integer;
g2111z:_array [1..20] _of char;
g2131z:_array [0..19] _of @rec2;
g2151z:_array [1..20] _of char;
g2171z:_array [1..20] _of char;
g2191z:_array [1..20] _of char;
g2211z:_array [1..20] _of char;
g2231z:_array [1..20] _of char;
g2251z, g2252z, g2253z:integer;
g2254z:@arr120;
g2255z, g2256z:@rec2;
g2257z:_array[0..3] _of word;
g2261z:_array [0..24] _of integer;
g2286z, g2287z, g2288z, g2289z:integer;
g2290z:_array[0..24] _of boolean;
g2311z:_array [5..7] _of integer;
curVol, g2319z, g2320z:integer;
g2321z, g2322z, g2323z, g2324z:integer;
g2325z, g2326z:bitset;
g2327z, g2328z, dpyEnable, g2330z: boolean;
g2331z:_array [0..19] _of integer;
g2351z:_array [1..20] _of char;
g2371z:_record cmd: _array [0..28] _of alfa _end;
g2400z:integer;
g2401z:_array [0..9] _of char;
g2411z:_array [1..11] _of char;

INP:text; (* <- 2422 *)

_proced skipsp;
 _(
 _while INP@ = sp _do get(INP);
 _);

_procedure TTIN(level:integer);
_label 1;
_var v1, v2: integer;
_(
  _case level _of
  0: BIND;
  1: BIND(' ==O {172');
  2: BIND(' =-O {172')
  _end;
  _if g2327z  _then _(
    code(СЧ76013=УИ7,);
    v1 := 2; code(ЗЧ76013=,);
    _case level _of 
      1: write(' ==O ');
      2: write(' =-O ')
    _end   
  _);
  rewrite(INP);
  v2 := 0;
  _while input@ <> etx _do _(
  _if g2327z _then write(input@:1);
    v2 := v2 + 1;
    _if v2 > 1024_then _(
      rewrite(INP);
      write(INP, 'SLЕ  {377');
      g2326z := g2326z + [47];
      _goto 1
    _);
    write(INP,input@);
    get(input);
  _);
  write(INP, input@);
  1:
  reset(INP);
  _if g2327z _then _(
    writeLN;
    code(ВИ7=ЗЧ76013,);
  _);
_);

_proced timeout;
_var i:integer;
_(
  _if debug _then EXIT;
 code(Э0634=,);
 i := ;
  _if g2322z - i < 50 _then _(
   rewrite(INP);
   writeln('ВАШЕ ВРЕМЯ ИСТЕКЛО');
   ЗАПРЕТ := false;
   write(INP, 'КОН  {377' );
  _GOTO 10723;
  _);
_);

_function itoa(l2a1z:integer):alfa;
_var l2v1z, l2v2z, l2v3z:integer; l2v4z:sixchars; l2v10z:alfa;
_(
 l2v3z := 100000;
 _for l2v1z := 1 _to 6 _do _(
 l2v2z := trunc(l2a1z / l2v3z);
 l2a1z := l2a1z - l2v2z * l2v3z;
 l2v3z := trunc (l2v3z / 10);
 l2v4z[l2v1z] := chr(l2v2z);
 _);
 pck(l2v4z[1], l2v10z);
 itoa := l2v10z;
 _);

_proced chkMagic;
 _(
   _if _not (pg32ptr@[0].a = kadry) _then  _(
 writeln('БАНК ИСПОРЧЕН');
 _GOTO 10577;
 _);
 _);

_proced enq52; _var l2v1z: integer;
_(
 l2v1z := 520000B;
 code(Э050105=,Э050115=,)
 _);

_proced deq52; _var l2v1z: integer;
_(
  l2v1z := 520000B;
 code(Э050105=,Э050116=,)
 _);

_proced rdpg32(l2a1z, l2a2z:integer);
 _( (*=m-*)
 l2a2z := (((l2a1z * 4096) + l2a2z) + (10320000000000C));
   code(2Э0704=,)
 _);

_proced wrpg32(l2a1z, l2a2z:integer);
 _(
 l2a2z := (((l2a1z * 4096) + l2a2z) + (320000000000C));
   code(2Э0704=,)
 _);

_proced rdPage(_var dst:page; vol, zone:integer;  copy:boolean);
_var i:integer;
l2v2z, l2v3z:alfa;
l2v4z:alfa;
_(
  timeout;
 _if (curVol <> vol) _then _(
   _if (curVol <> 0) _then _(
     i := (2052770000000000C);
     code(2Э0727=,);
   _);
   l2v4z :=   itoa( vol );
   i := (5277000000000000C);
   l2v2z := '00    ';
   l2v3z := '{377{377';
   code(2СЧ12=2СБ10,2РБ11=2ЗЧ12,2ЛС7=Э050131,);
   i := ;
   code(15ПА=2СЧ12,Э050121=,);
   code(15ПА40000=2СЧ12,Э050121=,);
   _if i = 0 _then curVol := vol
   _else _(
     writeln('РАБОТАТЬ НЕЛЬЗЯ КО=', i:3);
     _GOTO 10577
   _)
 _);
 rdpg32( 52B, zone );
  chkMagic;
 _if copy _then _for i := 0 _to 1023 _do 
     code(2ИК7=ИА64000,СЧ=17ЗЧ,2СЧ7=2АС3,17ЗЧ=17ИК,ИА=15ПА,17СЧ=15ЗЧ,)
_);

_proced wrPage(_var src: page; vol, zone:integer; copy:boolean);
_var l2v1z:integer; l2v2z, l2v3z, l2v4z:alfa;
_(
 timeout;
 _if copy _then _for l2v1z := 0 _to 1023 _do _(
    l2v1z := l2v1z;
    code(УИ7=);
  cmd2 := src[l2v1z].a;
    code(ИА64000=7ЗЧ,)
 _);
 chkMagic;
 _if (curVol <> vol) _then _(
   _if (curVol <> 0) _then _(
     l2v1z := (2052770000000000C);
     code(2Э0727=,);
   _);
   l2v4z :=   itoa( vol );
   l2v1z := (5277000000000000C);
   l2v2z := '00    ';
   l2v3z := '{377{377';
   code(2СЧ12=2СБ10,2РБ11=2ЗЧ12,2ЛС7=Э050131,);
   l2v1z := ;
   code(15ПА=2СЧ12,Э050121=,);
   code(15ПА40000=2СЧ12,Э050121=,);
   _if (l2v1z = 0) _then _(
      curVol := vol;
   _) _else _(
     writeln('РАБОТАТЬ НЕЛЬЗЯ КО=', l2v1z:3);
     _GOTO 10577;
   _)
 _);
 wrpg32(52B, zone );
_);

_proced rdDB;
 _(
   rdPage( listA, dbVol, 112, true );
   g2069z :=   sel( listA[3].i, 0, 7);
 _);

 _proced rdMyZone;
 _(
 _if (g2071z = 0) _then _(
   writeln('НЕТ БАЗЫ');
   _GOTO 10577;
  _);
  rdPage( listA, g2071z, g2072z, false );
  g2070z :=   sel( pg32ptr@[1].i, 0, 7 );
_);

_proced rd189;
 _(
  rdPage( listA, 2060, 189, true );
   g12z := listA[1].a;
   g2103z := ;
   g12z := listA[2].a;
   g2104z := ;
_);

_proced L1460;
 _(
   enq52;
   wrPage( listA, 2060, 189, true );
   deq52;
_);

 _proced L1471;
 _(
 rdPage( listA, 2060, g2072z, false );
 _);

 _proced L1500;
 _(
 enq52;
 wrPage( listA, 2060, g2072z, false );
 deq52;
 _);

 _proced rdZKD;
 _(
   _if _not (listB[1].a = zonkd) _then 
 rdPage( listB, 2060, 190, true );
 _);

 _proced rdZPCH;
 _(
   _if _not (listB[1].a = zonpch) _then 
 rdPage( listB, 2060, 191, true );
 _);

_proced U1533;
_var r:alfa;
_(
  writeLN;
  g2106z := (g2106z + 1);
  timeout;
  code(СЧ77015=);
  r := ;
  _if r = 'Н{3770000' _then _GOTO 10577
_);

 _proced L1545;
 _(
 _for g2066z := 1 _to 28 _do _(
   g2093z := ptr((ord(ref(g2287z)) + g2066z) - 1);
   g2093z@.b := false;
 _);
 g2083z := false;
 _for g2066z := 0 _to 2 _do g2084z[g2066z] := [];
 g2087z := 102;
 g2088z := 0;
 g2106z := ;
_);

_proced L1572(l2a1z:integer);
 _(
 U1533;
 rewrite(output);
 L1545;
 writeln('ОШИБКА ТИП=', l2a1z  :  2);
 _if (INP@ <> etx) _then _(
 writeln('КОНТЕКСТ:');
 (a) _for g2066z := 1 _to 24 _do _(
   write(INP@:1+0);
   _if INP@ = etx _then _exit a;
 get(INP);
   _);
 U1533;
   _);
 _GOTO 10577;
 _);

_proced memset(l2a1z, l2a2z:integer);
_var l2v1z:@arr120;
_(
  l2v1z := g2108z.z[l2a1z];
  _for g2066z := 1 _to 120 _do l2v1z@.a[g2066z].i := l2a2z;
_);

_proced U1647(l2a1z:integer;  l2a2z:integer);
 _(
 _for g2066z := 1 _to 23 _do
   g2108z.z[g2066z]@.a[l2a1z].i := l2a2z;
 _);

_proced L1665;
 _(
   g2093z := ptr((ord(ref(g2287z)) + g2076z) - 1);
   g2093z@.b := true;
 _);

 _proced L1674;
 _(
 _while  _not ( (g2401z[g2073z] <> sp) _or  (g2075z <= 0)) _do _(
 g2073z := (g2073z + 1);
 g2075z := (g2075z - 1);
 _);
 _);
 _proced L1706;
 _(
 g2073z := 1;
 g2075z := g2074z;
 _);
_proced L1712;
 _(
 _while ( g2401z[g2073z] _in letter) & _not (g2075z <= 0) _do  _(
 g2073z := (g2073z + 1);
 g2075z := (g2075z - 1);
 _);
 L1674;
 _);

 _proced L1731;
 _(
 g2066z := 0;
 _while (INP@ _in letter) _or (INP@ = sp) _do _(
 g2066z := (g2066z + 1);
 _if _not (g2066z <= 20) _then  L1572( 13 );
 g2401z[g2066z] := INP@;
 get(INP);
 _);
 g2074z := g2066z;
 g2075z := ;
 g2073z := 1;
 _);

 _proced L1757;
 _(
 writeln('   В БЛОКЕ "ОТЧЕТ" ИСПОЛНЯЮТСЯ:
1. ИНФОРМАЦИЯ                  - ВЫДАЕТ СПИСОК ПРИКАЗОВ
2. СПИСОК [<НОМТАБ>-<НОМТАБ>]  - ПОКАЗ СПИСКА ТАБЛИЦ АРХИВА
3. ФОРМАТ  <ЧИСЛО СТРОК>       - УСТАНОВКА ФОРМАТА СТРАНИЦЫ
4. ТАБЛИЦА [<СПИСОК ПОДРАЗДЕЛЕНИЙ>] 
            <НОМТАБ,ТАБЛИЦА>   - ПОСТРОЕНИЕ ТАБЛИЦ ОТЧЕТОВ
5. АРХИВ     <ПАРОЛЬ>          - ВХОД В СУББЛОК "АРХИВ"
6. ПЕЧАТЬ  [<ДА,НЕТ>]          - ВКЛ/ВЫКЛ ВЫДАЧИ НА АЦПУ
7. ЭКРАН   [<ДА,НЕТ>]          - ВКЛ/ВЫКЛ ВЫДАЧИ НА ВИДЕОТОН
8. ВЫХОД                       - ПЕРЕХОД В "КАДРЫ"
');
 _);

_proced expect(l2a1z:char);
 _(
 _if INP@ = l2a1z _then  get(INP) _else L1572( 99 );
 _);

 _proced L1775;
 _(
 L1572( 13 );
 _);

 _proced cmpswap(_var l2a1z, l2a2z:integer);
 _(
 _if _not (l2a2z >= l2a1z) _then  _(
 g2068z := l2a2z;
 l2a2z := l2a1z;
 l2a1z := g2068z;
 _);
 _);

_function L2016(l2a1z:integer):integer;
_var l2v1z:integer;
_(
 _for l2v1z := 0 _to l2a1z _do _(
  _if _not (g2371z.cmd[l2v1z] <> g12z) _then  _(
 L2016 := l2v1z;
 EXIT;
 _);
 _if _not (l2v1z <> l2a1z) _then  L1775;
   _);
 _);

_function getAlfa(_var l2a2z:alfa; l2a3z:integer):boolean;
_var l2v1z:sixchars; l2v7z:integer;
_(
 skipsp;
 (a) _if (INP@ = '=') _then _for l2v7z := 1 _to 4 _do _(
  _if  INP@ = etx _then _exit a;
  get(INP);
 _);

 l2v7z := 0;
 l2a2z := '0';
 unpck(l2v1z[1],  l2a2z );
 _while (INP@ _in letter) & (l2v7z < l2a3z) _do  _(
 l2v1z[((7 - l2a3z) + l2v7z)] := INP@;
 get(INP);
 l2v7z := (l2v7z + 1);
 _);
_while INP@ _in letter _do get(INP);
 skipsp;
 pck(l2v1z[1], l2a2z);
  getAlfa := (l2v7z > 0);
 _);

_function getNum(base:integer):integer;
_var l2v1z:char; l2v2z:integer;
 _(
 l2v2z := 0;
 skipsp;
 _while INP@ _in digit _do _(
   l2v1z := INP@;
 _if (ord(l2v1z) >= base) _then _(
   writeln('ОШИБКА В ЧИСЛЕ');
   _GOTO 10577
 _);
 (*=m+*) l2v2z := (l2v2z * base) + ord(l2v1z);
 get(INP);
_);
 skipsp;
 getNum := l2v2z;
_);

_function L2146(l2a1z:integer):alfa;
_label 1;
_var l2v1z:integer; l2v2z: alfa; l2v3z:sixchars;
_(
 l2v2z := '0';
 unpck(l2v3z[1],  l2v2z );
 _for l2v1z := 1 _to l2a1z _do _(
  _if (g2075z <= 0) _then _goto 1;
  l2v3z[((6 - l2a1z) + l2v1z)] := g2401z[g2073z];
  g2073z := (g2073z + 1);
  g2075z := (g2075z - 1);
 _);
 1: pck(l2v3z[1], l2v2z);
 L2146 := l2v2z;
 L1712;
 _);

_function getDate:integer;
_label 2246;
_var l2v1z, l2v2z:integer;
_proced L2176;
 _(
   (a) _( skipsp;  _if (INP@ = '.') _then _( get(INP); _goto a _) _);
  _if _not (INP@ _in digit) _then _(
    l2v1z := 0;
    writeln('ОШИБКА В ДАТЕ');
    _GOTO 2246;
   _)
 _);

_(
 L2176;
 l2v1z := getNum(10);
 L2176;
 l2v1z := getNum(10) * 100 + l2v1z;
 L2176;
 l2v2z :=   getNum(10);
 _if l2v2z > 100 _then  l2v2z := l2v2z _MOD 100;
 l2v1z := l2v2z * 10000 + l2v1z;
 2246:
 getDate := l2v1z;
_);

_function L2250(l2a1z:integer):integer;
_label 2271;
_var l2v1z, l2v2z, l2v3z, l2v4z, l2v5z:integer;
l2v6z, l2v7z:alfa;
l2v8z,  l2v14z:sixchars;
_(
 rdZKD;
  l2v6z := listB[l2a1z].a;
 l2v1z := ;
  l2v6z := listB[(l2a1z + 1)].a;
 l2v2z := ;
 l2v6z := '******';
 unpck(l2v8z[1],  l2v6z );
 unpck(l2v14z[1],  l2v6z );
 _if _not (l2a1z = 232) _then  L1731;
  l2v3z := 0;
2271:
 l2v4z := 0;
 _while (g2401z[g2073z] _in letter) _and _not ( (g2075z <= 0) _or  (l2v4z >= l2v1z)) _do _(
 l2v4z := (l2v4z + 1);
 l2v3z := (l2v3z + 1);
 _if _not (l2v3z <= 12) _then  L1775;
 l2v8z[l2v3z] := g2401z[g2073z];
 g2073z := (g2073z + 1);
 g2075z := (g2075z - 1);
  _);
 L1712;
  _if (g2401z[g2073z] _in letter) _and _not (g2075z <= 0) _then _goto 2271;
 pck(l2v8z[1], l2v6z);
 pck(l2v14z[1], l2v7z);
 l2v3z := (l2a1z + 2);
 _for l2v4z := 0 _to (l2v2z - 1) _do _(
 l2v5z := (l2v4z * 2);
  _if _not ( (listB[(l2v3z + l2v5z)].a <> l2v6z) _or
  (listB[((l2v3z + l2v5z) + 1)].a <> l2v7z)) _then  _(
 L2250 := l2v4z;
 EXIT;
 _);
   _);
 L1775;
 _);

_function U2353:integer;
 _(
 U2353 :=   L2250( 2 );
 _);

_function U2360:integer;
 _(
 U2360 :=   L2250( 10 );
 _);

_function U2365:integer;
 _(
 U2365 :=   L2250( 934 );
 _);

 _function U2372:integer;
 _(
 U2372 :=   L2250( 214 );
 _);

_function U2377:integer;
 _(
 L1731;
 g12z :=   L2146( 3 );
 _if (g2075z = 0) _then _(
 U2377 := 0;
 _if _not (g12z <> 'КАН') _then  _(
 g2099z := 3;
 g2100z := 5;
 g2098z := true;
 _) _else _if _not (g12z <> 'ДОК') _then  _(
 g2099z := 1;
 g2100z := 2;
 g2098z := true;
 _) _else _if _not (g12z = 'НЕТ') _then  L1775
 _) _else _(
 L1706;
 U2377 :=   L2250( 232 );
 _)
 _);

_function U2433:integer;
 _(
 U2433 :=   L2250( 264 );
 _);

_function U2440:integer;
 _(
 U2440 :=   L2250( 296 );
 _);

 _function U2445:integer;
_var l2v1z, l2v2z:integer;
_(
 g2097z := false;
 l2v1z :=   L2250( 308 );
 l2v2z :=   getNum( 10 );
 _if _not (l2v2z <= 127) _then  L1775;
 l2v1z := ((l2v1z * 16384) + (l2v2z * 128));
 g2101z := -1;
 _if (INP@ = '-') _then _(
 get(INP);
 _if INP@ _in digit _then _(
   l2v2z :=   getNum( 10 );
   g2101z := ;
 _if _not (l2v2z <= 177) _then  L1775;
 l2v1z := (l2v1z + l2v2z);
  _) _else 
 g2097z := true;
  _);
 U2445 := l2v1z;
 _);

_function U2510:integer;
 _(
 U2510 :=   L2250( 510 );
 _);

_function U2515:integer;
 _(
 U2515 :=   L2250( 800 );
 _);

_function U2522:integer;
 _(
 U2522 :=   L2250( 832 );
 _);

_function U2527:integer;
 _(
 U2527 :=   L2250( 914 );
 _);

_function U2534:integer;
 _(
 U2534 :=   L2250( 924 );
 _);

_proced L2541(_var l2a1z:alfa);
_var l2v1z:sixchars; l2v7z:integer;
_(
 _for l2v7z := 1 _to 6 _do
  _if _not (INP@ <> etx) _then  l2v1z[l2v7z] := sp _else _(
    l2v1z[l2v7z] := INP@;
    get(INP);
  _);
 pck(l2v1z[1], l2a1z);
_);

 _proced U2564(_var l2a1z, l2a2z:integer);
 _(
 l2a1z :=   getNum( 10 );
 l2a2z := ;
 _if _not (INP@ <> '-') _then  _(
 get(INP);
 l2a2z :=   getNum( 10 );
 _);
_);

_proced L2605;
 _(
 skipsp;
 _if INP@ _in letter _then _(
  g2371z := [
  '777',  'ФАМ',  'ИМЯ',  'ОТЧ',  'ПОЛ',
  'РОЖ',  'ВОЗ',  'НАЦ',  'КПС',  'ВЛК',
  'ПРО',  'ОБР',  'СТЕ',  'ЗВА',  'СПЕ',  'СЕМ',
  'ДЕТ',  'АДР',  'ТЕЛ',  'ЗАЧ',  'ПОД',  'СТА',  'ДОЛ',
  'ПОВ',  'ЗАР',  'СОС',  'ВОИ',  'СТР',
  'БРО' ];
 g2064z :=   getAlfa( g12z, 3 );
 g2076z :=   L2016( 28 );
 _)  _else
 g2076z :=   getNum( 10 );
_);

_proced U2664;
_var l2v1z, l2v2z:integer;
_(
 l2v1z := 0;
 g2098z := ;
 _if (INP@ _in digit) _and _not (g2076z _IN [5,19,23]) _then 
   U2564( g2077z, g2078z )
 _else (L2701) _(
 l2v1z := (l2v1z + 1);
  _select 
 (g2076z = 4) : l2v2z :=   U2353;
 (g2076z = 5) : l2v2z :=   getDate;
 (g2076z = 7) : l2v2z :=   U2360;
 (g2076z = 11) : l2v2z :=   U2372;
 (g2076z = 12) : l2v2z :=   U2377;
 (g2076z = 13) : l2v2z :=   U2433;
 (g2076z = 15) : l2v2z :=   U2440;
 (g2076z = 19) : l2v2z :=   getDate;
 (g2076z = 20) : l2v2z :=   U2445;
 (g2076z = 22) : l2v2z :=   U2510;
 (g2076z = 23) : l2v2z :=   getDate;
 (g2076z = 25) : l2v2z :=   U2515;
 (g2076z = 26) : l2v2z :=   U2522;
 (g2076z = 27) : l2v2z :=   U2527;
 (g2076z = 28) : l2v2z :=   U2534;
  true: L1572( 14 )
  _end;
 _if g2098z  _then  _(
 g2077z := g2099z;
 g2078z := g2100z;
 _) _else _(
  _if (l2v1z = 1) _then _(
   g2077z := l2v2z;
   g2078z := ;
  _) _else  g2078z := l2v2z;
  _if (INP@ <> '-') &  (INP@ <> '.') _then _exit L2701;
  get(INP);
  _if _not (INP@ <> '.') _then  get(INP);
  _goto L2701;
  _);
 _);
 cmpswap( g2077z, g2078z );
_);

_proced stats(l2a1z:integer);
_var l2v1z, l2v2z, l2v3z:integer;
_(
 _if _not debug _then _(
 l2v1z := g2331z[l2a1z];
 l2v3z := ;
 l2v1z := (sel(l2v3z, 24, 6) + g2096z);
 code(СД/6/=);
 l2v2z := ;
 code(МР=СД/-6/,МР=);
 l2v1z := ;
 ins(l2v3z, l2v1z, 24, 6);
 g2331z[l2a1z] := ;
 _if _not (l2v2z <= 0) _then  _(
 g2096z := l2v2z;
 stats( (l2a1z - 1) );
 g2096z := 1;
 _);
 _if _not ( (l2a1z > 21) _or  (l2a1z <= 0)) _then  stats( 0 );
 _);
_);

_function today:integer;(*=m-*)
_var l2v1z:integer;
_(
 code(Э050114=,);
 l2v1z := ;
 today := sel(l2v1z,16, 4) * 100000 + sel(l2v1z,20, 4) * 10000 +
  sel(l2v1z, 28, 1) * 1000 + sel(l2v1z, 24, 4) * 100 +
  sel(l2v1z, 33, 2) * 10 + sel(l2v1z, 29, 4);
 _);

_function days(l2a1z, l2a2z:integer):integer;
_var l2v1z, l2v2z:integer;
 _function L2047(_var l3a1z:integer):integer;
 _(
 l2v1z := trunc(l3a1z / 10000);
 l3a1z := (l3a1z - (l2v1z * 10000));
 l2v2z := (l3a1z _div 100);
 l3a1z := (l3a1z - (l2v2z * 100));
 L2047 := (((l2v1z * 366) + (l2v2z * 31)) + l3a1z);
 _);
_(
 _if (l2a1z <= l2a2z) _then _( days := 0; EXIT _);
 days := L2047(l2a1z) - L2047(l2a2z);
_);

_function age1:integer;
 _(
   age1 := trunc(days(g2079z, sel(g2089z@[10], 0, 20)) / 366);
 _);

_function age2:integer;
 _(
   age2 := trunc(days(g2079z, sel(g2089z@[10], 20, 20)) / 366);
 _);

_function U3215:integer;
_var l2v1z, l2v2z, l2v3z, l2v4z:integer;
_(
 l2v4z := sel(g2089z@[8], 0, 30);
  l2v3z := l2v4z_mod 512;
  l2v4z := l2v4z _div 512;
  l2v2z := l2v4z _mod 4096;
 l2v4z := l2v4z _div 4096;
 l2v1z := l2v4z _MOD 8;
 l2v4z := 0;
 _case l2v1z _of
 1: l2v4z := l2v2z;
 2: l2v4z := l2v2z + l2v3z;
 3: l2v4z := l2v2z * l2v3z _DIV 100 + l2v2z;
 4: _( l2v4z := l2v2z * 1731  _DIV 10000;
 l2v4z := l2v4z * l2v3z _DIV 100 + l2v4z;
 _)
_end;
 U3215 := l2v4z;
 _);
 (*=m+*)
_proced L3262(l2a1z:integer);
_var l2v1z:integer;
_(
 l2v1z := trunc(l2a1z / 10);
 write(l2v1z  :  1);
 write((l2a1z - (l2v1z * 10))  :  1);
 _);
(*=m-*)
 _proced L3300(l2a1z:integer);
_var l2v1z, l2v2z, l2v3z:integer;
_(
 l2v3z := 1000;
 _for l2v1z := 1 _to 4 _do _(
   l2v2z := trunc(l2a1z / l2v3z);
   l2a1z := (l2a1z - (l2v2z * l2v3z));
   l2v3z := (l2v3z _DIV 10);
   write(l2v2z  :  1);
  _);
_);

 _proced U3324(l2a1z, l2a2z:integer);
_var l2v1z:alfa;
l2v2z:sixchars;
_(
 mapia( l2a1z, l2v1z );
 unpck(l2v2z[1],  l2v1z );
 _for l2a1z := (7 - l2a2z) _to 6 _do
  write(l2v2z[l2a1z] : 1+0);
 _);

_proced L3347(l2a1z:char);
 _(
 _if _not (g2102z < 1023) _then  g2102z := 0;
 g2102z := (g2102z + 1);
 l2a1z := l2a1z;
 listA[g2102z] := ;
 _);

_proced U3357;
_var l2v1z:char;
_(
 _for ii := 1 _to g2102z _do _(
  cmd := listA[ii].a;
  l2v1z := ;
  _if _not (l2v1z <> '/') _then  U1533 _else write(l2v1z : 1+0);
 _);
_);

_proced U3377(l2a1z:char; l2a2z:integer);
_(
 _for g2066z := 1 _to l2a2z _do write(l2a1z : 1);
_);

_proced L3414(l2a1z:integer);
_(
 _for g2066z := 1 _to l2a1z _do U1533;
_);

_proced U3425;
_var l2v1z: _array [1..64] _of char;
l2v65z:integer;
l2v66z, l2v67z, l2v68z:integer;
_(
 l2v66z := 0;
 _while _not (INP@ _in digit) _and (INP@ <> etx) _do _(
   l2v66z := (l2v66z + 1);
   _if _not (l2v66z <= 100B) _then  L1572( 98 );
   l2v1z[l2v66z] := INP@;
   get(INP);
 _);
 l2v65z :=   getNum( 10 );
 _for l2v67z := 1 _to l2v65z _do _for l2v68z := 1 _to l2v66z _do _(
   _if _not (l2v1z[l2v68z] <> '/') _then U1533
   _else  write(l2v1z[l2v68z] : 1);
   L3347( l2v1z[l2v68z] );
 _);
 expect( ']' );
_);

(*=m+*)
_proced L3477(l2a1z:integer);
_var l2v1z, l2v2z:integer;
_(
 _if _not (l2a1z <> 0) _then write(sp :  10)
 _else _(
 l2v2z := trunc(((l2a1z) / 10000));
 l2a1z := (l2a1z - (l2v2z * 10000));
 l2v1z := trunc(((l2a1z) / 100));
 L3262( (l2a1z - (l2v1z * 100)) );
 write(dot :1);
 L3262( l2v1z );
 write(dot :1);
 write('19');
 L3262( l2v2z );
  _);
 _);

_proced U3541(l2a1z, l2a2z:integer);
_var l2v1z, l2v2z:integer; l2v3z: alfa; l2v4z:sixchars;
_(
 rdZPCH;
 g2081z := 0;
  l2v3z := listB[l2a2z].a;
 g2080z := ;
 _for l2v1z := 1 _to 2 _do _(
  l2v3z := listB[((((2 * l2a1z) + l2a2z) + l2v1z) + 1)].a;
  _if (l2v3z <> stars) _then _(
   unpck(l2v4z[1],  l2v3z );
   _for l2v2z := 1 _to 6 _do _(
    _if _not (l2v4z[l2v2z] = '*') _then  _(
      write((l2v4z[l2v2z] ) :  1+0);
      g2081z := (g2081z + 1);
    _);
   _);
  _);
 _);
 _if _not (l2a2z = 308) _then  U3377( sp, (g2080z - g2081z) );
_);

_proced U3612(l2a1z, l2a2z:integer);
_(
 _if _not (l2a2z <> 1) _then  l2a2z := 10
 _else  l2a2z := 112;
 U3541( l2a1z, l2a2z );
_);

_proced L3626(l2a1z:integer);
_var l2v1z, l2v2z, l2v3z:integer;
_(
  l2v1z := sel(l2a1z, 14, 7);
  l2v2z := sel(l2a1z, 7, 7);
  l2v3z := sel(l2a1z, 0, 7);
 U3541( l2v1z, 308 );
 _if _not (l2v2z = 0) _then  _(
 write(l2v2z  :  3);
 g2081z := (g2081z + 3);
 _);

 _if _not (l2v3z = 0) _then  _(
 write(chr(11 ) : 1, l2v3z  :  2);
 g2081z := (g2081z + 3);
 _);
 U3377( sp, (g2080z - g2081z) );
_);

_proced L3661(l2a1z:integer);
_(
 U3541( l2a1z, 510 );
_);

_proced modeScreen;
_label 1, 2, 3;
_(
  _select
  INP@ = 'Д': 1: _(
    code(СЧ76013=17ЗЧ,); g2068z := 1; code(17ЛС=ЗЧ76013,);
    writeln('ВКЛЮЧЕНА ВЫДАЧА НА ЭКРАН');
    dpyEnable := true;
    _);
  INP@  = 'Н': 2: _(
    dpyEnable := false;
    writeln('ВЫКЛЮЧЕНА ВЫДАЧА НА ЭКРАН');
    code(СЧ76013=17ЗЧ,); g2068z := 2; code(17ЛУ=ЗЧ76013,);
  _);
  INP@ = etx: 3: _if dpyEnable _then _goto 2 _else _goto 1;
  INP@ = '&': _goto 3;
  true: _( writeln('НЕПОНЯТНО'); _goto 1 _)
  _end;
  g2064z :=   getAlfa( g12z, 3 );
  stats(14);
 _);

 _proced modePrint;
_label 1, 2, 3;
 _(
 _if _not (5 _IN g2325z) _then  _( writeln('ВАМ НЕЛЬЗЯ'); EXIT _);
   _select
   (INP@ = 'Д') : 1: _(
   code(СЧ76013=17ЗЧ,);
   g2068z := 2;
   code(17ЛС=ЗЧ76013,);
   writeln('ВКЛЮЧЕНА ПЕЧАТЬ АЦПУ');
   g2327z := true;
 _if g2328z _then _( code(СЧ=Э06276,); g2328z := false _);
 _);
   (INP@ = 'Н'): 2: _(
    g2327z := false;
   writeln('ВЫКЛЮЧЕНА ПЕЧАТЬ АЦПУ');
   code(СЧ76013=17ЗЧ,);
   g2068z := 1;
   code(17ЛУ=ЗЧ76013,);
   _);
   (INP@ = etx) : 3:  _if g2327z  _then _goto 2 _else _goto 1;
   (INP@ = '&') : _goto 3;
   true: _( writeln('НЕПОНЯТНО'); _goto 1 _)
   _end;
   g2064z :=   getAlfa( g12z, 3 );
 stats( 13 );
 _);
(*=m-*)
_function L4022(l2a1z:integer):integer;
_var l2v1z, l2v2z, l2v3z, l2v4z, l2v5z, l2v6z:integer;
l2v7z:@integer;
_(
  l2v5z := ord(ref(listA)) + 4 - 10;
 l2v1z := 1;
 l2v2z := g2069z;
 _while _not (l2v1z > l2v2z) _do _(
 l2v3z := trunc((l2v1z + l2v2z) / 2);
 l2v7z := ptr(10 * l2v3z + l2v5z);
 l2v6z := l2v7z@;
 l2v4z := ;
 _if (l2v4z <> l2a1z) _then _(
   _if _not (l2v4z <= l2a1z) _then  l2v2z := (l2v3z - 1)
   _else  l2v1z := (l2v3z + 1);
  _) _else _(  L4022 := (l2v3z - 1); EXIT _);
 _);
 L1572( 0 );
 _);

 _function L4062(l2a1z:integer):integer;
_var l2v1z:@integer;
_(
 l2v1z := ptr((ord(ref(listA)) + (10 * l2a1z)) + 4);
 L4062 := l2v1z@;
 _);
(*=m+*)
 _function L4073(l2a1z:integer):integer;
_var l2v1z, l2v2z, l2v3z:integer;
l2v4z:@integer;
_(
 L4073 := l2a1z;
 _if _not (-1 = g2101z) _then  EXIT;
 l2v1z :=   L4022( l2a1z );
 _while _not (l2v1z >= (g2069z - 1)) _do _(
 l2v1z := (l2v1z + 1);
 l2v4z := ptr((ord(ref(listA)) + (10 * l2v1z)) + 4);
 l2v3z := l2v4z@;
 l2v2z := ;
 _if _not ((l2v2z - l2a1z) >= 127) _then
  L4073 := l2v2z
 _else  EXIT;
 _);
 _);

_proced U4163;
_label 1;
_var l2v1z, l2v2z:integer; l2v3z, l2v4z:boolean;
_proced U4125;
_var l3v1z, l3v2z, l3v3z, l3v4z:integer;
_(
 l3v1z :=   L4022( l2v1z );
 l3v2z :=   L4022( l2v2z );
 _if _not (l3v1z >= g2087z) _then  g2087z := l3v1z;
 _if _not (l3v2z <= g2088z) _then  g2088z := l3v2z;
 l3v3z := l3v1z;
 _while _not (l3v3z > l3v2z) _do _(
 l3v4z := trunc(l3v3z / 48);
 g2084z[l3v4z] := [l3v3z _MOD 48] + g2084z[l3v4z];
 l3v3z := (l3v3z + 1);
 _);
_);

_( (* L4163 *)
 l2v3z := false;
 l2v4z := ;
 _if _not (INP@ <> '(') _then  _( get(INP); l2v3z := true _);
  1: _if l2v4z _and _not  l2v3z _then  L1572( 0 );
 l2v1z :=   U2445;
 l2v2z :=   L4073( l2v1z );
 l2v4z := true;
 (sel) _select
  (INP@ = '+') : _(
 U4125;
 _if l2v3z _then  _( get(INP);  _goto 1 _);
  _);
  (INP@ = ')') : _(
 U4125;
 _if l2v3z _then get(INP) _else  L1572( 0 );
  _);
  (INP@ = ',') _or  (INP@ = '&') _or (INP@ = etx): _(
  _if l2v3z _then  L1572( 0 );
   U4125;
  _);
  (INP@ = '-') _or  g2097z :  _(
 _if _not l2v3z  _then  L1572( 0 );
 _if _not g2097z  _then get(INP);
 l2v2z :=   U2445;
 l2v2z :=   L4073( l2v2z );
 cmpswap( l2v1z, l2v2z );
  _goto sel;
  _);
  true:  L1572( 0 )
  _end;
 skipsp;  
_);

_proced U4325;
_label 4331;
_var l2v1z, l2v2z, l2v3z, l2v4z:integer;
l2v5z, l2v6z, l2v7z:boolean;
 _proced L4276;
 _(
 _if l2v5z  _then write(pl:1);
 L3626(   L4062( l2v3z) );
 _if l2v7z _then  _(
  write(minus:1+0);
 L3626(   L4062( l2v4z) );
 l2v1z := (l2v4z + 1);
   _) _else  l2v1z := (l2v3z + 1);
 l2v5z := true;
 _);
_(
 l2v5z := false;
 l2v1z := g2087z;
  4331:
 l2v6z := false;
 l2v7z := ;
 _for l2v2z := l2v1z _to g2088z _do _(
 _if ((l2v2z _MOD 48) _IN g2084z[trunc(l2v2z / 48)]) _then _(
 _if l2v6z _then  _(
 l2v4z := l2v2z;
 l2v7z := true;
 _) _else _(
 l2v3z := l2v2z;
 l2v6z := true;
  _);
 _if l2v2z = g2088z _then  L4276;
  _) _else  _if (l2v2z = g2088z) _then _(
   _if l2v6z _then  L4276;
    EXIT;
  _) _else _(
   _if l2v6z _then  _(
    L4276;
   _goto 4331;
   _);
   (q) _exit q;
  _);
 _);
_);

_proced L4370(l2a1z:integer);
 _(
 rd189;
 _if ( (l2a1z > g2103z) _or  (l2a1z <= 0)) _then 
 L1572( 50 );
g2107z := ptr((ord(ref(listA)) + ((l2a1z - 1) * 20)) + 24);
 _);

_proced U4407(l2a1z, l2a2z:integer);
_var l2v1z, l2v2z, l2v3z, l2v4z:integer; l2v5z:sixchars; l2v11z:char;
_(
 L4370( l2a1z );
 rewrite(INP);
 _if (l2a2z = 1) _then (a) _for l2v1z := 1 _to 16 _do _(
  unpck(l2v5z[1],  g2107z@[l2v1z].a);
 _for l2v2z := 1 _to 6 _do _(
  _if _not (l2v5z[l2v2z] <> etx) _then  _exit a;
  write(INP, l2v5z[l2v2z]:1+0);
   _);
  _);
  g2072z := g2107z@[19].i;
  l2v3z := trunc(((g2107z@[20].i) / 2048));
  l2v4z := (g2107z@[20].i _MOD 2048);
 L1471;
  g2108z.m[0] := ptr(26626 + l2v3z);
 _for l2v1z := 1 _to (l2v4z - 2) _do _(
  unpck(l2v5z[1],  g2108z.m[0]@.a[l2v1z].a );
 _for l2v2z := 1 _to 6 _do _(
 l2v11z := l2v5z[l2v2z];
 _if (l2v11z = etx) _then _(
  _if _not (l2a2z <> 1) _then  write(INP,'^{172{175');
  write(INP, etx:1+0);
  reset(INP);
  EXIT;
 _);
 _if _not ( (l2v11z <> '{175') _or  (l2a2z = 1)) _then  _( _)
 _else  write(INP, l2v11z:1+0);
 _);
 _);
_);

_proced L4530;
_(
 expect( star );
 _while _not ( (INP@ = star) _or  (INP@ = etx)) _do _select
 (INP@ = '/') : _( U1533; L3347( INP@ ); get(INP) _);
 (INP@ = '['): _( get(INP); U3425 _);
 true: _( write(INP@:1); L3347( INP@ ); get(INP) _)
 _end;
 expect( star );
_);

_function L4571(l2a1z:@rec2):boolean;
_var l2v1z:integer;
_(
 L4571 := false;
  _for g2066z := 1 _to l2a1z@.f2[8] _do _(
  l2v1z := g2257z[l2a1z@.f5[g2066z]].i;
  _if _not ( (l2v1z < l2a1z@.f0[g2066z]) _or  (l2v1z > l2a1z@.f2[g2066z])) _then _( _)
  _else EXIT;
 _);
 L4571 := true;
_);

_proced U4620;
_var l2v1z:integer;
_(
  _if _not (g2257z[3].i = 0) _then  l2v1z := g2257z[g2257z[3].i].i;
  _case g2257z[2].i _of
  0:  g2257z[0].p@.i := (g2257z[0].p@.i + 1);
  1:  g2257z[0].p@.i := l2v1z;
  2:  g2257z[0].p@.i := (g2257z[0].p@.i + l2v1z);
  3:  g2257z[0].p@.i := (g2257z[0].p@.i + l2v1z);
  4:  _if _not (l2v1z >= g2257z[0].p@.i) _then  g2257z[0].p@.i := l2v1z;
  5:  _if _not (l2v1z <= g2257z[0].p@.i) _then  g2257z[0].p@.i := l2v1z
  _end;
 _);
_proced U4664;
_var l2v1z, l2v2z:integer;
_(
 _if g2290z[0] _then  g2261z[0] := sel (g2089z@[9], 40, 2);
 _if g2290z[1] _then  g2261z[1] := sel (g2089z@[10], 0, 20);
 _if g2290z[2] _then  g2261z[2] :=   age1;
 _if g2290z[3] _then  g2261z[3] := sel (g2089z@[9], 28, 6);
 _if g2290z[4] _then  g2261z[4] := sel (g2089z@[9], 0, 8);
 _if g2290z[5] _then  g2261z[5] := sel (g2089z@[9], 8, 8);
 _if g2290z[6] _then  g2261z[6] := sel (g2089z@[9], 16, 8);
 _if g2290z[7] _then  g2261z[7] := sel (g2089z@[9], 24, 3);
 _if g2290z[8] _then  g2261z[8] := sel (g2089z@[8], 38, 5);
 _if g2290z[9] _then  g2261z[9]:= sel (g2089z@[8], 43, 5);
 _if g2290z[10] _then  g2261z[10] := sel (g2089z@[11], 0, 13);
 _if g2290z[11] _then  g2261z[11] := sel (g2089z@[9], 46, 2);
 _if g2290z[12] _then  g2261z[12] := sel (g2089z@[9], 42, 4);
 _if g2290z[14] _then  g2261z[14] := sel (g2089z@[11], 13, 23);
 _if g2290z[15] _then  g2261z[15] := sel (g2089z@[10], 20, 20);
 g2261z[16] := g2286z;
 _if g2290z[17] _then  g2261z[17] :=   age2;
 _if g2290z[18] _then  g2261z[18] := sel (g2089z@[10], 40, 8);
 _if g2290z[19] _then  g2261z[19] := sel (g2089z@[12], 28, 20);
 _if g2290z[20] _then  g2261z[20] :=   U3215;
 _if g2290z[21] _then  g2261z[21] := sel (g2089z@[11], 43, 3);
 _if g2290z[22] _then  g2261z[22] := sel (g2089z@[11], 36, 5);
 _if g2290z[23] _then  g2261z[23] := sel (g2089z@[11], 41, 2);
 _if g2290z[24] _then  g2261z[24] := sel (g2089z@[11], 46, 2);
  
_for l2v1z := 1 _to g2252z _do _(
  g2254z := g2108z.z[l2v1z];
  g2255z := g2254z@.b;
 _if L4571( g2255z) _then _(
  _if g2257z[1].b _then  _(
  g2257z[2].i := g2255z@.f0[10];
  g2257z[3].i := g2255z@.f0[13];
 _);
 _for l2v2z := 1 _to g2253z _do _(
 g2256z := g2131z[l2v2z];
 _if L4571( g2256z) _then _(
 g2255z@.f0[12] := (g2255z@.f0[12] + 1);
 g2256z@.f0[12] := (g2256z@.f0[12] + 1);
  _if _not g2257z[1].b _then  _(
  g2257z[2].i := g2256z@.f0[10];
  g2257z[3].i := g2256z@.f0[13];
 _);
  g2257z[0].p := ref(g2254z@.a[l2v2z]);
 U4620;
  _);
   _);
  _);
   _);

_);
(*=m-*)
_proced U5062;
_label 5160;
_var l2v1z:@page;
l2v2z, l2v3z, l2v4z, l2v5z, l2v6z, l2v7z, l2v8z:integer;
_(
 l2v1z := ptr(ord(ref(listA)) + 4);
 rdDB;
 _if _not g2083z _then  _(
 g2087z := 0;
 g2088z := (g2069z - 1);
 _);
 _for l2v6z := g2087z _to g2088z _do _(
 _if ((l2v6z _MOD 48) _IN g2084z[trunc(((l2v6z) / 48))]) _then _(
 l2v7z := (10 * l2v6z);
 g2090z := ptr(ord(l2v1z) + l2v7z);
 l2v8z := g2090z@[1];
 l2v2z := ;
  g2071z := sel(g2090z@[2], 0, 16);
 (a) _for l2v3z := 4 _to 7 _do _for l2v4z := 0 _to 3 _do _(
 g2068z := (12 * l2v4z);
  g2072z := sel (g2090z@[l2v3z], g2068z, 11);
  _if _not (g2072z <> 0) _then _exit a;
 rdMyZone;
 _for l2v5z := 0 _to (g2070z - 1) _do _(
  g2089z := ptr((17 * l2v5z) + 26628);
  g2286z := sel(g2089z@[12], 0, 21);
  _if _not (g2286z <> l2v2z) _then  U4664;
   _);
   _);
  _);
 5160:
 _);
_);

_proced U6771;
_var l2v1z, l2v2z, l2v3z, l2v4z, l2v5z:integer;
l2v6z:boolean;

_proced L5163(_var l3a1z:@rec2);
_var l3v1z:@page;
_(
 new(l3a1z);
 _if l3a1z = _NIL _then  L1572( 70 );
 l3v1z := ptr(ord(l3a1z));
  l3v1z@[9].i := 0;
  l3v1z@[11].i := 0;
 l3v1z@[12] := ;
 l3v1z@[13] := ;
 l3v1z@[14] := ;
 l3v1z@[10] := ;
 _);

_proced L5204(_var l3a1z:@arr120);
_type pp=_record a:_array[1..120] _of integer; b:integer _end;
_var l3v1z:@rec2;
l3v2z:integer;
l3v3z:@pp;
_(
 new(l3a1z);
 _if l3a1z = _NIL _then  L1572( 87 );
 L5163( l3v1z );
 l3v3z := ptr(ord(l3a1z));
  l3v3z@.b := ord(l3v1z);
 _for l3v2z := 1 _to 120 _do l3v3z@.a[l3v2z] := 0;
_);

_proced L5232(l3a1z:integer);
_(
 _if l2v6z _then l2v4z := (l2v4z + l3a1z)
 _else l2v5z := (l2v5z + l3a1z);
_);

_proced L5242;
_(
 _if ( (g2076z _IN [1,2,3,17]) _or  (g2076z > 28)) _then 
   L1572( 30 );
_);

_proced L5253;
_(
 _while (ord(INP@) _IN [18,23]) _do _(
 _if _not (ord(INP@) <> 18) _then l2v2z := (l2v2z + 1)
 _else _(
   l2v3z := (l2v3z + 1);
   _if _not (l2v3z <= 1) _then  L1572( 114B );
 _);
 get(INP);
 _);
_);

_proced L5275;
_(
 
 _while (ord(INP@) _IN [19,24]) _do _(
  _if (ord(INP@) = 19) _then _(
   l2v2z := (l2v2z - 1);
   _if _not (l2v2z >= 0) _then  L1572( 115B );
  _) _else _(
   l2v3z := (l2v3z - 1);
   _if _not (l2v3z = 0) _then  L1572( 113B );
  _);
  get(INP);
  _);
_);

_proced L5323;
 _(
 _if ( (l2v2z <> 0) _or  (l2v3z <> 0)) _then L1572( 112B );
_);

_proced U6147;
_var l3v1z, l3v2z:integer;
l3v3z:_array [1..1] _of integer;
l3v4z, l3v5z, l3v6z, l3v7z, l3v8z, l3v9z, l3v10z, l3v11z, l3v12z, l3v13z, l3v14z, l3v15z, l3v16z, l3v17z,
l3v18z, l3v19z, l3v20z, l3v21z, l3v22z, l3v23z, l3v24z, l3v25z:integer;

_function L5333(l4a1z:integer):boolean;
_var l4v1z:integer;
_(
 L5333 := true;
 _for l4v1z := 1 _to g2252z _do 
  _if g2108z.z[l4v1z]@.a[l4a1z].i <> 0 _then  _(
   L5333 := false;
   EXIT;
 _);
_);

_proced L5351;
 _(
 get(INP);
 l3v2z :=   getNum( 10 );
 _if _not (l3v2z <> 0) _then  l3v2z := 1;
_);

_proced U5363;
_var l4v1z:integer;
_(
 _for l4v1z := l3v2z _to g2252z _do _(
  U3377( sp, g2108z.z[l4v1z]@.b@.f0[15] );
 write('I');
  _);
 U1533;
_);

_proced L5527(l4a1z:boolean);
_var l4v1z, l4v2z, l4v3z, l4v4z, l4v5z, l4v6z:integer;
l4v7z:@arr120;
_proced U5404(l5a1z, l5a2z:integer);
_var l5v1z, l5v2z, l5v3z:integer;
l5v4z:_array [1..12] _of integer; l5v16z:integer;
_(
 _if _not (l5a1z <> 0) _then U3377( sp, (l5a2z - 1) )
 _else _(
 l5v2z := 0;
 _repeat 
 l5v3z := l5a1z _MOD 10;
 l5v16z := ;
 l5a1z := trunc(l5a1z / 10);
 l5v2z := l5v2z + 1;
 l5v4z[l5v2z] := l5v16z;
  _until (l5a1z = 0);
 U3377( sp, ((l5a2z - l5v2z) - 1) );
 _for l5v1z := l5v2z _downto 1 _do write(chr(l5v4z[l5v1z] ):1+0);
 _)
_);
_proced L5450;
_(
 U5404( trunc((l4v2z / l4v5z)), (l4v3z - 2) );
   write(dot:1); (*=m+*)
 U5404( trunc(((((l4v2z _MOD l4v5z) * 10)) / (l4v5z))), 1 );
 _);
 _proced U5474;
_var l5v1z, l5v2z:integer;
_(
 l5v2z := (l4v3z - 11);
 l5v1z := trunc(l5v2z / 2);
 l5v2z := (l5v2z - l5v1z);
 U3377( sp, l5v1z );
  _case l4v4z _of
  7: U3612( l4v2z, 1 );
  22:  L3661( l4v2z )
  _end;
 U3377(sp, l5v2z );
 _);

_( (* L5527 *)
_for l4v1z := l3v2z _to g2252z _do _(
  l4v7z := g2108z.z[l4v1z];
 _if l4a1z _then  l4v2z := l3v3z[l4v1z]
 _else l4v2z := l4v7z@.a[l3v1z].i;

  l4v3z := l4v7z@.b@.f0[15];
  l4v5z := l4v7z@.b@.f0[12];
  _if g2257z[1].b _then  _(
  l4v6z := l4v7z@.b@.f0[10];
  l4v4z := l4v7z@.b@.f0[14];
 _);
  _if _not g2257z[1].b _then _(
   _if l4a1z _then  L1572(39);
  l4v7z := ptr(ord(g2131z[l3v1z]));
  l4v6z := l4v7z@.a[10].i;
  l4v4z := l4v7z@.a[14].i;
  _);
 _if _not ( (l4v4z = 0) _or  l4a1z )
 _and L5333( l3v1z) _then _(  rewrite(output); EXIT; _);
 _case l4v6z _of
0: U5404( l4v2z, l4v3z );
1: _if l4v4z <> 0 _then U5474 _else U5404( l4v2z, l4v3z );
2: U5404( l4v2z, l4v3z );
3: _if (l4v5z = 0) _then  U5404( 0, l4v3z ) _else  L5450;
4: _(
 _if _not (l4v2z <> 999999) _then  l4v2z := 0;
 U5404( l4v2z, l4v3z );
  _);
5: U5404( l4v2z, l4v3z )
  _end;
 write(sp : 1+0);
 write('I');
  
_);
 U1533;
_);

_proced U5726;
_var l4v1z, l4v2z:integer;

_proced U5653;
_var l5v1z, l5v2z:integer;
_(
 _for l5v1z := (l4v1z + 1) _to l4v2z _do 
   _for l5v2z := 1 _to g2253z _do
    g2108z.z[l4v1z]@.a[l5v2z].i := g2108z.z[l4v1z]@.a[l5v2z].i + g2108z.z[l5v1z]@.a[l5v2z].i;
 _for l5v1z := 1 _to (g2252z - l4v2z) _do 
 _for l5v2z := 1 _to g2253z _do 
   g2108z.z[l4v1z + l5v1z]@.a[l5v2z] := g2108z.z[l4v2z + l5v1z]@.a[l5v2z];
 g2252z := ((g2252z - l4v2z) + l4v1z);
 _);

_( (* U5726 *)
expect( '$' );
 _while _not ( (INP@ = '$') _or  (INP@ = etx)) _do _(
 _select
  (INP@ = 'K') : _(
 get(INP);
 expect( '(');
 (L5744) _(
 U2564( l4v1z, l4v2z );
 _if (l4v1z > l4v2z) _or  (l4v1z < 1) _or (l4v2z > g2252z) _then
   L1572( 40 );
 U5653;
 _if _not (INP@ <> (',')) _then  get(INP);
  _if _not ( (INP@ = ')') _or  (INP@ = etx)) _then  _goto L5744;
  _);
 expect( ')' );
  _);
  (INP@ = 'С') : _(
 get(INP);
 expect( '=' );
 l3v1z :=   getNum( 10 );
 _if _not (l3v1z <= g2253z) _then  L1572( 39 );
  _);
true: L1572( 39 )
  _end;
 _if _not (INP@ <> ',') _then get(INP);
 _);
 expect( '$' );
_);

_proced U6026;
_var l4v1z, l4v2z, l4v3z, l4v4z:integer;
_(
 _for l4v1z := 1 _to g2252z _do l3v3z[l4v1z] := 0;
 expect( '(' );
 _while INP@ _in digit _do _(
 U2564( l4v3z, l4v4z );
 _if (l4v3z > l4v4z) _or  (l4v3z< 1) _or (l4v4z > g2253z) _then
 L1572( 40 );
 _for l4v1z := l3v2z _to g2252z _do 
 _for l4v2z := l4v3z _to l4v4z _do 
  l3v3z[l4v1z] := g2108z.z[l4v1z]@.a[l4v2z].i + l3v3z[l4v1z];
 _if _not (INP@ <> ',') _then   get(INP);
  _);
 expect(')');
 L5527( true )
 _);

_proced U6106;
_var l4v1z, l4v2z:integer;
l4v3z: char;
_(
 g2102z := 0;
 L4530;
 l4v3z := INP@;
 L5351;
 L5275;
 l4v2z :=   getNum( 10 );
 L5275;
 _for l4v1z := 1 _to l4v2z _do _(
 _if _not (l4v1z = 1) _then  U3357;
  _select 
  l4v3z = ':':  _( l3v1z := (l3v1z + 1); L5527( false )  _);
  (l4v3z = '-') : U5363;
  true: L1572( 59 )
  _end;
   _);
_);

_( (* U6147 *)
  l3v1z := 0;
 (L6152) _(
 _if _not (INP@ <> '$') _then  U5726;
 L5253;
 _if _not (l2v3z <= 0) _then  U6106 
 _else _(
 L4530;
 _select
  (INP@ = ':') : _( L5351; l3v1z := (l3v1z + 1); L5527( false ) _);
  (INP@ = '-') :  _( L5351; U5363 _);
  (INP@ = '+') :  _( L5351; U6026 _);
  (INP@ = etx) : EXIT;
  true: L1572( 59 )
  _end
  _);
 L5323;
 _goto L6152 _)
_);
_proced U6264;
_var l3v1z:integer;

_proced U6216(l4a1z, l4a2z:integer);
_var l4v1z:integer; l4v2z: @arr120;
_(
 _if ( (l4a1z = 0) _or  ((l2v4z + l4a2z) > g2252z)) _then 
   L1572( 71 );
 _for l4v1z := (l2v4z + 1) _to (l2v4z + l4a2z) _do _(
  l4v2z := g2108z.z[l4v1z];
  l4v2z@.b@.f0[15] := l4a1z;
   _);
 l2v4z := (l2v4z + l4a2z);
 _);

_proced U6245;
_var l4v1z:integer;
_(
 l3v1z :=   getNum( 10 );
 L5275;
 l4v1z :=   getNum( 10 );
 L5275;
 U6216( l3v1z, l4v1z );
 _);

_( (* U6264 *)
  _if _not l2v6z  _then  L1572( 80 );
 (L6271) _(
 expect( 'Ф' );
 _if _not (l2v3z <= 0) _then  U6245
 _else (L6276) _(
 l3v1z :=   getNum( 10 );
 U6216( l3v1z, 1 );
  _if _not (INP@ <> ';') _then  _(
 get(INP);
 _goto L6276;
 _);
  _);
 L5275;
 _if _not (l2v2z <= 0) _then  _(
 L5253;
 _goto L6271;
 _);
  _)
_);
 _proced L6437;
_proced L6316(_var l4a1z:rec2);
_(
  L5242;
  l4a1z.f0[11] := (l4a1z.f0[11] + 1);
  _if _not (l4a1z.f0[11] <= 3) _then  L1572( 19 );
  l4a1z.f5[l4a1z.f0[11]] :=  g2076z;
  l4a1z.f0[l4a1z.f0[11]] :=  g2077z;
  l4a1z.f2[l4a1z.f0[11]] :=  g2078z;
  L1665;
_);

_proced U6344;
_var l4v1z, l4v2z, l4v3z, l4v4z, l4v5z, l4v6z:integer;
_(
 L2605;
 _if (g2076z <> 0) _then _(
 expect( '=' );
 _if  INP@ _in letter _then _(
 get(INP);
 L5275;
 l4v2z :=   getNum( 10 );
 expect( '-' );
 l4v3z :=   getNum( 10 );
 l4v1z := ((l4v3z - l4v2z) + 1);
 g2077z := (l4v2z - 1);
 g2078z := ;
 _if l2v6z _then  _(
 l4v4z := (l2v4z + 1);
 l4v5z := (l2v4z + l4v1z);
 _) _else _(
 l4v4z := (l2v5z + 1);
 l4v5z := (l2v5z + l4v1z);
  _);
 _for l4v6z := l4v4z _to l4v5z _do _(
 g2077z := (g2077z + 1);
 g2078z := ;
 _if l2v6z _then 
   L6316( g2108z.z[l4v6z]@.b@ )
 _else 
   L6316( g2131z[l4v6z]@ );

   _);
_)
  _else 
   L1572( 46 );
  _) _else _(
 L5275;
 l4v1z :=   getNum( 10 );
  _);
 L5232( l4v1z );
_);

_( (* L6437 *)
  (L6441) _(
  expect( 'O' );
 _if _not (l2v3z <= 0) _then U6344
  _else (L6446) _(
 L2605;
 _if (g2076z <> 0) _then _(
 expect( '=' );
 U2664;
 _if l2v6z _then L6316( g2108z.z[l2v4z+1]@.b@ )
 _else L6316( g2131z[(l2v5z + 1)]@ );
  _);
 _if _not (INP@ <> ',') _then  _(
 get(INP);
 _goto L6446;
 _) _else _if _not (INP@ <> ';') _then  _(
 get(INP);
 L5232( 1 );
 _goto L6446;
 _);
  _if (INP@ _IN [')',']']) _then  L5232( 1 );
  _);
 L5275;
 _if _not (l2v2z <= 0) _then  _( L5253; _goto L6441 _);
  _);
_);

 _proced U6611;
_var l3v1z:integer;
_proced L6515(l4a1z:integer);
_var l4v1z:integer; l4v2z:@rec2;
_(
 L5242;
 _if _not (g2076z = 0) _then  L1665;
 _if l2v6z _then _(
 _if _not ((l2v4z + l4a1z) <= g2252z) _then  L1572( 48 );
 _for l4v1z := (l2v4z + 1) _to (l2v4z + l4a1z) _do _(
  l4v2z := g2108z.z[l4v1z]@.b;
 l4v2z@.f0[10] := l3v1z;
 l4v2z@.f0[13] := g2076z;
 _if _not (l3v1z <> 4) _then  memset( l4v1z, 999999 );
   _);
  _) _else _(
 _if _not ((l2v5z + l4a1z) <= g2253z) _then  L1572( 47 );
 _for l4v1z := (l2v5z + 1) _to (l2v5z + l4a1z) _do _(
 l4v2z := g2131z[l4v1z];
 l4v2z@.f0[10] := l3v1z;
 l4v2z@.f0[13] := g2076z;
 _if _not (l3v1z <> 4) _then  U1647( l4v1z, 999999 );
   _);
  _);
 L5232( l4a1z );
 _);

_proced L6600;
 _(
 L2605;
 L5275;
 L6515(   getNum( 10) );
 _);

_( (* U6611 *)
  g2257z[1].b := l2v6z;
 (q) _( _select
  _not (INP@ <> ':') : l3v1z := 0;
  _not (INP@ <> '=') : l3v1z := 1;
  _not (INP@ <> '+') : l3v1z := 2;
  _not (INP@ <> '/') : l3v1z := 3;
  _not (INP@ <> '<') : l3v1z := 4;
  _not (INP@ <> '>') : l3v1z := 5;
  true: L1572( 49 )
  _end;
 get(INP);
 _if _not (l2v3z <= 0) _then L6600
 _else (L6654)_(
 L2605;
 L6515( 1 );
  _if _not (INP@ <> ';') _then  _( get(INP); _goto L6654 _);
  _);
 L5275;
 _if _not (l2v2z <= 0) _then  _( L5253; _goto q _);
 _)
_);

_proced L6744;
_proced L6672(l4a1z:integer);
_var l4v1z:integer;
_(
 _if l2v6z _then _(
 _if _not ((l2v4z + l4a1z) <= g2252z) _then  L1572( 48 );
 _for l4v1z := (l2v4z + 1) _to (l2v4z + l4a1z) _do 
  g2108z.z[l4v1z]@.b@.f0[14] := g2076z;
  _) _else _(
 _if _not ((l2v5z + l4a1z) <= g2253z) _then  L1572( 47 );
 _for l4v1z := (l2v5z + 1) _to (l2v5z + l4a1z) _do 
  g2131z[l4v1z]@.f0[14] := g2076z;
  _);
 L5232( l4a1z );
_);

_proced L6733;
 _(
 L2605;
 L5275;
 L6672(   getNum( 10) );
 _);

_( (* L6744 *)
  (L6746) _(
 expect( 'П' );
 _if _not (l2v3z <= 0) _then L6733
 _else (L6753) _(
   L2605;
   L6672( 1 );
  _if _not (INP@ <> ';') _then _( get(INP); _goto L6753 _);
  _);
  L5275;
 _if _not (l2v2z <= 0) _then  _( L5253; _goto L6746 _);
  _);
_);

_( (* U6771 *)
 rdDB;
 _if _not (INP@ <> '(') _then  _(
 U4163;
 g2083z := true;
 _);
 _if g2327z _then  _(
 U3377( '-', 128 );
 U1533;
 write('СОСТОЯНИЕ БАЗЫ:');
  L3477( sel(listA[3].i, 24, 24) );
 write(' СОСЧИТАНО:');
 L3477( g2079z );
 U1533;
 _);
 _if _not g2083z _then 
 _for l2v1z := 0 _to 2 _do g2084z[l2v1z] := [0..47];

 _if g2083z _then  _(
 write('ПОДРАЗДЕЛЕНИЯ=(');
 U4325;
 write(cpar : 1);
 U1533;
 _);
 _if INP@ _in digit _then U4407(   getNum( 10) , 2 );
l2v2z := 0;
 l2v3z := ;
 g2102z := ;
 L4530;
 expect( ':' );
 l2v6z := true;
 g2257z[1] := ;
 g2252z :=   getNum( 10 );
_if  ( (g2252z = 0) _or  (g2252z > 23)) _then  L1572( 82 );
_for l2v1z := 1 _to g2252z _do L5204( g2108z.z[l2v1z] );
  (L7072) _(
 L5253;
 l2v4z := 0;
 l2v5z := ;
 _select
  _not (INP@ <> 'Ф') :  U6264;
  _not (INP@ <> 'О') :  L6437;
  _not (INP@ <> 'П') :  L6744;
  (INP@ _IN ['+','/','=','<','>',':']) :  U6611;
  true: L1572( 84 )
 _end;
 _if l2v6z _then _(
 _if _not (l2v4z = g2252z) _then  L1572( 72 );
  _) _else  _if _not (l2v5z = g2253z) _then  L1572( 69 );
 L5323;
 _if _not (INP@ = ':') _then _goto L7072 _else  get(INP);
 _if l2v6z  _then _(
 l2v6z := false;
 g2253z :=   getNum( 10 );
 _if ( (g2253z = 0) _or  (g2253z > 120)) _then  L1572( 81 );
 _for l2v1z := 1 _to g2253z _do  L5163( g2131z[l2v1z] );
 _goto L7072;
 _);
 U5062;
 U6147;
 L3414( (g2105z - g2106z) );
 _if g2327z _then  _(
 U3377( '-', 128 );
 U1533;
 _);
 _)
_);

(*=m-*)
_proced U7173;
_var l2v1z, l2v2z, l2v3z, l2v4z, l2v5z:integer; l2v6z: sixchars;
_(
  _if INP@ _in digit _then  U2564( l2v4z, l2v5z )
  _else _(
 l2v4z := 1;
 l2v5z := g2103z;
  _);
 _if _not (l2v4z <= g2103z) _then  _(
 writeln('ЧИСЛО ТАБЛИЦ=', g2103z  :  2);
 EXIT;
 _);
_if _not (l2v4z >= 1) _then  l2v4z := 1;
 _if _not (l2v5z <= g2103z) _then  l2v5z := g2103z;
 _for l2v1z := l2v4z _to l2v5z _do _(
 g2107z := ptr((ord(ref(listA)) + (l2v1z * 20)) + 4);
  write(spaces, 'ТАБЛИЦА', g2107z@[18].i  :  3, ' ДАТ=');
  L3477( g2107z@[17].i );
 _if g2065z  _then  _(
 write(' ЗОНА=');
  U3324( g2107z@[19].i, 4 );
 write(' ЯЧ=');
  (*=m+*)
  L3300( (trunc(((g2107z@[20].i) / 2048)) + 2) );
 write(minus : 1);
  L3300( ((g2107z@[20].i _MOD 2048) + 1) );
 _);
 U1533;
 (a) _for l2v2z := 1 _to 16 _do _(
  unpck(l2v6z[1],  g2107z@[l2v2z].a );
 _for l2v3z := 1 _to 6 _do
 _if (l2v6z[l2v3z] = etx) _then  _exit a
 _else write(l2v6z[l2v3z]:1);
 _);
 U1533;
 _);  
_);

_proced L7326;
_(
 writeln('СДЕЛАНО');
_);

 _proced U10270;
_label 10274, 10276;
_var l2v1z, l2v2z:integer;  l2v3z:alfa; l2v4z: boolean;
 _proced L7333(l3a1z:integer);
 _(
   writeln('ОШИБКА ТИП=', l3a1z  :  2);
 _GOTO 10274;
 _);

 _proced L7343;
 _(
 l2v1z :=   getNum( 8 );
 l2v2z := (l2v1z _MOD 4096);
 l2v1z := trunc(((l2v1z) / 4096));
 _);

_proced L7357;
 _(
 writeln('   В СУББЛОКЕ "АРХИВ" ИСПОЛНЯЮТСЯ:
 А) КАТАЛОГ <РЕЖИМ>[<ЗАДАНИЕ>] - РАБОТА С КАТАЛОГОМ АРХИВА
 Б) ТЕСТ    <НУЗЗЗЗ>           - ТЕСТОВЫЙ ПРОПУСК ТАБЛИЦ
 В) ВВОД   <ТАБЛИЦА>           - ВВОД ТАБЛИЦЫ В АРХИВ
 Г) ПУЛЬТ  <НУЗЗЗЗ>            - ВВОД В АРХИВ ИЗ НУЗЗЗЗ
 Д) ИСКЛЮЧИТЬ <НОМТАБ>         - ИСКЛЮЧЕНИЕ ТАБЛИЦЫ ИЗ АРХИВА
 Е) ЗАПИСАТЬ <НОМТАБ> <НУЗЗЗЗ> - ЗАПИСЬ ТАБЛИЦЫ В НУЗЗЗЗ
 Ж) УПЛОТНИТЬ                  - УПЛОТНЕНИЕ АРХИВА
 З) ВЫХОД                      - ВЫХОД ИЗ СУББЛОКА
');
_);

_proced U7463;
_label 7475;
_var l3v1z, l3v2z:integer;  l3v3z: alfa;
_proced U7364;
_var l4v1z, l4v2z, l4v3z, l4v4z:integer;
_(
 _while _not ( (INP@ = etx) _or  (INP@ = '&')) _do _(
 l4v3z :=   getNum( 8 );
 l4v4z := ;
 _if _not (INP@ <> '-') _then  _(
 get(INP);
 l4v4z :=   getNum( 8 );
 _);
 _for l4v1z := l4v3z _to l4v4z _do _(
 _if _not (g2104z < 21) _then  L7333( 20 );
 g2104z := (g2104z + 1);
 listA[2] := ;
 l4v2z := l4v1z;
  listA[(g2104z + 2)] := ;
   _);
 _if _not (INP@ <> ',') _then  get(INP);
 _);
 _);

_proced L7432;
 _(
 writeln('ЗОНА СВ.ЯЧЕЕК');
 _for l3v1z := 1 _to g2104z _do _(
   l3v3z := listA[(l3v1z + 2)].a;
 l3v2z := ;
 U3324( (l3v2z _MOD 2048), 4 );
 write((1022 - trunc(((l3v2z) / 2048)))  :  7);
 U1533;
   _);
 _);

_( (* U7463 *)
 rd189;
 l2v4z :=   getAlfa( l3v3z, 3 );
 _select
  ('ФОР' = l3v3z) : _( U7364; 7475: L1460; L7326 _);
  ('ИСК' = l3v3z) : _(
 _for l3v1z := 2 _to 23 _do listA[l3v1z].i := 0;
 _goto 7475;
  _);
  ('ПОК' = l3v3z) : L7432;
  ('СПИ' = l3v3z) : U7173;
  true: L7333( 21 )
  _end; 
_);

_proced U7525;
_var l3v1z, l3v2z, l3v3z, l3v4z, l3v5z, l3v6z, l3v7z:integer;
l3v8z:boolean;
l3v9z:alfa;
l3v10z:sixchars;
l3v16z, l3v17z:integer;
l3v18z:_array [1..1020] _of word;
_(
 rd189;
 _if _not (g2103z < 50) _then  L7333( 22 );
 g2107z := ptr((ord(ref(listA)) + (g2103z * 20)) + 24);
 l3v5z := (g2103z + 1);
 l3v8z := false;
 l3v9z := '000000';
  g2107z@[18].i := l3v5z;
  (outer) _for l3v1z := 1 _to 16 _do _(
  unpck(l3v10z[1],  l3v9z );
  (loop)_for l3v2z := 1 _to 6 _do _(
 _if _not (INP@ <> '*') _then  _(
 l3v8z := true;
 l3v10z[l3v2z] := etx;
 _exit loop;
  _);
  l3v10z[l3v2z] := INP@;
 _if _not (INP@ <> etx) _then  L7333( 24 );
 get(INP);
 _);
  pck(l3v10z[1], g2107z@[l3v1z].a);
  _if l3v8z  _then  _exit outer;
   _);
 _if _not l3v8z _then  L7333( 25 );
% L7611:,BSS,;
 (outer) _for l3v1z := 1 _to 1020 _do _(
 unpck(l3v10z[1],  l3v9z );
 (loop)_for l3v2z := 1 _to 6 _do _(
 l3v10z[l3v2z] := INP@;
 l3v8z := true;
 _if (INP@ = etx) _then _exit loop
  _else _(   get(INP); l3v8z := false _);
   _);
 l3v4z := l3v1z;
  pck(l3v10z[1], l3v18z[l3v4z].a);
  _if _not ( (INP@ <> etx) _or  _not l3v8z) _then  _exit outer;
  _);
_if _not (INP@ = etx) _then  L7333( 26 );
 (loop) _for l3v1z := 1 _to g2104z _do _(
  l3v9z := listA[(l3v1z + 2)].a;
 l3v3z := ;
 g2072z := (l3v3z _MOD 2048);
 _if _not (g2072z <> 0) _then  L7333( 27 );
 _if _not (l3v4z > (1020 - trunc(l3v3z / 2048))) _then  _(
 l3v7z := (l3v1z + 2);
 _exit loop;
 _);
 _if _not (l3v1z <> g2104z) _then  L7333( 28 );
   _);
 L1471;
  l3v9z := pg32ptr@[1].a;
 l3v3z := ;
  g2108z.z[0] := ptr(26626 + l3v3z);
 l3v6z := ((((l3v3z * 2048) + l3v3z) + l3v4z) + 2);
  g2108z.z[0]@.a[1].i := l3v5z;
  g2108z.z[0]@.a[2].i := l3v6z;
 _for l3v1z := 1 _to l3v4z _do g2108z.m[0]@.a[l3v1z] := l3v18z[l3v1z];
 l3v1z := ((l3v3z + l3v4z) + 2);
 pg32ptr@[1] := ;
 L1500;
  l3v9z := listA[l3v7z].a;
 l3v2z := ;
 l3v2z := ((l3v2z _MOD 2048) + (l3v1z * 2048));
 listA[l3v7z] := ;
  g2107z@[19].i := g2072z;
  g2107z@[20].i := l3v6z;
  g2107z@[17].i := g2079z;
 g2103z := (g2103z + 1);
 listA[1] := ;
 L1460;
 L7326;
 _);

_proced U7761;
_var l3v1z, l3v2z, l3v3z, l3v4z:integer;
l3v5z: alfa;
l3v6z:sixchars;
_(
 l3v3z :=   getNum( 10 );
 L7343;
  write('ТАБЛИЦА=', l3v3z:2, ' --> НУ=');
 U3324( l2v1z, 2 );
 write(' ЗЗЗЗ=');
 U3324( l2v2z, 4 );
 writeLN;
 writeln('ПОДТВЕРДИТЕ <ДА,НЕТ>');
 TTIN( 2 );
 _if _not (INP@ = 'Д') _then  _GOTO 10274;
 U4407( l3v3z, 1 );
 l3v5z := '      ';
 l3v1z := 0;
 _repeat
 unpck(l3v6z[1],  l3v5z );
 (loop) _for l3v2z := 1 _to 6 _do _(
 _if _not (INP@ <> etx) _then  _exit loop;
 l3v6z[l3v2z] := INP@;
 get(INP);
   _);
  pck(l3v6z[1], pg32ptr@[l3v1z].a);
 l3v1z := (l3v1z + 1);
  _until (INP@ = etx);
 wrpg32( l2v1z, l2v2z );
 L7326;
 _);

_proced U10057;
_var l3v1z, l3v2z, l3v3z, l3v4z, l3v5z, l3v6z, l3v7z, l3v8z:integer;
l3v9z, l3v10z, l3v11z: @arr;
_(
 rd189;
 L4370( g2103z );
 g2107z := g2107z;
 l3v11z := ;
  l3v4z := g2107z@[19].i;
  l3v6z := g2107z@[20].i;
 L4370(   getNum( 10) );
 g2107z := g2107z;
 l3v10z := ;
  l3v3z := g2107z@[19].i;
  l3v5z := g2107z@[20].i;
  l3v7z := g2107z@[18].i;
 _for l3v1z := 1 _to 20 _do _(
  l3v10z@[l3v1z] := l3v11z@[l3v1z];
  l3v11z@[l3v1z].i := 0;
   _);
 g2072z := l3v3z;
 L1471;
 l3v9z := ptr(trunc((l3v5z / 2048)) + 26626);
 _for l3v1z := 1 _to (l3v5z _MOD 2048) _do l3v9z@[l3v1z].i := 0;
  l3v8z := pg32ptr@[1].i;
 l3v2z := ;
 _if _not ((l3v5z _MOD 2048) <> l3v2z) _then  _(
 l3v2z := trunc(((l3v5z) / 2048));
 pg32ptr@[1] := ;
 _);
 L1500;
 _if _not (l3v10z = l3v11z) _then  _(
 l3v7z := l3v7z;
 l3v10z@[18] := ;
 g2072z := l3v4z;
 L1471;
  g2108z.z[0] := ptr(trunc(((l3v6z) / 2048)) + 26626);
  g2108z.z[0]@.a[1].i := l3v7z;
 L1500;
 _);
 g2103z := (g2103z - 1);
 listA[1] := ;
 L1460;
 L7326;
 _);

_proced L10177(l3a1z:integer);
_var l3v1z, l3v2z:integer;
l3v3z:sixchars; l3v9z:char;
_(
 L7343;
 rdpg32( l2v1z, l2v2z );
 rewrite(INP);
 (loop) _for l3v1z := 0 _to 1023 _do _(
  unpck(l3v3z[1],  pg32ptr@[l3v1z].a);
 _for l3v2z := 1 _to 6 _do _(
 l3v9z := l3v3z[l3v2z];
  _if ( (l3v9z = '{172') _or  (l3v9z = '^')) _then  _exit loop;
  _if  ( (l3v9z <> '{175') _or  (l3a1z = 2)) _then write(INP, l3v9z:1+0);
   _);
 _);

  write(INP, etx:1+0);
 reset(INP);
 _if (l3a1z = 1) _then _(
 _while  _not ( (INP@ = '*') _or  (INP@ = etx)) _do get(INP);
 U6771;
  _) _else U7525;
 _);

_( (* U10270 *)
  writeln('ДОБРО ПОЖАЛОВАТЬ !');
  10274:
  TTIN( 2 );
  10276:
  _if (getAlfa( l2v3z, 3)) _then _select
  ('ИНФ' = l2v3z) :  _( stats( 2 ); L7357 _);
  ('КАТ' = l2v3z) :  _( U7463 _);
  ('ТЕС' = l2v3z) :  _( stats( 7 ); L10177( 1 ) _);
  ('ВВО' = l2v3z) :  _( stats( 8 ); U7525 _);
  ('ПУЛ' = l2v3z) :  _( stats( 9 ); L10177( 2 ) _);
  ('ИСК' = l2v3z) :  _( stats( 10 ); U10057 _);
  ('ЗАП' = l2v3z) :  _( stats( 11 ); U7761 _);
  ('УПЛ' = l2v3z) :  _( stats( 12 ); writeln('ПРИКАЗ НЕ РЕАЛИЗОВАН') _);
  ('ПЕЧ' = l2v3z) :  _( modePrint _);
  ('ЭКР' = l2v3z) : modeScreen;
  ('ВЫХ' = l2v3z) :  _( writeln('ВЫХОД ИЗ СУББЛОКА'); _GOTO 10577 _);
  true:  writeln('НЕТ ТАКОГО ПРИКАЗА')
  _end _else  writeln('НЕ ПОНИМАЮ');
  _if _not (INP@ <> '&') _then  _(
 get(INP);
 _goto 10276;
 _);
 _goto 10274;
_);

_proced U10406;
_var l2v1z, l2v2z:integer;
_(
 _if _not debug _then _(
 code(Э0634=,);
 l2v1z := ;
 l2v1z := (l2v1z - g2094z);
 _if _not (l2v1z >= 0) _then  EXIT;
  code(Э05310=,);
 l2v2z := ;
 l2v2z := (l2v2z - g2095z);
 _if _not (l2v2z >= 0) _then  EXIT;
  (*=m-*)
 g2096z := l2v1z _div 4;
 stats( 33 );
  (q);
 g2096z := l2v2z _div 512;
 stats( 36 );
  _);
 _);

_proced exec(l2a1z:integer);
_procedure U10434(_var f:text; _var d:integer; j:integer); _( code(ПБ76022=,); _);
_(
 _if ЗАПРЕТ _or debug _then _GOTO 10726;
   stats( 16 );
  writeln( ornament:18, '   ВЫ ВЫШЛИ ИЗ БЛОКА "ОТЧЕТ"  ', ornament);
 U10406;
 U10434( INP, g2311z[5], 56 );
_);

_proced enter;
_procedure U10472(_var f:text; _var d:integer; j:integer); _( code(ПБ76021=,); _);
 _(
 U10472(INP, g2311z[5], 56);
 reset(INP);
 writeln(ornament:18, '   ВЫ ВОШЛИ В БЛОК  "ОТЧЕТ"   ', ornament);
   g2326z := g2326z - [2];
 _GOTO 10604;
_);

_proced L10525(l2a1z:integer);
 _(
 _if _not (l2a1z _IN g2325z) _then  _(
 writeln('ВАМ НЕЛЬЗЯ');
 _GOTO 10577;
 _);
_);

_(
 code(СЧ76233=,);
 g12z := ;
 pg32ptr := _nil;

  setup(g2092z);
 g2096z := 1;
 code(Э0634=,);
 g2094z := ;
 code(Э05310=,);
 g2095z := ;
 L1545;
  g2079z :=   today;
 ЗАПРЕТ := false;
 debug := ;
 g2105z := ;
  g2082z := 3302200000000C;  
  _if (g12z <> 'ТАМБОВ') _then _(
 writeln('<*>  ОТЛАДКА  <*>');
  g2327z := false;
 g2328z := true;
 dpyEnable := ;
 debug := ;
 curVol := 0;
  _) _else  enter;
10577:
 timeout;
   rollup(g2092z);
 L1545;
 TTIN(1);
 ЗАПРЕТ := false;
10604:
 g2061z := 0;
  g2065z := ;
10606:
   _if getAlfa(cmd, 3) _then _select
 ('ОТЧ' = cmd) :  stats( 1 );
 ('КАД' = cmd) _or  ('СПР' = cmd)  : _(  L10525( 1 ); exec( (5401540C) ) _);
 ('ИНФ' = cmd) : _( stats(2); L1757 _);
 ('СПИ' = cmd) : _(  stats( 3 ); rd189; U7173 _);
 ('ФОР' = cmd) : _( stats( 4 );
 g2105z :=   getNum( 10 );
 L7326;
 _);
  ('ТАБ' = cmd) :  _( stats( 5 ); U6771 _);
  ('АРХ' = cmd) : _(
 _if _not (33 _IN g2326z) _then _(
 _if _not (INP@ <> etx) _then  _( writeln('ПАРОЛЬ'); TTIN( 2 ) _);
 L2541( g12z );
 _if _not (g12z = valet) _then  _( writeln('ВАМ НЕЛЬЗЯ');  _GOTO 10577 _);
  _);
 stats( 6 );
 g2065z := true;
 U10270;
 g2065z := false;
  _);
 ('ПЕЧ' = cmd) : modePrint;
 ('ЭКР' = cmd) : modeScreen;
 ('ВЫХ' = cmd): _(
   _if _not debug _then _goto 10723 _else _(
     writeln('<*>  ВОЗВРАТ  <*>');
     code(СЧ12=ЗЧ76135,ПБ76002=,);
  _);
  _);
 ('КОН' = cmd): _(
  10723: exec( (3401751C) );
 _);
 true: _if ЗАПРЕТ _then _( 10726: writeln('В БЛОКЕ НЕТ ТАКОГО ПРИКАЗА'); _)
  _else _(
   writeln('ХОТИТЕ ВЫЙТИ ИЗ БЛОКА ОТЧЕТ ? <ДА,НЕТ>');
   BIND(' --> {172');
  _if (input@ = 'Д') _then _goto 10723
  _)
 _end _else writeln('НЕ ПОНИМАЮ');
  
_if (INP@ = '&') _then  _( get(INP); _goto 10606; _);
 _goto 10577;
_).
