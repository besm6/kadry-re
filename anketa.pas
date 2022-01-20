(*=p-,t-,m-,l-*)
_program АНКЕТА;
_label 11541, 11546, 11547, 11623, 11645, 11667;
_const z1 = 3401751B; main=5401540B; report=5401565B; z4=6660723B;
z5=1401572B;
dbVol=2060;c112=112;c189=189;c190=190;c191=191;
pl='+';c146=146B;c2=2;c4=4;c7=7;c8=8;c16=16;
sl='/';gt='>';
c1731=1731;
c214=214;c232=232;c264=264;c296=296;c308=308;c510=510;
c800=800;c832=832;c914=914;c924=924;c934=934;c942=942;
y2000=2000;c3s='3S';c14314=14314;
c3=3;c5=5;c6=6;dot='.';c17=17;c9=9;
comma=',';minus='-';
c40=40;c28=28;c24=24;c38=38;c43=43;c46=46;c20=20;
c36=36;c41=41;K='K';c26=26;
eq='=';c23=23;c22=22;c56=56;
etx='{377';sp=' ';opar='(';cpar=')';
spaces='      ';star='*';stars='******';
ornament='-=*=- ';
kadry='!КАДРЫ';catalog='КАТАЛО';zonpch='!ЗОНПЧ';

_type letter='A'..'Z';
digit='0'..'9';
bitset=_set _of 0..47;
a17=_array[1..17] _of integer;
word=_record _case integer _of
0:(i:integer);
1:(a:alfa)
_end;
page= _array[0..1023] _of word;
sixchars=_array [1..6] _of char;
arr = _array [1..39] _of word;
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
d9, d10:integer;
perms, flags:bitset; 
prnEnable:boolean;
d14:integer;
dpyEnable:boolean;
d16, d17:integer;
statArr:arr
_end;

_var
cmd:alfa;
cmd2:alfa;
a:alfa;
listA,listB:page;
g2061z:integer;
ЗАПРЕТ:boolean;
debug, g2064z:boolean;
g2065z:boolean;
g2066z:bitset;
ii:integer;
g2068z, g2069z:integer;
g2070z:integer;
g2071z:integer;
g2072z:integer;
g2073z, g2074z, g2075z:integer;
g2076z,g2077z:integer;
g2078z,g2079z, g2080z, g2081z:integer;
g2082z:@a17;
g2083z:@a17;
pg32ptr:@page; 
g2085z:@page;
begCPU:integer;
begTime:integer;
g2088z:integer;
g2089z, g2090z, g2091z:integer;
d:data; (* <- 2092 *)
s:setting; (* <- 2148... *)
g2170z, g2171z, g2172z, g2173z, g2174z, g2175z, g2176z, g2177z, g2178z, g2179z,
g2180z, g2181z, g2182z, g2183z, g2184z, g2185z, g2186z, g2187z, g2188z, g2189v:integer;
g2189z:_array [1..8] _of integer;
g2198z:boolean;
g2199v:boolean;
g2199z, g2207z: _array [1..8] _of boolean;
g2216z:_array [0..2] _of bitset;
g2219z,
g2220z, g2221z, g2222z, g2223z, g2224z, g2225z, g2226z, g2227z, g2228z:integer;
g2229z, g2230z, g2231z, g2232z, g2233z, g2234z, g2235z, g2236z, g2237z, g2238z,
g2239z, g2240z, g2241z, g2242z, g2243z, g2244z, g2245z, g2246z, g2247z, g2248z,
g2249z, g2250z, g2251z, g2252z, g2253z, g2254z, g2255z, g2256z, g2257z, g2258z,
g2259z, g2260z, g2261z, g2262z, g2263z, g2264z, g2265z, g2266z, g2267z, g2268z,
g2269z, g2270z, g2271z, g2272z, g2273z, g2274z, g2275z, g2276z, g2277z, g2278z,
g2279z, g2280z, g2281z: integer;
g2282z, g2283v:integer;
g2283z:_array[1..32] _of char;
famStr:_array[1..24] _of char;
givStr:_array[1..16] _of char;
patStr:_array[1..16] _of char;
g2372v:integer;
g2372z:_array[1..3] _of integer; (* <- 2373 *)
g2375z:_array[1..3] _of integer; (* <- 2376 *)
g2378z:_array[1..5] _of integer; (* <- 2379 *)
g2384z, g2385z, g2386z: integer;
g2387z:_record cmd: _array[0..30] _of alfa _end;
INP:text; (* <- 2418 *)

_proced skipsp;
 _(
 _while _not (INP@ <> ' ') _do get(INP);
 _);

_proced tkNext;
_(
  _while INP@ _in letter _do get(INP);
  skipsp;
_);

_procedure TTIN;
_label 1;
_var l2v1z, l2v2z, l2v3z, l2v4z:integer;
l2v5z, l2v6z:boolean;
_(
  BIND(' ==K {172');
  _if d.prnEnable  _then _(
    code(СЧ76013=УИ7,);
    l2v1z := 2; code(ЗЧ76013=,);
    write(' ==K ');
  _);
  rewrite(INP);
  l2v2z := 0;
 l2v3z := ;
 l2v4z := ;
 l2v5z := ;
 l2v6z := true;
 _if _not (input@ <> ' ') _then  get(input);
  _if (input@ = '=') _then _for ii := 1 _to 4 _do
    _if (input@ <> etx) _then  get(input);
  _while input@ <> etx _do _(
  _if d.prnEnable _then write(input@);
  _if (ord(input@) _IN [10,18,19,21,28])
 _or (input@ = '>') 
 _or (input@ = '<') 
 _or (input@ = '&') _then l2v6z := false;
 _if input@ _in letter _then _(
    l2v3z := (l2v3z + 1);
    _if _not l2v5z _then _(
     l2v4z := (l2v4z + 1); l2v5z := true
    _)
  _) _else l2v5z := false;
    l2v2z := l2v2z + 1;
    _if l2v2z > 128_then _(
      rewrite(INP);
      write(INP, 'SLЕ  {377');
      d.flags := d.flags + [47];
      _goto 1
    _);
    write(INP,input@);
    get(input);
  _); 
  write(INP, input@);
1:
  reset(INP);
  _if d.prnEnable _then _(
    writeLN;
    code(ВИ7=ЗЧ76013,);
  _);
  _if l2v6z & (l2v4z > 1) & (trunc(l2v3z / l2v4z) > 3) _then _(
  d.flags := (d.flags + [3]);
  _GOTO 11623;
  _)
_);

_proced timeout;
_var i:integer;
_(
  _if debug _then EXIT;
 code(Э0634=,);
 i := ;
  _if d.timeLimit - i < 50 _then _(
   rewrite(INP);
   writeln('ВАШЕ ВРЕМЯ ИСТЕКЛО');
   ЗАПРЕТ := false;
   write(INP, 'КОН  {377' );
  _GOTO 11645;
  _);
_);

_proced memset(l2a1z, l2a2z, l2a3z:integer);
_var l2v1z:@page;
_(
  l2v1z := ptr(l2a1z);
  _for ii := 0 _to (l2a2z - 1) _do l2v1z@[ii].i := l2a3z;
_);

_proced L1050;
_(
  g2068z := ord(ref(s.s1));
  memset( g2068z, ord(ref(g2282z)) - g2068z + 1, 0);
  g2283v := 102;
_);

_proced L1063;
_var r:alfa;
_(
  _if (11 _IN d.flags) _then write('{175') _else writeLN;
  timeout;
  code(СЧ77015=);
  r := ;
  _if r = 'Н{3770000' _then _( L1050;  _GOTO 11541 _);
_);

_proced wrc6(txt:integer);
_var c: char;
_(
 c := 'D';
 _while (c = 'D') _do _(
   code(2СЧ3=СД/-6/,2ЗЧ3=МР,);
   c := ;
 _);
  write(c, dot); 
_);

_proced wrPacked(txt:integer);
_var i:integer; c: char;
_(
 c := 'D';
 i := 0;
 _while (c = 'D') & (i <= 8) _do _(
   i := i + 1;
   code(2СЧ3=СД/-6/,2ЗЧ3=МР,);
   c := ; (q);
 _);
  g2077z := ((g2077z + 9) - i);
 _for i := i _to 8 _do _(
   write(c);
   code(2СЧ3=СД/-6/,2ЗЧ3=МР,);
   c := ; (q);
 _);
_);

_proced L1150;
 _(
 g2372v := 0;
 g2385z := 0;
 memset( ord(ref(g2375z)), 3, 0 );
 _);

_proced L1160;
 _(
 _if (INP@ <> etx) _then_(
   writeln('КОНТЕКСТ:');
   _for ii := 1 _to 24 _do
     _if (INP@ <> etx) _then _(  write(INP@); get(INP) _);
   L1063;
 _);
 L1050;
 _GOTO 11541;
_);

_proced stkovf(l2a1z, l2a2z:integer);
_var l2v1z, l2v2z:integer;
_(
 _if (g2372v >= 3) _then _(
   writeln('ОШ.:ПЕРЕПОЛНЕН СТЕК');
   L1160;
_);
 g2372v := (g2372v + 1);
 g2372z[g2372v] := l2a1z;
 g2375z[g2372v] := l2a2z;
 l2v1z := g2372v*2-1;
  l2v2z := g2083z@[1];
 g2378z[l2v1z] := ;
 g2378z[(l2v1z + 1)] := g2076z;
 _);

_function getAlfa(_var l2a1z:alfa):boolean;
_var l2v1z:sixchars; l2v7z:integer;
_(
 skipsp;
 l2v7z := 1;
  l2a1z := '000000';
 unpck(l2v1z[1],  l2a1z );
 _while ( INP@ _in letter) & (l2v7z < 4) _do _(
 l2v1z[(l2v7z + 3)] := INP@;
 get(INP);
 l2v7z := (l2v7z + 1);
  _);                                      
 tkNext;
 pck(l2v1z[1], l2a1z);
 getAlfa := l2v7z > 1;
_);

_function getDec:integer;
_var l2v1z:char; l2v2z:integer;
 _(
 l2v2z := 0;
 skipsp;
 _while INP@ _in digit _do _(
   l2v1z := INP@;
   l2v2z := (l2v2z * 10) + ord(l2v1z);
 get(INP);
_);
 skipsp;
 getDec := l2v2z;
_);

_function f0:integer;
 _(
   f0 := sel(g2082z@[12], 0, 21);
 _);

_function f1:integer;
 _(
   f1 := sel(g2082z@[9], 40, 2);
 _);

 _function f2:integer;
 _(
   f2 := sel(g2082z@[10], 0, 20);
 _);

 _function f3:integer;
 _(
   f3 := sel(g2082z@[9], 28, 6);
 _);

(* Level f4 *) _function f4:integer;
 _(
 f4 := sel(g2082z@[9], 0, 8);
 _);

(* Level f5 *) _function f5:integer;
 _(
 f5 := sel(g2082z@[9], 8, 8);
 _);

(* Level f6 *) _function f6:integer;
 _(
 f6 := sel(g2082z@[9], 16, 8);
 _);

(* Level f7 *) _function f7:integer;
 _(
 f7 := sel(g2082z@[9], 24, 3);
 _);

(* Level f8 *) _function f8:integer;
 _(
 f8 := sel(g2082z@[8], 38, 5);
 _);

(* Level f9 *) _function f9:integer;
 _(
 f9 := sel(g2082z@[8], 43, 5);
 _);

 _function fa:integer;
 _(
 fa := sel(g2082z@[11], 0, 13);
 _);
(* Level fb *) _function fb:integer;
 _(
 fb := sel(g2082z@[9] , 46, 2);
 _);
(* Level fc *) _function fc:integer;
 _(
 fc := sel(g2082z@[9] , 42, 4);
 _);
(* Level fd *) _function fd:integer;
 _(
 fd := sel(g2082z@[11] , 13, 23);
 _);
(* Level fe *) _function fe:integer;
 _(
 fe := sel(g2082z@[10] , 20, 20);
 _);
(* Level ff *) _function ff:integer;
 _(
 ff := sel(g2082z@[12] , 28, 20);
 _);
(* Level fg *) _function fg:integer;
 _(
 fg := sel(g2082z@[12] , 26, 22);
 _);
(* Level fh *) _function fh:integer;
 _(
 fh := sel(g2082z@[10] , 40, 8);
 _);
(* Level fi *) _function fi:integer;
 _(
 fi := sel(g2082z@[11] , 43, 3);
 _);
(* Level fj *) _function fj:integer;
 _(
 fj := sel(g2082z@[11] , 36, 5);
;
 _);
(* Level fk *) _function fk:integer;
 _(
 fk := sel(g2082z@[11] , 41, 2);
 _);
(* Level fl *) _function fl:integer;
 _(
 fl := sel(g2082z@[11] , 46, 2);
 _);
(* Level fm *) _function fm:integer;
 _(
 fm := sel(g2082z@[13], 0, 12);
 _);

_proced stats(l2a1z:integer; l2a2z:integer);
_var l2v1z, l2v2z, l2v3z, l2v4z:integer;
_(
 _if _not debug _then _(
 l2v3z := (l2a1z - 1) * 6;
 l2v4z := d.statArr[l2a2z].i;
 l2v1z := sel(l2v4z, l2v3z, 6) + g2088z;
  code(СД/6/=); l2v2z := ;
  code(МР=СД/-6/,МР=);  l2v1z := ;
 ins(l2v4z, l2v1z, l2v3z, 6);
 d.statArr[l2a2z].i := l2v4z;
 _if l2v2z > 0 _then _(
    g2088z := l2v2z;
    stats(l2a1z, l2a2z-1);
    g2088z := 1;
  _);
   _if (l2a2z <= 21) & (l2a2z > 0) _then  stats(l2a1z, 0);
  _)
_);

_proced modeScreen;
_label 1, 2, 3;
_(
  _select
  INP@ = 'Д': 1: _(
    code(СЧ76013=17ЗЧ,); g2068z := 1; code(17ЛС=ЗЧ76013,);
    writeln('ВКЛЮЧЕНА ВЫДАЧА НА ЭКРАН');
    d.dpyEnable := true;
    _);
  INP@  = 'Н': 2: _(
    d.dpyEnable := false;
    writeln('ВЫКЛЮЧЕНА ВЫДАЧА НА ЭКРАН');
    code(СЧ76013=17ЗЧ,); g2068z := 2; code(17ЛУ=ЗЧ76013,);
  _);
  INP@ = etx: 3: _if d.dpyEnable _then _goto 2 _else _goto 1;
  INP@ = '&': _goto 3;
  true: _( writeln('НЕПОНЯТНО'); _goto 1 _)
  _end;
  g2064z :=   getAlfa( a );
 _);

_function itoa(l2a1z:integer):alfa;
_var l2v1z, l2v2z, l2v3z:integer; l2v4z:sixchars; l2v10z:alfa;
_(
 l2v3z := 100000;
 _for l2v1z := 1 _to 6 _do _(
 l2v2z := trunc(l2a1z / l2v3z);
 l2a1z := l2a1z - l2v2z * l2v3z;
 l2v3z := trunc(l2v3z / 10);
 l2v4z[l2v1z] := chr(l2v2z);
 _);
 pck(l2v4z[1], l2v10z);
 itoa := l2v10z;
 _);

_proced rdpg32(l2a1z, l2a2z:integer);
 _(
 l2a2z := (((l2a1z * 4096) + l2a2z) + (10320000000000C));
   code(2Э0704=,)
 _);

_proced wrOctal(i, len:integer);
_var a:alfa; b:sixchars;
_(
 mapia(i, a);
 unpck(b[1], a);
  _for i := 7 - len _to 6 _do  write(b[i]);
_);

_proced rdPage(_var dst:page; vol, zone:integer;  copy:boolean);
_var i:integer;
l2v2z, l2v3z:alfa;
l2v4z:alfa;
_(
 timeout;
 _if (d.curVol <> vol) _then _(
   _if (d.curVol <> 0) _then _(
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
   _if i = 0 _then d.curVol := vol
   _else _(
     writeln('РАБОТАТЬ НЕЛЬЗЯ КО=', i:3);
     L1160
   _)
 _);
 rdpg32( 52B, zone );
 _if pg32ptr@[0].a <> kadry _then _(
   writeln('ИСПОРЧ.ЗОНА');
   wrOctal(zone, 4);
   L1160
 _);
 _if copy _then _(
    code(1ИК4044=ИА,12ПА=2ИК3,ИА=16ПА,15ПА76001=,L1747:12ИА=15СЧ1777,16ИА=15ЗЧ1777,15КЦL1747=,);
  _)
 _);

_proced rdDB;
 _(
   _if (listA[1].a <> catalog) _then
     rdPage( listA, dbVol, 112, true );
   g2069z :=   sel( listA[3].i, 0, 7 );
  g2073z := g2072z
 _);

_proced L1766;
 _(
 _if (g2071z = 0) _then  writeln('СИС.ОШ.:НЕТ БОБИНЫ');
 _if _not (g2072z <> g2073z) _then  EXIT;
 rdPage( listA, g2071z, g2072z, false );
 g2070z := sel(pg32ptr@[1].i, 0, 7);
 g2073z := g2072z;
 g2091z := (g2091z + 1);
 _);
(* Level 2 *) _proced rdZPCH;
 _(
 rdPage( listB, dbVol, 191, true );
 _);

_function today:integer;
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
 age1 := trunc(days(g2078z, sel(g2082z@[10], 0, 20)) / 366);
 _);

_function age2:integer;
 _(
 age2 := trunc(days(g2078z, sel(g2082z@[10], 20, 20)) / 366);
 _);

_function L2146(l2a1z:alfa; l2a2z:integer):integer;
_(
L2146 := 0;
 _for ii := 1 _to l2a2z _do
   _if (l2a1z = g2387z.cmd[ii]) _then _(  L2146 := ii; EXIT _);
_);

_function L2165(l2a1z:alfa):integer;
 _(
 g2387z := [ 0,  'ВОЗ', 'КПС', 'ВЛК', 'СТА', 'ЗАЧ', 'ЗАР', 'ДЕТ', 'ТЕЛ'];
 L2165 :=   L2146( l2a1z, 8 );
 _);

_function L2205(l2a1z:alfa):integer;
 _(
 g2387z := [ 0, 'ФАМ', 'ИМЯ', 'ОТЧ', 'ПОЛ',
 'РОЖ', 'ВОЗ', 'НАЦ', 'КПС', 'ВЛК', 'ПРО',
 'ОБР', 'СТЕ', 'ЗВА', 'СПЕ', 'СЕМ', 'ДЕТ',
 'АДР', 'ТЕЛ', 'ЗАЧ', 'ПОД', 'СТА',  'ДОЛ', 'ПОВ', 
 'ЗАР', 'СОС', 'ВОИ', 'СТР', 'БРО'];
 L2205 :=   L2146( l2a1z, 28 );
 _);

_function L2251(l2a1z:integer):integer;
_var l2v1z, l2v2z:integer;
_(
 l2v1z := trunc(l2a1z / 366);
 l2a1z := l2a1z - l2v1z * 366;
 l2v2z := l2a1z _DIV 31;
 l2a1z := l2a1z - l2v2z * 31;
 L2251 := l2v1z * 10000 + l2v2z * 100 + l2a1z;
_);
(*=m+*)
_function L2275:integer;
_var l2v1z, l2v2z, l2v3z, l2v4z:integer;
_(
 l2v4z := sel(g2082z@[8], 0, 30);
 l2v3z := l2v4z _MOD 512;
 l2v4z := trunc(l2v4z / 512);
 l2v2z := l2v4z _MOD 4096;
 l2v4z := trunc(l2v4z / 4096);
 l2v1z := l2v4z _MOD 8;
 l2v4z := 0;
(*=m-*)_case l2v1z _of
 1: l2v4z := l2v2z;
 2: l2v4z := l2v2z + l2v3z;
 3: l2v4z := l2v2z * l2v3z _DIV 100 + l2v2z;
 4: _( l2v4z := l2v2z * 1731  _DIV 10000;
 l2v4z := l2v4z * l2v3z _DIV 100 + l2v4z;
 _)
_end;
 L2275 := l2v4z;
 _);

_function L2546:boolean;
_label 3146;
(* Level 3 *) _proced L2350(l3a1z, l3a2z, l3a3z:integer);
 _(
 _if  ( (ii < l3a1z) _or  (ii > l3a2z)) _then  _(
 _if _not (l3a3z <> 1) _then  _GOTO 3146 _)
 _else _if _not (l3a3z <> 2) _then  _GOTO 3146;
_);

_proced L2370(l3a1z, l3a2z, l3a3z:integer);
 _(
 _if  ( (l3a1z <> 0) _or  (l3a1z <> 12)) _then  _(
 L2350( l3a1z, l3a2z, l3a3z );
_) _else _if _not (l3a3z <> 2) _then  _GOTO 3146;
 _);

(* Level 3 *) _proced L2410(l3a1z, l3a2z:integer);
_var l3v1z:@bitset; _(
 l3v1z := ptr(trunc(((ii) / 48)) + l3a1z);
 _if ((ii _MOD 48) _IN l3v1z@) _then _(
   _if _not (l3a2z <> 2) _then  _GOTO 3146
 _) _else _if _not (l3a2z <> 1) _then  _GOTO 3146;
_);

_proced L2436(l3a1z, l3a2z, l3a3z, l3a4z:integer);
_label 2461;
_var l3v1z, l3v2z:integer;
l3v3z:char;
l3v4z, l3v5z, l3v6z:integer;
l3v7z:bitset; l3v8z:integer;
_(
 l3v5z := 0;
 l3v8z := ;
 _for l3v4z := l3a1z _to l3a2z _do _(
 l3v1z := g2082z@[l3v4z];
 l3v7z := ;
 _if (l3v7z = g2066z) _then 
 _if _not (l3a4z <> 1) _then _GOTO 3146 _else  EXIT;
 l3v6z := 0;
 2461:
  code(3СЧ7=СД/-6/,3ЗЧ7=МР,);
  l3v2z := ;
  l3v6z := l3v6z + 1;
  _if (l3v2z = 77B) _then _goto 2461;

 l3v5z := (l3v5z + 1);
 l3a3z := (l3a3z - 1);
 _case l3a1z _of
1: l3v3z := famStr[l3v5z];
4: l3v3z := givStr[l3v5z];
6: l3v3z := patStr[l3v5z];
14: l3v3z := g2283z[l3v5z]
_end;
 _if _not (l3v2z <> ord(l3v3z)) _then  l3v8z := 1;
 _if (l3a3z <= 0) _then _(
   _if _not (l3a4z <> 1) _then  EXIT _else _GOTO 3146;
 _);
 _if (l3v2z <> ord(l3v3z)) _then _(
 _if _not ( (l3a1z <> 14) _or  (l3v8z <> 0)) _then  _(
   l3v5z := 0;
   l3a3z := g2281z;
   _if (l3v6z < 8) _then _goto 2461;
  _);
   _if (l3a4z = 1) _then _GOTO 3146 _else EXIT;
 _);
 _if _not (l3v6z >= 8) _then  _goto 2461;
 _);
 _);

_( 
 L2546 := false;
 ii :=   f0;
 a := ;
 (*=c-*)_if a = g2083z@[1] _then (*=c+*) _(
 g2075z := (g2075z + 1);
 _) _else _goto 3146;
_if _not (s.s4 = 0) _then  _(
 ii :=   age1;
 L2350( g2221z, g2222z, s.s4 );
 _);
 _if _not (s.s5 = 0) _then  _(
 ii :=   f4;
 L2350( g2223z, g2224z, s.s5 );
 _);
 _if _not (s.s6 = 0) _then  _(
 ii :=   f5;
 L2350( g2225z, g2226z, s.s6 );
 _);
 _if _not (s.s7 = 0) _then  _(
 ii :=   age2;
 L2350( g2227z, g2228z, s.s7 );
 _);
 _if _not (s.s8 = 0) _then  _(
 ii :=   fe;
 L2350( g2229z, g2230z, s.s8 );
 _);
 _if _not (s.s9 = 0) _then  _(
 ii :=   L2275;
 L2350( g2231z, g2232z, s.s9 );
 _);
_if _not (g2171z = 0) _then  _(
 ii :=   fc;
 L2350( g2244z, g2245z, g2171z );
 _);
 
 _if _not (g2178z = 0) _then  _(
 ii :=   fd;
 L2350( g2257z, g2258z, g2178z );
 _);
 
 _if _not (g2177z = 0) _then  _(
 ii :=   f6;
 L2350( g2256z, g2256z, g2177z );
 _);
 
 _if _not (s.s10 = 0) _then  _(
 ii :=   fh;
 L2410( ord(ref(g2219z)), s.s10 );
 _);
 
 _if _not (s.s11 = 0) _then  _(
 ii :=   f2;
 L2350( g2233z, g2234z, s.s11 );
 _);
 
 _if _not (s.s12 = 0) _then  _(
 ii :=   ff;
 L2350( g2246z, g2247z, s.s12 );
 _);
 
 _if _not (s.s13 = 0) _then  _(
 ii :=   f3;
 L2350( g2252z, g2252z, s.s13 );
 _);
 
 _if _not (s.s17 = 0) _then  _(
 ii :=   f1;
 L2350( g2253z, g2253z, s.s17 );
 _);
 
 _if _not (s.s18 = 0) _then  _(
 ii :=   f8;
 L2350( g2235z, g2236z, s.s18 );
 _);
 
 _if _not (s.s19 = 0) _then  _(
 ii :=   f9;
 L2350( g2237z, g2238z, s.s19 );
 _);
 
 _if _not (s.s20 = 0) _then  _(
 ii :=   f7;
 L2350( g2239z, g2240z, s.s20 );
 _);
 
 _if _not (g2170z = 0) _then  _(
 ii :=   fb;
 L2350( g2243z, g2243z, g2170z );
 _);
 
 _if _not (s.s21 = 0) _then  _(
 ii :=   fa;
 L2350( g2241z, g2242z, s.s21 );
 _);
 
 _if _not (g2172z = 0) _then  _(
 ii :=   fj;
 L2350( g2248z, g2249z, g2172z );
 _);
 
 _if _not (g2173z = 0) _then  _(
 ii :=   fi;
 L2350( g2250z, g2251z, g2173z );
 _);
 
 _if _not (g2174z = 0) _then  _(
 ii :=   fk;
 L2350( g2254z, g2254z, g2174z );
 _);
_if _not (g2175z = 0) _then  _(
 ii :=   fl;
 L2350( g2255z, g2255z, g2175z );
 _);
 _if _not (g2179z = 0) _then  L2436(14, 17, g2281z, g2179z );
 _if _not (s.s14 = 0) _then  L2436( 1, 3, g2278z, s.s14 );
 _if _not (s.s15 = 0) _then  L2436( 4, 5, g2279z, s.s15 );
 _if _not (s.s16 = 0) _then  L2436( 6, 7, g2280z, s.s16 );
 _if _not (g2180z = 0) _then  _(
 ii := (f2  _MOD 100);
 L2350( g2259z, g2260z, g2180z );
 _);
_if _not (g2181z = 0) _then  _(
 ii := trunc(f2 / 100) _mod 100;
 L2370( g2261z, g2262z, g2181z );
 _);
_if _not (g2182z = 0) _then  _(
 ii := trunc(f2 /10000);
 L2350( g2263z, g2264z, g2182z );
 _);
 _if _not (g2183z = 0) _then  _(
 ii := (fe  _MOD 100);
 L2350( g2265z, g2266z, g2183z );
 _);
 _if _not (g2184z = 0) _then  _(
 ii := trunc(fe / 100) _mod 100;
 L2370( g2267z, g2268z, g2184z );
 _);
 _if _not (g2185z = 0) _then  _(
 ii := trunc(fe / 10000);
 L2350( g2269z, g2270z, g2185z );
 _);
 _if _not (g2186z = 0) _then  _(
 ii := (ff  _MOD 100);
 L2350( g2271z, g2272z, g2186z );
 _);
 _if _not (g2187z = 0) _then  _(
 ii := trunc(ff / 100) _mod 100;
 L2370( g2273z, g2274z, g2187z );
 _);
 _if _not (g2188z = 0) _then  _(
 ii := trunc(ff / 10000);
 L2350( g2275z, g2276z, g2188z );
 _);
 g2074z := (g2074z + 1);
 L2546 := true;
 3146:
_);

 _proced L3147(l2a1z:integer);
_var l2v1z:integer;
_(
 l2v1z := trunc(((l2a1z) / 10));
 write( l2v1z:1, (l2a1z - (l2v1z * 10)):1 );
 _);

(* Level 2 *) _proced L3165(l2a1z:integer);
_var l2v1z, l2v2z, l2v3z:integer;
_(
 l2v3z := 1000;
 _for l2v1z := 1 _to 4 _do _(
 l2v2z := trunc(((l2a1z) / (l2v3z)));
 l2a1z := (l2a1z - (l2v2z * l2v3z));
 l2v3z := trunc(((l2v3z) / 10));
 write(l2v2z:1 );
 _);
 _);

(* Level 2 *) _proced L3213(l2a1z:integer);
 _(
 _for ii := 1 _to l2a1z _do write(sp);
 _);

_proced L3224(l2a1z:char; l2a2z:integer);
_var i:integer;
_(
 _for i := 1 _to l2a2z _do write(l2a1z);
 L1063;
_);

(* Level 2 *) _proced L3241(l2a1z:integer);
 _(
 _if _not (l2a1z = 0) _then  _(
 write('19');
 L3147( l2a1z );
 _) _else
 write('----');
 _);

(* Level 2 *) _proced L3253(l2a1z:integer);
_var l2v1z, l2v2z:integer;
_(
 _if _not (l2a1z <> 0) _then  _(
 write('----------');
 _) _else _(
 l2v2z := trunc(((l2a1z) / (10000)));
 l2a1z := (l2a1z - (l2v2z * 10000));
 l2v1z := (l2a1z  _DIV 100);
 L3147( (l2a1z - (l2v1z * 100)) );
 write(dot);
 L3147( l2v1z );
 write(dot);
 write('19');
 L3147( l2v2z );
_)
_);

_proced L3307(l2a1z:integer);
 _(
 L3253( trunc(((l2a1z) / 4)) );
 g2387z := [ '  ', ' Д', ' З'];
(*=m+*) ГГ( g2387z.cmd[(l2a1z _MOD 4)] );
 _);

 _proced L3326(l2a1z, l2a2z:integer);
_var l2v1z, l2v2z:integer; l2v3z: alfa; l2v4z:sixchars;
_(
 g2081z := 0;
 l2v3z := listB[l2a2z].a;
 g2079z := ;
 _for l2v1z := 1 _to 2 _do _(
(*=m-*) l2v3z := listB[((((2 * l2a1z) + l2a2z) + l2v1z) + 1)].a;
 _if (l2v3z <> '******') _then _(
 unpck(l2v4z[1],  l2v3z );
 _for l2v2z := 1 _to 6 _do _(
 _if _not (l2v4z[l2v2z] = '*') _then  _(
 write(l2v4z[l2v2z]);
 g2081z := (g2081z + 1);
 _); _)
 _);
 _);
 _if _not ( (l2a2z = 308) _or  (l2a2z = 510)) _then  L3213( (g2079z - g2081z) );
 _);

(* Level 2 *) _proced L3376(l2a1z:integer);
 _(
 L3326( l2a1z, 2 );
 _);

_proced L3403(l2a1z, l2a2z:integer);
 _(
 _if _not (l2a2z <> 1) _then  _(
 l2a2z := 10;
 _) _else  l2a2z := 112;
 L3326( l2a1z, l2a2z );
 _);

(* Level 2 *) _proced L3417(l2a1z:integer);
 _(
 L3326( l2a1z, 934 );
 _);

(* Level 2 *) _proced L3424(l2a1z:integer);
 _(
 L3326( l2a1z, 214 );
 _);

(* Level 2 *) _proced L3431(l2a1z:integer);
 _(
 L3326( l2a1z, 232 );
 _);

(* Level 2 *) _proced L3436(l2a1z:integer);
 _(
 L3326( l2a1z, 264 );
 _);

(* Level 2 *) _proced L3443(l2a1z:integer);
 _(
 L3326( l2a1z, 296 );
 _);

_proced L3450(l2a1z:integer);
_var l2v1z, l2v2z, l2v3z:integer;
_(
 l2v1z := sel(l2a1z, 14, 7);
 l2v2z := sel(l2a1z, 7, 7);
 l2v3z := sel(l2a1z, 0, 7);
 L3326( l2v1z, 308 );
 _if _not (l2v2z = 0) _then  _(
 write(l2v2z:3 );
 g2081z := (g2081z + 3);
 _);
 _if _not (l2v3z = 0) _then  _(
 write(minus, l2v3z:2 );
 g2081z := (g2081z + 3);
 _);
 L3213( (g2079z - g2081z) );
 _);

(* Level 2 *) _proced L3501(l2a1z:integer; l2a2z:boolean);
 _(
 L3326( l2a1z, 510 );
 _if l2a2z  _then  _(
 l2a1z := sel(g2082z@[8], 30, 8);
 _if (l2a1z <> 0) _then _(
 L3165( l2a1z );
 g2081z := (g2081z + 4);
_)
 _);
 L3213( (g2079z - g2081z) );
 _);

_proced L3524(l2a1z:integer);
 _(
 L3326( l2a1z, 800 );
 _);

(* Level 2 *) _proced L3531(l2a1z:integer);
 _(
 L3326( l2a1z, 832 );
 _);

(* Level 2 *) _proced L3536(l2a1z:integer);
 _(
 L3326( l2a1z, 914 );
 _);

(* Level 2 *) _proced L3543(l2a1z:integer);
 _(
 L3326( l2a1z, 924 );
 _);

(* Level 2 *) _proced L3550(l2a1z:integer);
 _(
 L3147( trunc(((l2a1z) / 100)) );
 L3147( (l2a1z _MOD 100) );
 _);

(* Level 2 *) _proced L3562(l2a1z:integer);
 _(
 _if _not (l2a1z = 0) _then  _(
 write( trunc(((l2a1z) / (10000))):3, minus);
 l2a1z := (l2a1z _MOD 10000);
 L3147( trunc(((l2a1z) / 100)) );
 write(minus);
 L3147( (l2a1z _MOD 100) );
 _) _else  write('---------');
 _);

(*=m+*) _proced L3614;
_var l2v1z, l2v2z, l2v3z, l2v4z, l2v5z:integer;
_(
 g2068z := sel(g2082z@[8], 0, 30);
 l2v3z := (g2068z _MOD 512);
 g2068z := trunc(((g2068z) / (512)));
 l2v2z := (g2068z _MOD 4096);
 g2068z := trunc(((g2068z) / (4096)));
 l2v1z := (g2068z _MOD 8);
 g2068z := trunc(((g2068z) / 8));
 l2v5z := (g2068z _MOD 4);
 l2v4z := trunc(((g2068z) / 4));
 _if _not (l2v4z = 0) _then  _(
 write(l2v4z  :  1);
 write('Р');
 _) _else  write(chr(15 ) :  2);
 _case l2v1z _of;
 0: write(chr(15 ) :  8);
 1: write(l2v2z  :  6, chr(15 ) :  2);
 2: write(l2v2z  :  4, '+', l2v3z  :  3);
 3: write(l2v2z  :  4, '+', l2v3z  :  2, '%');
 4: write(trunc(((l2v2z) / 10))  :  2, dot,
   (l2v2z _MOD 10)  :  1, '+', l2v3z  :  2, '%')
 _end;
  _if _not (l2v5z = 0) _then write('(1/2)') _else  write(chr(15 ) :  5)
 _);

_proced L3770;
_var l2v1z, l2v2z:integer; 
(* Level 3 *) _proced L3751(l3a1z:alfa);
 _(
 ГГ( '  #  ' ); ГГ( l3a1z ); ГГ( ' : ' );
 _);

(* Level 3 *) _proced L3757(l3a1z:integer);
 _(
 L3213( l3a1z );
 write('#');
 L1063;
 _);

_( 
 g2089z := (g2089z + 1);
 l2v2z :=   f1;
 write(chr(15 ) :  2);
 L3224( '#', 48 );
 ГГ( '  #  ' );
 write(spaces);
 g2077z := 9;
 _for l2v1z := 1 _to 7 _do _(
 wrPacked(g2082z@[l2v1z] );
 _if  ( (l2v1z = 3) _or  (l2v1z = 5)) _then  _(
 write(sp);
 g2077z := (g2077z + 1);
_)
 _);
L3757( (47 - g2077z) );
 L3751( 'ПОЛ' );
 L3376( l2v2z );
 L3213( 5 );
 L3751( 'СЕМ' );
 L3443(   fb  );
 write(   fc: 2);
 L3757( 7 );
 L3751( 'РОЖ' );
 L3253(   f2  );
 write(chr(15 ) :  2);
 L3751( 'ЗАЧ' );
 L3253(   fe  );
 L3757( 5 );
 L3751( 'НАЦ' );
 L3403(   f3 , l2v2z );
 write(chr(15 ) :  2);
 L3751( 'ПОВ' );
 L3307(   fg  );
 L3757( 3 );
 L3751( 'КПС' );
 L3241(   f4  );
 L3213( 8 );
 L3751( 'ПОД' );
 L3450(   f0  );
 L3757( 6 );
 L3751( 'ВЛК' );
 L3241(   f5  );
 L3213( 8 );
 L3751( 'ДОЛ' );
 L3501(   fh , true );
 L3757( 5 );
 L3751( 'ПРО' );
 L3417(   f6  );
 L3213( 9 );
 L3751( 'ЗАР' );
 L3614;
 L3757( 0 );
 L3751( 'ОБР' );
 L3424(   f7  );
 write(spaces);
 L3751( 'ТАБ' );
 L3550(   fm  );
 L3757( 11 );
 L3751( 'СТЕ' );
 L3431(   f8  );
 write(spaces);
 L3751( '   ' );
 L3757( 15 );
 L3751( 'ЗВА' );
 L3436(   f9  );
 write(spaces);
 L3751( '   ' );
 L3757( 15 );
 L3751( 'СПЕ' );
 L3165(   fa  );
 L3213( 8 );
 L3751( '   ' );
 L3757( 15 );
 ГГ( '  #  ' );
 g2077z := 3;
 _for l2v1z := 14 _to 17 _do _(
 wrPacked( g2082z@[l2v1z] );
 _);
 l2v1z :=   fd;
 _if _not (l2v1z = 0) _then  _(
 write(comma);
 L3562( l2v1z );
 g2077z := (g2077z + 10);
 _);
 L3757( (47 - g2077z) );
 write(chr(15 ) :  2);
 L3224( '#', 48 );

_);

_proced work(l2a1z:integer);
_label 10457, 10551, 10674, 11030;
_type a8 = _array [1..8] _of integer;
_var l2v1z, l2v2z, l2v3z, l2v4z, l2v5z, l2v6z, l2v7z, l2v8z, l2v9z, l2v10z:integer;
l2v11z:integer;
l2v12z, l2v13z:integer;
l2v14z:_array[0..1] _of bitset;
l2v16z:_array[0..0] _of bitset;
l2v17z:_array[0..1] _of integer;
l2v19z:alfa;
l2v20z:_array[0..5] _of boolean;
l2v25z:_array [1..3] _of a8;
l2v49z:_array [1..8] _of integer;
l2v57z:_array [1..8] _of integer;
l2v65z:_array [1..8] _of integer;
l2v73z:_array [1..8] _of integer;
l2v82z,l2v83v:@page;
l2v83z:_array [1..25] _of alfa;
l2v109z, l2k1110z:_array[0..2000] _of integer;
_proced L4252;
_var l3v1z:alfa;
_(
 _if _not (l2a1z <> 3) _then  _(
 l3v1z := 'ПЕР';
 _) _else  _if _not (l2a1z <> 4) _then  _(
 l3v1z := 'АНК';
 _) _else l3v1z := 'НАЙ';
 writeln('ОШ. В ОПЕРАНДЕ ПРИКАЗА ');
 ГГ( l3v1z );
 writeLN;
 L1160;
 _);

(* Level 3 *) _proced L4273;
 _(
 _if _not (g2074z <> 0) _then  _(
 writeln('НЕТ АНКЕТ');
 L1050;
 _GOTO 11541;
 _);
 _);

(* Level 3 *) _proced L4306;
 _(
 _if _not (l2v10z <> 1) _then  EXIT;
 L3224( '-', l2v10z );
 _);

 _proced L4316;
_var l3v1z:integer; l3v2z:bitset;
_(
 _for l3v1z := 0 _to 2 _do _(
 _if _not (g2176z <> 0) _then  _(
 l3v2z := g2066z;
 _) _else _if _not (g2176z <> 1) _then  _(
 l3v2z := g2216z[l3v1z];
 _) _else  l3v2z := g2066z - g2216z[l3v1z];
 l2v16z[l3v1z] := l3v2z;
 _);
 _if ( (g2176z = 0) _or  (g2176z = 2)) _then  _(
  g2283v := 0;
  g2282z := (g2069z - 1);
 _)
 _);

(* Level 3 *) _proced L4351;
_var l3v1z, l3v2z:integer;
_(
 _for l3v2z := 1 _to 8 _do _(
   l2v57z[l3v2z] := 0;
   l2v65z[l3v2z] := ;
   _for l3v1z := 1 _to 3 _do _(
     (*=m-*) l2v25z[l3v1z][l3v2z] := 0;
   _)
 _);
 _for l3v2z := 1 _to 8 _do l2v49z[l3v2z] := 9999999;
 g2074z := 0;
 g2075z := ;
 memset( ord(ref(l2v14z)), (1 + 1), 0 );
 _);

(* Level 3 *) _proced L4410;
 _(
 _if  ( d.dpyEnable  _and  (l2v10z > 115B)) _or (l2v10z > 127) _then  _(
 _if _not d.dpyEnable _then  modeScreen;
 writeln('СЛИШКОМ МНОГО ТРЕБУЕТЕ');
 writeln('ЧИСЛО ПОЗИЦИЙ:', l2v10z  :  3);
 L1160;
_)
 _);

_proced L4435(l3a1z:integer);
_var l3v1z, l3v2z:integer;
_(
 l3v1z := l2v109z[l3a1z];
 l3v2z := (l3v1z * 100);
 write(star :  2, l3v1z  :  6, star :  2);
 write(trunc(((l3v2z) / (g2074z)))  :  4, dot);
 L3147 (trunc((l3v2z _mod g2074z) * 100 / g2074z));
 write('%', star :  2);
 _);

_proced L4476;
_var l3v1z, l3v2z:integer;
l3v3z:boolean; l3v4z:alfa;
_(
 l3v2z := 1;
 l3v3z := true;
 _while _not (l3v2z > 2) _do _(
 l3v3z := _not l3v3z;
 l3v2z := (l3v2z + 1);
 _if l3v3z _then  write(star);
 l3v1z := 1;
 _while (l3v1z < (l2v8z - 1)) _do _(
 _if _not ( (l2a1z <> 3) _or  (l3v1z <> 1)) _then _(
 _if l3v3z _then write('ПОДРАЗДЕЛЕН*') _else  l2v10z := (l2v10z + 12);
 _);
 l2v4z := l2v109z[l3v1z];
 l2v5z := l2v109z[(l3v1z + 1)];
 l3v1z := (l3v1z + 2);
_case l2v4z _of
 1: _if l3v3z  _then  write('ВОЗРАСТ ');
 2: _if l3v3z  _then  write('К П С С ');
 3: _if l3v3z  _then  write('ВЛКСМ   ');
 4: _if l3v3z  _then  write('С Т А Ж ');
 5: _if l3v3z  _then  write('ЗАЧИСЛЕН');
 6: _if l3v3z  _then  write('ЗАРПЛАТА');
 7: _if l3v3z  _then  write('Д Е Т И ');
 8: _if l3v3z  _then  write('ТЕЛЕФОН ')
_end;

 _if _not l3v3z _then  l2v10z := (l2v10z + 8);
 _case l2v5z _of
 1: _if l3v3z _then  l3v4z := '(СУМ)';
 2: _if l3v3z _then  l3v4z := '(СРЕ)';
 3: _if l3v3z _then  l3v4z := '(МАК)';
 4: _if l3v3z _then  l3v4z := '(МИН)'
_end;

_if l3v3z _then  _(
 ГГ( l3v4z );
 _) _else  l2v10z := (l2v10z + 6);
 _if l3v3z _then   write(star);
 _); 
 L4410;
 _if l3v3z _then  writeLN _else L4306;
_); (* while *)
 L4306;
_);

_proced L4662;
_var l3v1z, l3v2z, l3v3z:integer;
l3v4z:boolean; l3v5z:alfa;
_(
 _if _not (l2v9z <> 0) _then  EXIT;
 _if _not (l2a1z <> 3) & (l2v11z _IN [0,1,2,3,17]) _then _(
 writeln('ОШ.ПАРАМ.ПРИКАЗА "ПЕР"');
 L1160;
 _);
 l3v2z := 1;
 l3v4z := true;
 _while _not (l3v2z > 2) _do _(
 l3v4z := _not l3v4z;
 l3v2z := (l3v2z + 1);
 l3v3z := 0;
 _if l3v4z  _then  write(star);
 _for l3v1z := 1 _to l2v9z _do _(
 l3v5z := l2v83z[l3v1z];
_select
  ('ФИО' = l3v5z):
 _if l3v4z  _then write(sp:19, 'ФИО', sp:19) _else  l2v10z := (l2v10z + 42);
  ('ФИН' = l3v5z):
 _if l3v4z _then  write(sp :  14, 'ФИН', sp:14) _else l2v10z := (l2v10z + 32);
  ('ФАМ' = l3v5z):
 _if l3v4z _then write(spaces, '   ФАМИЛИЯ    ', spaces) _else l2v10z := (l2v10z + 27);
  ('ИМЯ' = l3v5z):
 _if l3v4z _then write(spaces, ' ИМЯ  ', spaces) _else l2v10z := (l2v10z + 19);
  ('ОТЧ' = l3v5z): 
 _if l3v4z _then  write('     ОТЧЕСТВО     ') _else  l2v10z := (l2v10z + 19);
  ('НАЦ' = l3v5z): 
 _if l3v4z _then  write('  НАЦИОН-ТЬ ') _else  l2v10z := (l2v10z + 13);
  ('ВОЗ' = l3v5z): 
 _if l3v4z _then  write('ВОЗРАСТ') _else l2v10z := (l2v10z + 8);
  ('РОЖ' = l3v5z): 
 _if l3v4z _then write(' ДАТА РОЖД  ') _else l2v10z := (l2v10z + 13);
  ('ПОЛ' = l3v5z):
 _if l3v4z _then write('   ПОЛ   ') _else l2v10z := (l2v10z + 10);
  ('КПС' = l3v5z): 
 _if l3v4z _then write(' КПСС ') _else l2v10z := (l2v10z + 7);
  ('ВЛК' = l3v5z): 
 _if l3v4z _then write(' ВЛКСМ') _else l2v10z := (l2v10z + 7);
  ('ПРО' = l3v5z) :
 _if l3v4z _then  write(' ПРОФ') _else l2v10z := (l2v10z + 6);
  ('ОБР' = l3v5z) :
 _if l3v4z _then  write(' ОБРАЗОВ') _else l2v10z := (l2v10z + 9);
  ('СТЕ' = l3v5z) :
 _if l3v4z _then  write(' СТЕПЕНЬ') _else l2v10z := (l2v10z + 9);
  ('ЗВА' = l3v5z) :
 _if l3v4z _then  write(' ЗВАНИЕ ') _else l2v10z := (l2v10z + 9);
  ('СПЕ' = l3v5z) :
 _if l3v4z _then  write(' СПЕЦ ') _else l2v10z := (l2v10z + 7);
  ('СЕМ' = l3v5z) :
 _if l3v4z _then  write('  СЕМЬЯ ') _else l2v10z := (l2v10z + 9);
  ('ДЕТ' = l3v5z) :
 _if l3v4z _then  write('ДЕТИ') _else l2v10z := (l2v10z + 5);
 ('АДР' = l3v5z) :
 _if l3v4z _then  write(sp : 14, 'АДРЕС', sp :  15) _else l2v10z := (l2v10z + 35);
  ('ТЕЛ' = l3v5z) :
 _if l3v4z _then  write('  ТЕЛЕФОН  ') _else  l2v10z := (l2v10z + 12);
  ('ЗАЧ' = l3v5z) :
 _if l3v4z _then  write(' ЗАЧИСЛЕНИЕ ') _else  l2v10z := (l2v10z + 13);
  ('ПОВ' = l3v5z) :
 _if l3v4z _then   write('  ПОВЫШЕНИЕ   ') _else l2v10z := (l2v10z + 15);
  ('СТА' = l3v5z) :
 _if l3v4z _then   write('СТАЖ') _else  l2v10z := (l2v10z + 5);
  ('ДОЛ' = l3v5z) :
 _if l3v4z _then   write(' ДОЛЖНОСТЬ  ') _else  l2v10z := (l2v10z + 13);
  ('ЗАР' = l3v5z) :
 _if l3v4z _then   write('    ЗАРПЛАТА     ') _else  l2v10z := (l2v10z + 18);
  ('СОС' = l3v5z) :
 _if l3v4z _then   write(' СОСТАВ ') _else  l2v10z := (l2v10z + 9);
 ('ВОИ' = l3v5z) :
 _if l3v4z _then  write('ВОИН.ЗВА') _else  l2v10z := (l2v10z + 9);
  ('СТР' = l3v5z) :
 _if l3v4z _then   write(' СТРОЕВ ') _else  l2v10z := (l2v10z + 9);
  ('БРО' = l3v5z) :
 _if l3v4z _then   write('БРОНЬ ') _else  l2v10z := (l2v10z + 7);
  ('ПОД' = l3v5z) : _(
 _if l3v4z _then   write('ПОДРАЗДЕЛЕН') _else l2v10z := (l2v10z + 12);
  _if (l2a1z = 3) _then l2v20z[4] := true;
 _);
  ('ПУС' = l3v5z) : _(
   l3v3z := (l3v3z + 1);
   _if l3v4z _then L3213( l2v73z[l3v3z] ) _else
   l2v10z := ((l2v10z + l2v73z[l3v3z]) + 1);
_);
 true:_(
   writeln('НЕТ ПАРАМ.');
   ГГ( l3v5z );
   L1160;
 _)
 _end;
 _if l3v4z _then  write(star);
 _); (* for *)
 L4410;
 _if (l2a1z = 3) _then_(
 _if (l2v19z <> 'ПОД') _then _(
 _if l3v4z _then write('КОЛ-ВО', star:2, ' ПРОЦЕНТ', star:2) _else  l2v10z := (l2v10z + 18);
  _) _else  _if l3v4z  _then  write('ЧИСЛО АНКЕТ', star) _else  l2v10z := (l2v10z + 12);
  _); 
_if l3v4z _then  writeLN _else  L4306;

 _); (* while *)
 L4306
_);

 _proced L5423;
_var l3v1z, l3v2z, l3v3z, l3v4z, l3v5z:integer;
_(
 l3v1z := 1;
 _while _not (l3v1z > (l2v8z - 1)) _do _(
 l3v2z := l2v109z[l3v1z];
 l3v3z := l2v109z[(l3v1z + 1)];
 l3v1z := (l3v1z + 2);
 _case l3v2z _of
1: l3v4z :=   age1;
2: l3v4z :=   f4;
3: l3v4z :=   f5;
4: l3v4z :=   age2;
5: _( l3v4z :=   fe;
    _if _not (l3v3z > 2) _then  l3v4z :=   days( l3v4z, 0 );
   _);
6: l3v4z :=   L2275;
7: l3v4z :=   fc
 _end;
 _if (l3v4z = 0) _then_(
   _if _not (l3v3z <> 1) _then  _(
   l2v57z[l3v2z] := (l2v57z[l3v2z] + 1);
  _) _else _if _not (l3v3z <> 2) _then
    l2v65z[l3v2z] := (l2v65z[l3v2z] + 1);
_);
 l3v5z := l2v25z[l3v3z][l3v2z];
 _case l3v3z _of
1: l3v5z := (l3v5z + l3v4z);
2: l3v5z := (l3v5z + l3v4z);
3: _if _not (l3v4z <= l3v5z) _then  l3v5z := l3v4z;
4: _if _not (l3v4z >= l3v5z) _then  l3v5z := l3v4z
_end;
 l2v25z[l3v3z][l3v2z] := l3v5z;
 _) (* -> 5426 *)
_);

_proced L5563;
_var l3v1z, l3v2z:integer; l3v3z:alfa;
_(
 _for l3v1z := 1 _to l2v9z _do _(
 l3v3z := l2v83z[l3v1z];
 l2v4z :=   L2165( l3v3z );
 _select
 ('ВОЗ' = l3v3z) : l3v2z :=   age1;
 ('КПС' = l3v3z) : l3v2z :=   f4;
 ('ВЛК' = l3v3z) : l3v2z :=   f5;
 ('СТА' = l3v3z) : l3v2z :=   age2;
 ('ЗАЧ' = l3v3z) : l3v2z :=   fe;
 ('ЗАР' = l3v3z) : l3v2z :=   L2275;
 ('ДЕТ' = l3v3z) : l3v2z :=   fc;
 ('ТЕЛ' = l3v3z) : l3v2z :=   fd
_end;
 stkovf( l3v2z, l2v4z );
  (* for 5566 *) _);
 _);

_proced L5652;
_label 6024;
_var l3v1z, l3v2z, l3v3z, l3v4z, l3v5z, l3v6z, l3v7z:integer;
_(
 write(star);
 l3v1z := 1;
 _while _not (l3v1z >= (l2v8z - 1)) _do _(
 write(sp);
 l3v3z := l2v109z[l3v1z];
 l3v2z := l2v109z[(l3v1z + 1)];
 _if _not ( (l2a1z <> 3) _or  (l3v1z <> 1)) _then  _(
 L3450( g2083z@[1] );
 write(star:2, sp);
 _);
 l3v1z := (l3v1z + 2);
 l3v4z := l2v25z[l3v2z][l3v3z];
 _if _not (l3v2z <> 1) _then  l3v5z := (g2074z - l2v57z[l3v3z]);
 _if (l3v2z = 2) _then _(
 l3v6z := (g2074z - l2v65z[l3v3z]);
 _if _not (l3v6z <> 0) _then  _(
 l3v4z := 0;
 l3v7z := ;
 _) _else _(
 (*=m+*)
 l3v7z := trunc(((((l3v4z _MOD g2074z) * 10)) / (g2074z)));
 l3v4z := trunc(((l3v4z) / (g2074z)));
_)
_);
 _if _not ( (l3v2z <> 4) _or  (l3v4z <> 9999999)) _then  l3v4z := 0;
 _if  (l3v4z <> 0) _then  _if ( (l3v3z = 2) _or  (l3v3z = 3)) _then  _(
 _if _not (l3v2z <> 1) _then  l3v4z := ((1900 * l3v5z) + l3v4z)
  _else l3v4z := (1900 + l3v4z);
_);
 _if _not ( (l3v3z <> 5) _or  (l3v2z > 2)) _then  l3v4z :=   L2251( l3v4z );
 _if (l3v2z = 1) _then _(
 _if _not (l3v3z <> 5) _then  _(
 write(sp :11);
 _) _else  write(l3v4z  : 11);
  _goto 6024;
_);
 _if _not (l3v2z <> 2) & (l3v3z _IN [1,4,6,7]) _then _(
 write(l3v4z  :  6, dot, l3v7z  :  1, sp:3);
 _goto 6024;
 _);
 _if _not (l3v3z <> 5) _then  _(
 L3253( l3v4z );
 write(sp);
 _goto 6024;
 _);
 write(l3v4z  :  8);
 write(sp :  3);
6024:
 write(star:  2);
  (* while L5656 *) _);
 L1063;
 _);

_proced L6032;
_var l3v1z, l3v2z:integer; _(
  _select 
 ('НАЦ' = l2v19z) : l3v1z :=   f3;
 ('ДОЛ' = l2v19z) : l3v1z :=   fh;
 ('СТЕ' = l2v19z) : l3v1z :=   f8;
 ('ЗВА' = l2v19z) : l3v1z :=   f9;
 ('ВОИ' = l2v19z) : l3v1z :=   fj;
 ('ОБР' = l2v19z) : l3v1z :=   f7;
 ('СЕМ' = l2v19z) : l3v1z :=   fb;
 ('СОС' = l2v19z) : l3v1z :=   fi;
 ('ПОЛ' = l2v19z) : l3v1z :=   f1;
 ('СТР' = l2v19z) : l3v1z :=   fk;
 ('БРО' = l2v19z) : l3v1z :=   fl;
 ('ПРО' = l2v19z) : l3v1z :=   f6
_end;
 l3v2z := trunc(((l3v1z) / 48));
 l2v14z[l3v2z] := l2v14z[l3v2z] + [l3v1z _MOD 48];
 l2v109z[l3v1z] := (l2v109z[l3v1z] + 1);
_);

_proced L6145;
_var l3v1z:integer;
_(
 _for l3v1z := 0 _to ((48 * 1) + 47) _do _(
 _if ((l3v1z _MOD 48) _IN l2v14z[trunc(((l3v1z) / 48))]) _then _(
 write(star, sp);
_select 
 ('НАЦ' = l2v19z) : L3403( l3v1z, 1 );
 ('ДОЛ' = l2v19z) : L3501( l3v1z, false );
 ('СТЕ' = l2v19z) : L3431( l3v1z );
 ('ЗВА' = l2v19z) : L3436( l3v1z );
 ('ВОИ' = l2v19z) : L3531( l3v1z );
 ('ОБР' = l2v19z) : L3424( l3v1z );
 ('СЕМ' = l2v19z) : L3443( l3v1z );
 ('СОС' = l2v19z) : L3524( l3v1z );
 ('ПОЛ' = l2v19z) : L3376( l3v1z );
 ('СТР' = l2v19z) : L3536( l3v1z );
 ('БРО' = l2v19z) : L3543( l3v1z );
 ('ПРО' = l2v19z) : L3417( l3v1z )
_end;
 L4435( l3v1z );
 L1063;
_);
  (* for 6150 *) _);
 _);

_proced L6273;
_var l3v1z, l3v2z:integer;
_(
_select
 ('ВОЗ' = l2v19z) : l3v2z :=   age1;
 ('КПС' = l2v19z) : l3v2z :=   f4;
 ('ВЛК' = l2v19z) : l3v2z :=   f5;
 ('СПЕ' = l2v19z) : l3v2z :=   fa;
 ('ДЕТ' = l2v19z) : l3v2z :=   fc;
 ('СТА' = l2v19z) : l3v2z :=   age2;
 ('ЗАР' = l2v19z) : l3v2z :=   L2275;
 ('РОЖ' = l2v19z) : l3v2z :=   f2;
 ('ЗАЧ' = l2v19z) : l3v2z :=   fe;
 ('ПОВ' = l2v19z) : l3v2z :=   ff;
 ('ТЕЛ' = l2v19z) : l3v2z :=   fd
_end;
 _for l3v1z := 1 _to l2v12z _do 
 _if _not (l2k1110z[l3v1z] <> l3v2z) _then  _(
   l2v109z[l3v1z] := (l2v109z[l3v1z] + 1);
   EXIT;
 _);
 l2v12z := (l2v12z + 1);
 _if _not (l2v12z < 2000) _then  _(
 writeln('ВЫ ХОТИТЕ СЛИШКОМ МНОГО');
 writeln('НЕ ХВАТАЕТ ПАМЯТИ');
 L1160;
 _);
 l2k1110z[l2v12z] := l3v2z;
 l2v109z[l2v12z] := 1;
 _);

_proced L6415;
_var l3v1z, l3v2z:integer;
_(
 _for l3v1z := 1 _to l2v12z _do _(
 write(star, sp);
 l3v2z := l2k1110z[l3v1z];
_case l2v11z _of
 6: write(l3v2z  :  5);
 8, 9: L3241( l3v2z );
 14: L3165( l3v2z );
 16, 21: write(l3v2z  :  2);
 24: write(l3v2z  :  9, spaces);
 5, 19, 23: L3253( l3v2z );
 18: L3562( l3v2z )
_end;
 L4435( l3v1z );
 L1063;
  (* for 6420 *) _);
 _);

_proced L6506;
_var l3v1z, l3v2z, l3v3z, l3v4z:integer;
_(
 l3v3z := l2v12z;
 _repeat
 l3v2z := 0;
 _for l3v1z := 1 _to (l3v3z - 1) _do _(
 _if _not (l2k1110z[l3v1z] <= l2k1110z[(l3v1z + 1)]) _then  _(
 l3v4z := l2k1110z[l3v1z];
 l2k1110z[l3v1z] := l2k1110z[(l3v1z + 1)];
 l2k1110z[(l3v1z + 1)] := l3v4z;
 l3v4z := l2v109z[l3v1z];
 l2v109z[l3v1z] := l2v109z[(l3v1z + 1)];
 l2v109z[(l3v1z + 1)] := l3v4z;
 l3v2z := l3v1z;
 _);
  (* for 6513 *) _);
 _if _not (l3v2z = 0) _then  l3v3z := l3v2z;
 _until (l3v2z = 0);
 _);

(* Level 3 *) _proced L6552(l3a1z:integer);
_var l3v1z:integer;
_(
 g2077z := 1;
 _for l3v1z := 1 _to 7 _do _(
 wrPacked(g2082z@[l3v1z]);
 _if ( (l3v1z = 3) _or  (l3v1z = 5)) _then  _(
 write(sp);
 g2077z := (g2077z + 1);
_)
  (* for 6556 *) _);
 L3213( (l3a1z - g2077z) );
 _);

_proced L6625;
_var l3v1z, l3v2z, l3v3z:integer; l3v4z:alfa;
(* Level 4 *) _proced L6602(l4a1z, l4a2z, l4a3z:integer);
_var l4v1z:integer;
 _(
 g2077z := 0;
 _for l4v1z := l4a1z _to l4a2z _do wrPacked(g2082z@[l4v1z] );
 L3213( (l4a3z - g2077z) );
 _);

_( (* L6625 *)
 _if _not (l2v9z <> 0) _then  EXIT;
 l3v2z :=   f1;
 l3v3z := 0;
 write(star);
 _for l3v1z := 1 _to l2v9z _do _(
 write(sp);
  l3v4z := l2v83z[l3v1z];
_select 
 ('ФАМ' = l3v4z) : L6602( 1, 3, 24 );
 ('ФИО' = l3v4z) : L6552( 40 );
 ('ФИН' = l3v4z) : _(
 L6602( 1, 3, 0 );
 write(sp);
 wrc6( g2082z@[4] );
 wrc6( g2082z@[6] );
 L3213( (24 - g2077z) );
_);
 ('ИМЯ' = l3v4z) : L6602( 4, 5, 16 );
 ('ОТЧ' = l3v4z) : L6602( 6, 7, 16 );
 ('ПОД' = l3v4z) : _if l2v20z[4] _then  L3450( g2083z@[1] ) _else L3450(   f0  );
 ('ПОЛ' = l3v4z) : L3376( l3v2z );
 ('РОЖ' = l3v4z) : L3253(   f2  );
 ('ВОЗ' = l3v4z) : write(age1:3, sp:2);
 ('НАЦ' = l3v4z) : L3403(   f3 , l3v2z );
 ('КПС' = l3v4z) : L3241(   f4  );
 ('ВЛК' = l3v4z) : L3241(   f5  );
 ('ПРО' = l3v4z) : L3417(   f6  );
 ('ОБР' = l3v4z) : L3424(   f7  );
 ('СТЕ' = l3v4z) : L3431(   f8  );
 ('ЗВА' = l3v4z) : L3436(   f9  );
 ('СПЕ' = l3v4z) : L3165(   fa  );
 ('СЕМ' = l3v4z) : L3443(   fb  );
 ('ДЕТ' = l3v4z) : write( fc : 2);
 ('АДР' = l3v4z) : L6602( 14, 17, 32 );
 ('ТЕЛ' = l3v4z) : L3562(   fd  );
 ('ЗАЧ' = l3v4z) : L3253(   fe  );
 ('ПОВ' = l3v4z) : L3307(   fg  );
 ('СТА' = l3v4z) : write( age2 : 2);
 ('ДОЛ' = l3v4z) : L3501(   fh , true );
 ('ЗАР' = l3v4z) : L3614;
 ('СОС' = l3v4z) : L3524(   fi  );
 ('ВОИ' = l3v4z) : L3531(   fj  );
 ('СТР' = l3v4z) : L3536(   fk  );
 ('БРО' = l3v4z) : L3543(   fl  );
 ('ПУС' = l3v4z) : _( l3v3z := l3v3z + 1; L3213(l2v73z[l3v3z] - 2) _)
 _end;

 write(star :2);
  (* for 6640 *) _);
 _if l2v20z[4] _then write(g2074z  :  7, star:5);
 L1063;
 g2090z := (g2090z + 1);
_);

_proced L10000;
_var l3v1z, l3v2z:integer;
l3v3z, l3v4z:@a17;
l3v5z:@page;
l3v6z:_array [0..14314] _of integer;

_function L7171(_var l4a1z:a17):integer;
 _(
 _if (ref(l4a1z) = l3v4z) _then L7171 := 0
 _else _if (ref(l4a1z) = l3v5z) _then L7171 := 9999999
 _else _(
 g2082z := ref(l4a1z);
 _select
 ('СТА' = s.s2) : L7171 :=   age2;
 ('ЗАЧ' = s.s2) : L7171 :=   fe;
 ('ЗАР' = s.s2) : L7171 :=   L2275;
 ('ДОЛ' = s.s2) : L7171 :=   fh;
 ('ВОЗ' = s.s2) : L7171 :=   age1;
 ('РОЖ' = s.s2) : L7171 :=   f2;
 ('ПОВ' = s.s2) : L7171 :=   ff;
 ('ДЕТ' = s.s2) : L7171 :=   fc;
 ('КПС' = s.s2) : L7171 :=   f4;
 ('ВЛК' = s.s2) : L7171 :=   f5;
 ('СПЕ' = s.s2) : L7171 :=   fa;
 ('ОБР' = s.s2) : L7171 :=   f7;
 ('СТЕ' = s.s2) : L7171 :=   f8;
 ('ТЕЛ' = s.s2) : L7171 :=   fd;
 ('ЗВА' = s.s2) : L7171 :=   f9;
 ('ВОИ' = s.s2) : L7171 :=   fj
_end _)
 _);
(*=m-*)_proced L7323;
_label 1;
_var l4v1z:@a17;
l4v2z, l4v3z, l4v4z, l4v5z, l4v6z, l4v7z, l4v8z:integer;
_(
 memset( ord(l3v3z), 17, 0 );
 l3v4z := l3v3z;
 _for l4v5z := g2283v _to g2282z _do _(
 _if ((l4v5z _MOD 48) _IN l2v16z[trunc(l4v5z / 48)]) _then _(
 l4v6z := ((10 * l4v5z) + 4);
 g2083z := ptr(ord(ref(listA)) + l4v6z);
 g2071z := sel(g2083z@[2], 0, 16);
 _for l4v2z := 4 _to 7 _do _(
 _for l4v3z := 0 _to 3 _do _(
 l4v4z := (12 * l4v3z);
 g2072z := sel(g2083z@[l4v2z], l4v4z, 11);
 _if _not (g2072z <> 0) _then _goto 1;
 L1766;
 _for l4v7z := 0 _to (g2070z - 1) _do _(
 g2082z := ptr((17 * l4v7z) + l3v2z);
 _if L2546 _then _(
 _if _not (g2074z < 840) _then  _(
 writeln('ТАК НЕЛЬЗЯ');
 L1160;
 _);
 l4v1z := ptr((g2074z * 17) + ord(l3v3z));
 _for l4v8z := 1 _to 17 _do _(
  l4v1z@[l4v8z] := g2082z@[l4v8z];
  (* for 7416 *) _);
 _)
  (* for 7374 *) _);
  (* for 7356 *) _);
  (* for 7353 *) _);
  _);
1:
  (* for 7332 *) _);
 l4v1z := ptr(((g2074z + 1) * 17) + ord(l3v3z));
 l3v5z := ;
 _if _not (s.s2 <> 'ФИО') _then  _(
 l4v2z := (7676767676767676C);
 l4v1z@[1] := ;
 _);
 _);

_function L7447(_var l4a1z, l4a2z:a17):integer;
_label 1;
_var l4v1z, l4v2z, l4v3z, l4v4z, l4v5z:integer;
_(
 _if (s.s2 = 'ФИО') _then _(
 _for l4v5z := 1 _to 7 _do _(
 l4v1z := l4a1z[l4v5z];
 l4v2z := l4a2z[l4v5z];
1:
_repeat
 code(4СЧ6=СД/-6/,4ЗЧ6=МР,);
 l4v3z := ;
 _until (l4v3z <> 77B);code(ИА=ИА,);
 _repeat
 code(4СЧ7=СД/-6/,4ЗЧ7=МР,);
 l4v4z := ;
 _until (l4v4z <> 77B);code(ИА=ИА,);
 _select
 (l4v3z = l4v4z): _(
    L7447 := 1;
   _if _not (l4v3z = 0) _then  _goto 1;
  _);
  (l4v3z < l4v4z): _( L7447 := 2; EXIT;_);
  true: _( L7447 := 3; EXIT; _)
  _end;
  (* for 7456 *) _);
_) _else _(
 l4v3z :=   L7171(l4a1z);
 l4v4z :=   L7171(l4a2z);
 _if _not (l4v3z <= l4v4z) _then  _(
 L7447 := 3;
 _) _else _if _not (l4v3z >= l4v4z) _then  _(
 L7447 := 2;
 _) _else
 L7447 := 1;
 _)
_);

_proced L7553;
_label  7560, 7566, 7717, 7726, 7757;
_var l4v1z, l4v2z, l4v3z, l4v4z:@a17;
l4v5z:a17;
l4v21z, l4v31z:_array [1..10] _of integer;
l4v42z, l4v43z, l4v44z, l4v45z, k, i:integer;

(* Level 5 *) _proced L7535(l5a1z:integer);
 _(
 l4v3z := ptr(ord(l3v3z) + 17 * l5a1z);
 _for i := 1 _to 17 _do _(
 l4v5z[i] := l4v3z@[i];
  (* for 7543 *) _);
 _);

_( (* L7553 *)
 k := 0;
 l4v44z := 1;
 l4v45z := g2074z;
 7560:
  _if  _not ((l4v45z - l4v44z) > 9) _then _goto 7717;
 l4v42z := l4v44z;
 l4v43z := l4v45z;
 L7535( l4v44z );
 7566: (a) _(
 l4v2z := ptr(ord(l3v3z) + 17 * l4v43z); 
 _if _not (L7447(l4v5z, l4v2z@) <> 2) _then l4v43z := (l4v43z - 1)
 _else _exit a;
 _goto a;
 _);
 l4v1z := ptr((17 * l4v42z) + ord(l3v3z));
 _if (l4v43z <= l4v42z) _then _(
 _for i := 1 _to 17 _do l4v1z@[i] := l4v5z[i];
 _) _else _( 
 _for i := 1 _to 17 _do l4v1z@[i] := l4v2z@[i];
 l4v42z := (l4v42z + 1);
 (L7633) _(
   l4v1z := ptr((17 * l4v42z) + ord(l3v3z));
   _if _not (L7447(l4v1z@, l4v5z) <> 2) _then  _( code(ИА=ИА,);
   l4v42z := (l4v42z + 1);
    _) _else _exit L7633;
   _goto L7633;
 _);
 _if (l4v43z <= l4v42z) _then _(
   _for i := 1 _to 17 _do l4v2z@[i] := l4v5z[i];
   l4v42z := l4v43z;
  _) _else _(
 _for i := 1 _to 17 _do l4v2z@[i] := l4v1z@[i];
   l4v43z := (l4v43z - 1);
  _goto 7566
  _)
  _); 
k := (k + 1);
 _if _not ((l4v45z - l4v42z) < (l4v42z - l4v44z)) _then  _(
 l4v21z[k] := (l4v42z + 1);
 l4v31z[k] := l4v45z;
 l4v45z := (l4v42z - 1);
 _) _else _(
 l4v21z[k] := l4v44z;
 l4v31z[k] := (l4v42z - 1);
 l4v44z := (l4v42z + 1);
 _);
 _goto 7560;
7717:
l4v43z := l4v44z;
 _while _not (l4v43z >= l4v45z) _do _(
 l4v43z := (l4v43z + 1);
 L7535( l4v43z );
 l4v42z := (l4v43z - 1);
 7726:
 l4v4z := ptr((l4v42z + 1) * 17 + ord(l3v3z));
 l4v1z := ptr((17 * l4v42z) + ord(l3v3z));
 _if _not (L7447( l4v1z@, l4v5z) > 2) _then _goto 7757
_else _(
 _for i := 1 _to 17 _do l4v4z@[i] := l4v1z@[i] ;
 l4v42z := (l4v42z - 1);
 _);
 _goto 7726;
 7757:
 _for i := 1 _to 17 _do l4v4z@[i] := l4v5z[i];
  (* while L7720 *) _);
 _if _not (k <= 0) _then  _(
 l4v44z := l4v21z[k];
 l4v45z := l4v31z[k];
 k := (k - 1);
 _goto 7560
 _);

 _);

_( (* L10000 *)
 l3v3z := ref(l3v6z);
 l3v2z := 26628;
 g2387z := [
'777','ФИО','РОЖ','ВОЗ','КПС',
'ВЛК','ОБР','СТЕ','ЗВА','СПЕ',
'ДЕТ','ЗАЧ','СТА','ДОЛ','ПОВ',
'ЗАР','ВОИ','ТЕЛ'];

 l3v1z :=   L2146( s.s2, 17 );
 _if (l3v1z = 0) _then  _(
 writeln('НЕТ ПАРАМ.СОРТИРОВКИ');
 ГГ( s.s2 );
 L1160;
 _);
 stats( 8, l3v1z );
 stats( 8, 19 );
 L7323;
 L7553;
 _if s.s3  _then _(
 _for l3v1z := g2074z _downto 1 _do _(
   g2082z := ptr((l3v1z * 17) + ord(l3v3z));
   _if (l2a1z = 5) _then  L6625 _else L3770;
  (* for 10055 *) _);
 _) _else _(
 _for l3v1z := 1 _to g2074z _do _(
   g2082z := ptr((l3v1z * 17) + ord(l3v3z));
 _if (l2a1z = 5) _then  L6625 _else  L3770;
  (* for 10073 *) _);
_)
_);

 _proced L10110;
_label 10216;
_var l3v1z, l3v2z, l3v3z, l3v4z, l3v5z, l3v6z, l3v7z:integer;
_(
 _for l3v5z := 1 _to 8 _do _(
 _if g2199z[l3v5z] _or  g2207z[l3v5z] _then  _(
 _if g2199z[l3v5z] _then  l3v4z := 3 _else  l3v4z := 4;
 l2v109z[l2v8z] := l3v5z;
 l2v109z[(l2v8z + 1)] := l3v4z;
 l2v8z := (l2v8z + 2);
_);
  (* for 10113 *) _);
 _for l3v4z := g2283v _to g2282z _do _(
 _if ((l3v4z _MOD 48) _IN l2v16z[trunc(((l3v4z) / 48))]) _then _(
 l3v5z := ((10 * l3v4z) + 4);
 g2083z := ptr(ord(l2v82z) + l3v5z);
 g2071z := sel(g2083z@[2], 0, 16);
 _for l3v1z := 4 _to 7 _do _(
 _for l2v3z := 0 _to 3 _do _(
 l3v3z := (12 * l2v3z);
 g2072z := sel(g2083z@[l3v1z], l3v3z, 11);
 _if _not (g2072z <> 0) _then _goto 10216;
 L1766;
 _for l3v2z := 0 _to (g2070z - 1) _do _(
 g2082z := ptr((17 * l3v2z) + l2v7z);
 _if L2546 _then  L5423;
  (* for 10176 *) _);
  (* for 10160 *) _);
  (* for 10155 *) _);
_);
 10216:
  (* for 10135 *) _);
 L4273;
 _for l3v5z := 1 _to 8 _do _(
 _if g2199z[l3v5z] _or  g2207z[l3v5z]  _then  _(
 _if g2199z[l3v5z] _then  l3v4z := 3 _else l3v4z := 4;
 (*=m-*)l3v6z := l2v25z[l3v4z][l3v5z];
 l3v7z := g2189z[l3v5z];
 _case l3v5z _of
1: _(
 g2221z := l3v6z;
 g2222z := ;
 s.s4 := l3v7z;
_);
2: _(
 g2223z := l3v6z;
 g2224z := ;
 s.s5 := l3v7z;
_);
3:_(
 g2225z := l3v6z;
 g2226z := ;
 s.s6 := l3v7z;
_);
4: _(
 g2227z := l3v6z;
 g2228z := ;
 s.s7 := l3v7z;
_);
5: _(
 g2229z := l3v6z;
 g2230z := ;
 s.s8 := l3v7z;
_);
6: _(
 g2231z := l3v6z;
 g2232z := ;
 s.s9 := l3v7z;
_);
7: _(
 g2244z := l3v6z;
 g2245z := ;
 g2171z := l3v7z;
_);
8: _(
 g2257z := l3v6z;
 g2258z := ;
 g2178z := l3v7z;
_)
 _end;
  _); 
 _); 
 L4351;
 l2v8z := 1;
 g2199v := false;
 _for l3v1z := 1 _to 8 _do  _(
 g2199z[l3v1z] := false;
 g2207z[l3v1z] := ;
 _);
_);

_( (* work *)
stats( 4, (8 - l2a1z) );
 rdZPCH;
 rdDB;
 _if g2198z _then  _(
 g2080z := (g2282z - g2283v);
 g2282z := g2283v;
 _);
 L4316;
 L4351;
 l2v20z[0] := false;
 l2v20z[1] := ;
 l2v20z[2] := ;
 l2v20z[3] := ;
 l2v20z[4] := ;
 l2v20z[5] := ;
 l2v8z := 1;
 l2v10z := ;
 l2v1z := 0;
 l2v12z := ;
 l2v13z := ;
 l2v7z := 26628;
 l2v82z := ref(listA);
 l2v83v := pg32ptr;
_if g2199v  _then  L10110;
 _if _not (l2a1z <> 4) _then _goto 10674;
 _if _not ( (INP@ <> etx) _or  (l2a1z <> 3)) _then  _(
 writeln('ОШ.:НЕТ ОПЕРАНДОВ');
 EXIT;
 _);
_while _not ( (INP@ = etx) _or  (INP@ = '&')) _do _(
 _if getAlfa( cmd2) _then _(
 tkNext;
 l2v1z := (l2v1z + 1);
 l2v83z[l2v1z] := cmd2;
 _if (cmd2 = 'ПУС') _then _(
 l2v3z :=   getDec;
 _if ( (l2a1z <> 5) _or  (l2v3z < 2)) _then  L4252;
 l2v13z := (l2v13z + 1);
 l2v73z[l2v13z] := l2v3z;
_) _else _if (L2205( cmd2) = 0) _and  (cmd2 <> 'ФИО') _and (cmd2 <> 'ФИН') _then _(
 writeln('ОШ.:НЕТ ПАРАМ. ');
 ГГ( cmd2 );
 writeLN;
 L1160;
 _);
_select 
 (INP@ = ',') : _(
 _if l2v20z[2]  _then  L4252;
 l2v20z[3] := true;
 get(INP);
_);
 (INP@ = '(') : _(
 _if l2v20z[3] _then  L4252;
 get(INP);
 l2v4z :=   L2165( cmd2 );
 _if l2v4z = 0 _then  L4252;
 10457:
_if getAlfa( a)  _then _(
 _select
 ('СУМ' = a) : l2v5z := 1;
 ('СРЕ' = a) : l2v5z := 2;
 ('МАК' = a) : l2v5z := 3;
 ('МИН' = a) : l2v5z := 4;
 ('ЗАП' = a) : _(
   _if _not (l2a1z = 5) _then  L4252;
   l2v20z[1] := true;
   l2v20z[2] := ;
    _goto 10551;
  _); 
 true: _(  writeln('НЕТ ОПЕР.'); ГГ( a ); writeLN; L1160 _)
  _end
 _) _else L4252;
(*=m+*)_for l2v6z := 1 _to trunc((l2v8z - 1) / 2) _do
 _if _not ( (l2v109z[((2 * l2v6z) - 1)] <> l2v4z)
 _or  (l2v109z[(2 * l2v6z)] <> l2v5z)) _then  L4252;
 l2v109z[l2v8z] := l2v4z;
 l2v109z[(l2v8z + 1)] := l2v5z;
 l2v8z := (l2v8z + 2);
 l2v20z[0] := true;
 l2v20z[2] := ;
 10551:
 _select
 (INP@ = ',') : _(  get(INP); _goto 10457; _);
 (INP@ = ')') :  get(INP);
 true: _( writeln('ОШ.ЗНАКА', INP@); L1160; _)
 _end
 _); 
  ( (INP@ = '&') _or  (INP@ = etx)) :  _(
 _if l2v20z[2] _then  L4252;
_);
 true: L4252
 _end
_) _else L4252;
 skipsp;
 _if _not (INP@ <> ',') _then get(INP);
 _); 
 l2v9z := l2v1z;
 _if l2v20z[1] _then _select
 (g2385z = 2) :  _if _not l2v20z[0] _then  g2385z := 3;
 (g2385z = 1) :  _if l2v20z[0] _then  g2385z := 3;
 (g2385z = 0) :  _if l2v20z[0] _then  g2385z := 2 _else g2385z := 1
 _end;
 _if _not ( (l2a1z <> 3) _or  (l2v20z[0])) _then _(
 _if _not (l2v9z <= 1) _then L4252
 _else _(
 l2v19z := l2v83z[1];
 l2v11z :=   L2205( l2v19z );
 _if (l2v11z _IN [5,6,8,9,14,16,18,19,21,23,24]) _then  l2v20z[5] := true;
 _for l2v1z := 0 _to 2000 _do l2v109z[l2v1z] := 0;
  _)
 _);
_if ( (l2a1z <> 5) _or  l2v20z[2]) _then  _(
 _if (s.s2 <> '0') _then  L4252;
_);
 _if l2v20z[0] _then L4476
 _else _if _not l2v20z[1] _then  L4662;
10674:
 _if (s.s2 <> '0') _then L10000 _else _(
  _for l2v5z := g2283v _to g2282z _do _(
 _if ((l2v5z _MOD 48) _IN l2v16z[trunc(((l2v5z) / 48))]) _then _(
 (*=m-*)
 l2v4z := ((10 * l2v5z) + 4);
 g2083z := ptr(ord(l2v82z) + l2v4z);
 g2076z := 0;
 g2071z := sel(g2083z@[2], 0, 16);
 _for l2v1z := 4 _to 7 _do _(
 _for l2v3z := 0 _to 3 _do _(
 l2v6z := (12 * l2v3z);
 g2072z := sel(g2083z@[l2v1z], l2v6z, 11);
 _if _not (g2072z <> 0) _then _goto 11030;
 L1766;
 _if (l2a1z = 5) _then _(
 _for l2v2z := 0 _to (g2070z - 1) _do _(
 g2082z := ptr((17 * l2v2z) + l2v7z);
 g2076z := (g2076z + 1);
 _if L2546 _then
 _if l2v20z[0] _then L5423
 _else _if l2v20z[1] _then  L5563
 _else  L6625;
  (* for 10743 *) _);
  _) _else _( 
  _for l2v2z := 0 _to (g2070z - 1) _do _(
 g2082z := ptr((17 * l2v2z) + l2v7z);
 g2076z := (g2076z + 1);
 _if L2546 _then_(
 _if l2v20z[0] _then  L5423
 _else _if (l2a1z = 2) _then _( L6552( 40 ); L1063; EXIT; _)
 _else _if (l2a1z = 3) _then _(
 _if l2v20z[5] _then L6273 _else  L6032;
_) _else _if _not (l2a1z <> 4) _then  L3770;
 _);
  (* for 10767 *) _);
  _) 
  _) _);
11030:
  _if (l2a1z = 3) _then _(
 _if l2v20z[0]  _then  _(
 L5652;
 L4351;
  _) _else _if l2v20z[4] _then _(
    _if _not (g2074z <= 0) _then  L6625;
     g2074z := 0;
     _)
   _)
  _) 
 _)
 _);  
 _if (l2a1z = 5) _then_(
 L4273;
 _if l2v20z[2] _then _(
   _if l2v20z[1] _then _(
 l2v1z := 1;
 _while _not (l2v1z > (l2v8z - 1)) _do _(
 l2v4z := l2v109z[l2v1z];
 l2v5z := l2v109z[(l2v1z + 1)];
 l2v1z := (l2v1z + 2);
 l2v6z := l2v25z[l2v5z][l2v4z];
 _if _not (l2v5z <> 2) _then  l2v6z := trunc(((l2v6z) / ((g2074z - l2v65z[l2v4z]))));
 _if _not ( (l2v4z <> 5) _or  (l2v5z > 2)) _then  l2v6z :=   L2251( l2v6z );
 stkovf( l2v6z, l2v4z );
  (* while L11050 *) _);
_) _else _(
 L5652;
 L4306;
_)
_) _else _(
 L4306;
 write('ЧИСЛО АНКЕТ:');
 L3165( g2074z );
 L1063;
_);
_) _else _(
 _if _not ( (l2a1z <> 3) _or  (l2v20z[0])) _then _(
 _if (l2v19z <> 'ПОД') _then _(
 L4273;
 _if l2v20z[5] _then  _(
 L6506;
 L6415;
 _) _else L6145;
_);
 _);
 L4306;
_);
 _if _not ( _not g2198z  _or  (g2080z < 0)) _then  _(
 g2080z := (g2080z - 1);
 g2283v := (g2283v + 1);
 g2282z := g2283v;
 reset(INP);
 _GOTO 11546;
 _);
 L1050;

_);

_proced save;
_var l2v1z:@page; l2v2z:integer;
_(
 l2v2z := 0;
  l2v1z := ref(s.sizeof);
  _for l2v2z := 0 _to s.sizeof _do g2085z@[l2v2z] := l2v1z@[l2v2z];
_);

 _proced restore;
_var l2v1z:@page; l2v2z:integer;
_(
 l2v2z := 0;
  l2v1z := ref(s.sizeof);
  _for l2v2z := 0 _to s.sizeof _do  l2v1z@[l2v2z] := g2085z@[l2v2z];
 _);

_proced L11204;
_var l2v1z, l2v2z:integer;
_(
 _if _not debug _then _(
 code(Э0634=,);
 l2v1z := ;
 l2v1z := (l2v1z - begCPU);
 _if _not (l2v1z >= 0) _then  EXIT;
 code(Э05310=,);
 l2v2z := ;
 l2v2z := (l2v2z - begTime);
 _if _not (l2v2z >= 0) _then  EXIT;
 g2088z := shift(l2v1z, 2);
 stats(4, 33 );
 (q) g2088z := shift(l2v2z, 9);
 stats(4, 36 );
 g2088z := g2089z;
 stats( 4, 24 );
 g2088z := g2090z;
 stats( 4, 27 );
 g2088z := g2091z;
 stats( 4, 30 );
  _)
_);

_proced exec(l2a1z:integer);
_var l2v1z:integer; l2v2z:sixchars;
F:text;
_procedure L11256(_var f:text; _var d:data; j:integer); _( code(ПБ76022=,); _);
_(
 _if ЗАПРЕТ _or debug _then _GOTO 11667;
_if ([2,3] * d.flags) = [] _then  _(
 stats( 4, 16 );
 writeln(ornament:18, '   ВЫ ВЫШЛИ ИЗ БЛОКА СПРАВОК  ', ornament);
 _) _else save;
 L11204;

_if (l2a1z = (3401751C))
 _or (l2a1z = (6660723C)) _then L11256( INP, d, 70B ) _else _(
 rewrite(F);
 unpck(l2v2z[1], cmd );
 _for l2v1z := 1 _to 3 _do _( F@ := l2v2z[(l2v1z + 3)]; put(F) _);
  F@ := sp; put(F);
 _while INP@ <> etx _do _( F@ := INP@; get(INP);  put(F) _);
  F@ := etx; put(F);
 reset(F);
 L11256( F, d, 70B );
 _);
_);

_proced enter;
_procedure L11377(_var f:text; _var d:data; j:integer); _( code(ПБ76021=,); _);
 _(
 L11377(INP, d, 70B);
_if (11 _IN d.flags) _then write('ЬЬМLШ');
 reset(INP);
 restore;
 d.flags := d.flags - [2,3];
 _GOTO 11546;
_);

_proced chkAdmin(l2a1z:integer);
 _(
 _if _not (l2a1z _IN d.perms) _then  _(
 writeln('ВАМ НЕЛЬЗЯ');
 d.flags := d.flags - [2,3];
 _GOTO 11541;
 _);
_);

_proced L11443(l2a1z, l2a2z:integer);
_var l2v1z:integer;
_(
 l2v1z := 000035T;
 code(2ЦС3=ЗЧ75203,ЗЧ75223=2СЧ4,У076002=ЦС13,ЗЧ75204=,);
 rewrite(output);
 _);

_proced L11457;
 _(
 write('{172{175      ');
 code(СЧ75235=ЦС13,СР75204=У074275,Э07075223=,);
 L11443( (270000C), 1 );
 rewrite(output);
_);

_(
 code(СЧ76233=,);
 a := ;
 pg32ptr := _nil;
 g2085z := ptr(67000B);
 g2078z := today;
 g2066z := [0..47];
 g2088z := 1;

 code(Э0634=,);
 begCPU := ;
 code(Э05310=,);
 begTime := ;
 s.sizeof := ord(ref(g2386z)) - ord(ref(s.sizeof));
 g2065z := true;
 ЗАПРЕТ := false;
 debug := ;
 g2089z := ;
 g2090z := ;
 g2091z := ;

  _if (a <> 'ТАМБОВ') _then _(
 L1050;
 writeln('<*>  ОТЛАДКА  <*>');
 d.prnEnable := false;
 d.d14 := 1;
 d.dpyEnable := ;
 debug := ;
 d.curVol := 0;
  _) _else  enter;
_if g2198z _then  _(
 g2080z := g2282z;
 g2282z := g2283v;
 _);
11541:
 timeout;
 L1150;
 TTIN;
 ЗАПРЕТ := false;
 g2065z := ;
11546:
g2061z := 0;
11547:
g2073z := 9999999;
 _if getAlfa(cmd) _then _select
 ('УСТ' = cmd) _or  ('СЛУ' = cmd) _or
 (( ('ПЕЧ' = cmd) _or  ('ВЦП' = cmd)) _or
 ( ('ЭКР' = cmd) _or  ('ШКО' = cmd)) _or
 ( ('ИНФ' = cmd) _or  ('ПАР' = cmd)) _or
 ('ДАТ' = cmd)) : _(
 d.flags := d.flags + [2];
    exec(main)
 _);
 ('НАЙ' = cmd) : work( 5 );
 ('АНК' = cmd) : work( 4 );
 ('ПЕР' = cmd) : work( 3 );
 ('ЗАК' = cmd) : L11457;
 ('ОТЧ' = cmd) : _(  chkAdmin( 2 );
    exec(report);
 _);
 ('ЛИН' = cmd) : _(
 11623: chkAdmin( 4 );
 exec( (6660723C) );
 _);
 ('ДАЙ' = cmd) : _(
 stats( 4, 8 );
 d.flags := d.flags  + [2];
 exec( z5 );
 _);
 ('КОН' = cmd): _(
 rewrite(INP);
 write(INP,'КОН  {377');
11645:
  d.flags := d.flags - [2];
 exec( (3401751C) );
_);
 ('ВЫХ' = cmd): _(
   _if debug _then _(
     writeln('<*>  ВОЗВРАТ  <*>');
     code(СЧ12=ЗЧ76135,ПБ76002=);
   _);
   _if _not g2065z _then _goto 11645;
  _);
 ('SLE' = cmd): _goto 11645; 
 true: _if ЗАПРЕТ _then  11667: writeln('В БЛОКЕ НЕТ ТАКОГО ПРИКАЗА')
  _else _(
   writeln('ХОТИТЕ ВЫЙТИ ИЗ БЛОКА "КАДРЫ" ? <ДА,НЕТ>');
   BIND(' --> {172');
   _if (input@ = 'Д') _then _goto 11645 _else _goto 11541;
  _)
 _end _else writeln('НЕ ПОНИМАЮ');
_if (INP@ = '&') _then  _(
 get(INP);
 _goto 11547;
 _);
 _goto 11541;
_).
