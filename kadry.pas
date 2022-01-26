(*=p-,t-,m-,l-*)
_program КАДРЫ;
_label 7315, 7322, 7323, 7345, 7432, 7532, 7563; 
_const z1 = 3401751B; anketa=6401545B; serv=5401553B;
report=5401565B; z4=6660723B;
z5=1401572B;
dbVol=2060;c112=112;c189=189;c190=190;c191=191;
pl='+';c146=146B;c2=2;c4=4;c7=7;c8=8;c16=16;
sl='/';
c474=474;c54=54;info=401756B;
gt='>';
c214=214;c232=232;c264=264;c296=296;c308=308;c510=510;
c800=800;c832=832;c914=914;c924=924;c934=934;c942=942;
c56=56;c3=3;c6=6;etx='{377';
sp=' ';dot='.';c18=18;c19=19;
c81=81;
minus='-';c36=36;
fin='(FIN){175';comma=',';
star='*';stars='******';
ornament='-=*=- ';
prof='ПРОФ  '; valet='ВАЛЕТ '; 
kadry='!КАДРЫ';catalog='КАТАЛО';zonkd='!ЗОНКД'; zonpch='!ЗОНПЧ';
c17=17;c9999=9999999;

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
cmdarr=_array [1..24] _of alfa;
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
a:alfa;
listA,listB:page;
g2061z:boolean;
g2062z:integer;
ЗАПРЕТ:boolean;
debug:boolean;
g2065z:boolean;
g2066z:integer;
ii:integer;
g2068z:integer;
g2069z:integer;
tokPos:integer;
g2071z:integer;
tokRem:integer;
g2073z, g2074z, g2075z:integer;
pg32ptr:@page; 
g2077z:@page;
g2078z,g2079z, g2080z:integer;
g2081z:boolean;
range:boolean;
g2083z:integer;
g2084z:integer;
g2085z:integer;
g2086z:integer;
g2087z:integer;
g2088z:integer;
curVal:integer;
d:data;
s:setting;
g2168z, g2169z:integer;
g2170z, g2171z, g2172z, g2173z, g2174z, g2175z, g2176z, g2177z, g2178z, g2179z,
g2180z, g2181z, g2182z, g2183z, g2184z, g2185z, g2186z, g2187v:integer;
g2187z:_array [1..8] _of integer;
g2196z:integer;
g2197v:boolean;
g2197z: _array [1..8] _of boolean;
g2205z: _array [1..8] _of boolean;
g2214z, g2215z: integer;
g2216z:_array [0..0] _of bitset;
g2217z, g2218z: integer;
g2219z:integer;
g2220z, g2221z, g2222z, g2223z, g2224z, g2225z, g2226z, g2227z, g2228z:integer;
g2229z, g2230z, g2231z, g2232z, g2233z, g2234z, g2235z, g2236z, g2237z, g2238z,
g2239z, g2240z, g2241z, g2242z, g2243z, g2244z, g2245z, g2246z, g2247z, g2248z,
g2249z, g2250z, g2251z, g2252z, g2253z, g2254z, g2255z, g2256z, g2257z, g2258z,
g2259z, g2260z, g2261z, g2262z, g2263z, g2264z, g2265z, g2266z, g2267z, g2268z,
g2269z, g2270z, g2271z, g2272z, g2273z, g2274z, g2275z, g2276z, g2277z, g2278z,
g2279z, g2280z, g2281z: integer;
g2281a:_array[1..32] _of char;
famStr:_array[1..24] _of char;
givStr:_array[1..16] _of char;
patStr:_array[1..16] _of char;
g2370v:integer;
g2370z:_array [1..2] _of integer;
g2373z:integer; (* <- 2373 *)
g2374z:_array[1..3] _of integer; (* <- 2374 *)
g2377z:_array[1..3] _of integer; (* <- 2377 *)
g2380z:_array[0..3] _of integer; (* <- 2380 *)
last:integer;
g2385z:_record cmd: _array[0..30] _of alfa _end;
token:_array [1..20] _of char;
INP:text; (* <- 2436 *)

_proced skipsp;
 _(
 _while INP@ = sp _do get(INP);
 _);

_proced tkNext;
_(
  _while INP@ _in letter _do get(INP);
  skipsp;
_);

_proced L0730;
 _(
 _while  (token[tokPos] = ' ') _and  (tokRem > 0) _do _(
 tokPos := (tokPos + 1);
 tokRem := (tokRem - 1);
 _);
 _);

 _proced L0742;
 _(
 tokPos := 1;
 tokRem := g2071z;
 _);

_proced L0746;
_(
  _while (token[tokPos] _in letter) & (tokRem > 0) _do _(
   tokPos := tokPos + 1;
   tokRem := tokRem - 1;
 _);
 L0730;
_);

_proced L0761;
 _(
 g2066z := 0;
 _while ((INP@ _in letter) _or (INP@ = ' ')) &  (g2066z < 20) _do  _(
 g2066z := (g2066z + 1);
 token[g2066z] := INP@;
 get(INP);
 _);
 g2071z := g2066z;
 tokRem := ;
 tokPos := 1;
 _);

_proced memset(l2a1z, l2a2z, l2a3z:integer);
_var l2v1z:@page;
_(
  l2v1z := ptr(l2a1z);
  _for g2066z := 0 _to (l2a2z - 1) _do l2v1z@[g2066z].i := l2a3z;
_);

_proced L1024;
_(
  g2068z := ord(ref(s.s1));
  memset( g2068z, ord(ref(g2280z)) - g2068z + 1, 0);
  g2281z := 102;
_);

_function itoa(l2a1z:integer):alfa;
_var l2v1z, l2v2z, l2v3z:integer; l2v4z:sixchars; l2v10z:alfa;
_( (*=m+*)
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
 _( (*=m-*)
 l2a2z := (((l2a1z * 4096) + l2a2z) + (10320000000000C));
   code(2Э0704=,)
 _);

_proced wrpg32(l2a1z, l2a2z:integer);
 _(
 l2a2z := (((l2a1z * 4096) + l2a2z) + (320000000000C));
   code(2Э0704=,)
 _);

_proced enq66; _var l2v1z: integer;
_(
 l2v1z := 66B;
 code(СД/-14/=Э050105,Э050115=,)
 _);

_proced deq66; _var l2v1z: integer;
_(
  l2v1z := 66B;
 code(СД/-14/=Э050105,Э050116=,)
 _);

_proced rdPage(_var dst:page; vol, zone:integer;  copy:boolean);
_var i:integer;
l2v2z, l2v3z:alfa;
l2v4z:alfa;
_(
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
     writeln(zone: 4, ' РАБОТАТЬ НЕЛЬЗЯ КО=', i:3);
     _GOTO 7315
   _)
 _);
 rdpg32( 52B, zone );
 _if pg32ptr@[0].a <> kadry _then _(
  writeln('ЧП!! БАНК ИСПОРЧЕН', zone:5);
  L1024;
   _GOTO 7315
 _);
 _if copy _then _for i := 0 _to 1023 _do 
     code(2ИК7=ИА64000,СЧ=17ЗЧ,2СЧ7=2АС3,17ЗЧ=17ИК,ИА=15ПА,17СЧ=15ЗЧ,)
_);

_proced rdDB;
 _(
   _if (listA[1].a <> catalog) _then
     rdPage( listA, dbVol, 112, true );
   g2073z :=   sel( listA[3].i, 0, 7);
 _);

 _proced rdZKD;
 _(
   _if (listB[1].a <> '!ЗОНКД') _then 
    rdPage( listB, dbVol, 190, true );
 _);

 _proced rdZPCH;
 _(
   _if (listB[1].a <> '!ЗОНПЧ') _then
     rdPage( listB, dbVol, 191, true );
 _);

_procedure TTIN(level:integer);
_label 1;
_var v1, v2: integer;l2v3z, l2v4z:integer;
l2v5z, l2v6z:boolean; 
_(
  _if level = 1 _then BIND(' ==K {172') _else BIND(' =-K {172');
  _if d.prnEnable  _then _(
    code(СЧ76013=УИ7,);
    v1 := 2; code(ЗЧ76013=,);
    _if level = 1 _then write(' ==K ') _else write(' =-K ')
  _);
  rewrite(INP);
  v2 := 0;
  l2v3z := ;
 l2v4z := ;
 l2v5z := ;
 l2v6z := true;
 _if _not (input@ <> ' ') _then  get(input);
 _if (input@ = '=') _then 
 _for g2066z :=1_to 4 _do _if _not (input@ = etx) _then  get(input);
 
 _while _not (input@ = etx) _do _(
  _if d.prnEnable _then  write(input@);
 _if (input@ _IN [10,18,19,21,28]) _or  (input@ = '>') _or
 ( (input@ = '<') _or  (input@ = '&')) _then  l2v6z := false;
 _if  input@ _in letter _then _(
   l2v3z := (l2v3z + 1);
 _if _not l2v5z  _then  _(
 l2v4z := (l2v4z + 1);
 l2v5z := true;
 _)  _) _else  l2v5z := false;
 v2 := (v2 + 1);
 _if (v2 > 128) _then _(
 rewrite(INP);
 write(INP,'SLЕ  {377');
  d.flags := d.flags + [47];
  _goto 1;
  _);
 INP@ := input@;
 put(INP);
 get(input);
  (* while L1320 *) _);
 INP@ := input@;
 put(INP);
1: reset(INP);
  _if d.prnEnable  _then  _(
     writeLN;
    code(ВИ7=ЗЧ76013,);
 _);
 _if _not ( _not l2v6z  _or  (l2v4z <= 2)) _then  _(
 _if (trunc(((l2v3z) / (l2v4z))) > 3) _then _(
  d.flags := (d.flags + [2,3]);
 _GOTO 7432;
 _);
_);

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
  _GOTO 7532;
  _);
_);

_proced U1434;
_var r:alfa;
_(
  writeLN;
  timeout;
  code(СЧ77015=);
  r := ;
  _if r = 'Н{3770000' _then _( L1024;  _GOTO 7315 _);
_);

_proced L1446;
 _(
 g2370v := 0;
 g2380z[3] := 0;
 memset( ord(ref(g2374z)), 3, 0 );
 _);

_proced L1456;
 _(
 _if (INP@ <> etx) _then_(
   writeln('КОНТЕКСТ:');
   _for g2066z := 1 _to 24 _do
     _if (INP@ <> etx) _then _(  write(INP@); get(INP) _);
 U1434;
    _);
   L1024;
 _GOTO 7315;
_);

_proced error;
 _(
 ГГ( cmd2 );
 writeln('=<ОШИБКА>');
 L1456;
 _);

_proced L1515;
 _(
 _if  (g2088z _IN [3,4]) _then _(
 writeln('ОШИБКА В ЗНАКЕ,МОЖНО =,# НЕЛЬЗЯ >,<');
 L1456;
 _);
_);

_proced cmpswap(_var l2a1z, l2a2z:integer);
 _(
 _if _not (l2a2z >= l2a1z) _then  _(
 g2068z := l2a2z;
 l2a2z := l2a1z;
 l2a1z := g2068z;
 _);
_);

_function U1543:integer;
_(
 _if _not (g2370v >= 1) _then  _(
 writeln('ОШИБКА:ОБРАЩЕНИЕ К ПУСТОМУ СТЕКУ');
 L1456;
 _);
 U1543 := g2370z[g2370v];
 g2370v := (g2370v - 1);
 _);

_function U1557(l2a2z:alfa; l2a3z:integer; l2a4z:boolean):integer;
_var l2v1z:integer;
_(
 U1557 := 0;
 _for l2v1z :=0_to l2a3z _do _(
  _if _not (g2385z.cmd[l2v1z] <> l2a2z) _then  _(
 U1557 := l2v1z;
 EXIT;
 _);
  (* for 1566 *) _);
 _if l2a4z _then  error;
_);


_function getAlfa(_var a:alfa; len:integer):boolean;
_var u:sixchars; i:integer;
_(
 skipsp;
 i := 0;
 a := '000000';
 unpck( u[1], a);
 _while (INP@ _in letter) & (i < len) _do _(
    u[7 - len + i] := INP@;
    get(INP);
    i := i + 1;
 _);
  tkNext;
 pck(u[1], a);
 getAlfa := i > 0;
 _);

(*=m+*)
_function getDec:integer;
_var l2v1z:char; l2v2z:integer;
 _(
 l2v2z := 0;
 skipsp;
 _while INP@ _in digit _do _(
   l2v1z := INP@;
   _if _not (l2v1z < chr(10)) _then  _(
   writeln('ОШИБКА В ЧИСЛЕ');
   L1456;
   _);
   l2v2z := (l2v2z * 10) + ord(l2v1z);
 get(INP);
_);
 skipsp;
 getDec := l2v2z;
_);

_function getOct:integer;
_var l2v1z:char; l2v2z:integer;
 _(
 l2v2z := 0;
 skipsp;
 _while INP@ _in digit _do _(
   l2v1z := INP@;
   _if _not (l2v1z < chr(8)) _then  _(
   writeln('ОШИБКА В ЧИСЛЕ');
   L1456;
   _);
   l2v2z := (l2v2z * 8) + ord(l2v1z);
 get(INP);
_);
 skipsp;
 getDec := l2v2z;
_);

_proced U1722(l2a1z, l2a2z:integer);
_var l2v1z:integer;
_(
 l2v1z := 000035T;
 code(2ЦС3=ЗЧ75203,ЗЧ75223=2СЧ4,У076002=ЦС13,ЗЧ75204=,);
 rewrite(output);
 _);

_proced L1736;
 _(
 write('{172{175      ');
 code(СЧ75235=ЦС13,СР75204=У074275,Э07075223=,);
 U1722( (270000C), 1 );
 rewrite(output);
_);

_proced U1750;
_var l2v1z, l2v2z:integer;
_(
 l2v1z := 29696;
  code(ЗЧ75205=ЗЧ75224,);
 l2v1z :=   getOct;
 l2v2z :=   getOct;
 _if ( (l2v1z = 0) _or  (l2v2z = 0)) _or ((l2v1z + l2v2z) > 37B) _then _(
 writeln('ОШИБКА В ЗОНАХ !!!!!');
 EXIT;
  _);
  _if (11 _IN d.flags) _then  L1736;
 l2v1z := ((650730C) + l2v1z);
 U1722( l2v1z, l2v2z );
 write('ЬЬМLШ');
  d.flags := (d.flags + [11]);
 _);

_function getYear:integer;
_(
 g2068z :=   getDec;
 _if g2068z > 100 _then  g2068z := (g2068z _MOD 100);
 getYear := g2068z;
 _);

_function L2020(l2a1z:integer):alfa;
_var l2v1z:integer;  l2v2z:alfa; l2v3z: sixchars;
_(
 l2v2z := '0';
 unpck(l2v3z[1], l2v2z);
 (a) _for l2v1z :=1_to l2a1z _do _(
  _if _not (tokRem > 0) _then  _exit a;
 l2v3z[((6 - l2a1z) + l2v1z)] := token[tokPos];
 tokPos := (tokPos + 1);
 tokRem := (tokRem - 1);
  (* for 2026 *) _);
 pck(l2v3z[1], l2v2z);
 L2020 := l2v2z;
 L0746;
 _);

_function getDate:integer;
_var l2v1z, l2v2z:integer;
_proced L2050;
 _(
   (a) _( skipsp;  _if (INP@ = '.') _then _( get(INP); _goto a _) _);
  _if _not (INP@ _in digit) _then _(
    writeln('ОШИБКА В ДАТЕ');
    L1456
   _)
 _);

_(
 L2050;
 l2v1z := getDec;
 L2050;
 l2v1z := getDec * 100 + l2v1z;
 L2050;
 l2v2z :=   getYear;
 l2v1z := l2v2z * 10000 + l2v1z;
 getDate := l2v1z;
_);

_function findToken(off:integer):integer;
_var len, cnt, k, i, l2v5z:integer;
a1, a2:alfa;
u:_array [1..12] _of char;
_(
 rdZKD;
  a1 := listB[off].a;
 len := ;
  a1 := listB[off + 1].a;
 cnt := ;
  g2086z := (cnt - 1);
 g2087z := 1;
 a1 := stars;
 unpck(u[1],  a1);
 unpck(u[7],  a1);
_if _not ( (off = 232) _or  (off = 942)) _then  L0761;
 k := 0;
 _repeat 
  i := 0;
  _while (token[tokPos] _in letter ) & (tokRem > 0) & (i < len) _do _(
   i := i + 1;
   k := k + 1;
   _if k > 12 _then  error;
    u[k] := token[tokPos];
   tokPos := tokPos + 1;
   tokRem := tokRem - 1;
  _);
  L0746;
 _until _not (token[tokPos] _in letter) _or (tokRem <= 0);
 pck(u[1], a1);
 pck(u[7], a2);
 k := off + 2;
 _for i := 0 _to cnt - 1 _do _(
   l2v5z := i * 2;
  _if (listB[k + l2v5z].a = a1) & 
  (listB[k + l2v5z + 1].a = a2) _then _(
     findToken := i;
     EXIT;
   _)
 _);
 error;
 _);

_function getMonth:integer;
 _(
 L0761;
 a :=   L2020( 3 );
 range := true;
 getMonth := 0;
   _select
 ('ЗИМ' = a) : _(
 g2083z := 0;
 g2084z := 2;
 _);
 ('ВЕС' = a) : _(
 g2083z := 3;
 g2084z := 5;
 _);
 ('ЛЕТ' = a) : _(
 g2083z := 6;
 g2084z := 8;
 _);
 ('ОСЕ' = a) : _(
 g2083z := 9;
 g2084z := 11;
 _);
   true: _(
 range := false;
 L0742;
 getMonth :=   findToken( 942 );
   _)
   _end
 _);

 _function U2264:integer;
 _(
 U2264 :=   findToken(2);
 _);

 _function U2271:integer;
 _(
 U2271 :=   findToken( 10 );
 _);

_function U2276:integer;
 _(
 U2276 :=   findToken( 214 );
 cmpswap( g2087z, g2086z );
 _);

_function getDegree:integer;
_(
 L0761;
 a :=   L2020( 3 );
 cmd :=   L2020( 3 );
 _if ( (cmd = '0') _or  (cmd = 'НАУ')) _and (tokRem = 0) _then _(
 getDegree := 0;
 _if (a = 'КАН') _then _(
 g2083z := 3;
 g2084z := 5;
 range := true;
 _) _else _if (a = 'ДОК') _then _(
 g2083z := 1;
 g2084z := 2;
 range := true;
 _) _else  _if (a <> 'НЕТ') _then  error;
_) _else _(
 L0742;
 getDegree :=   findToken( 232 );
_)
_);

_function getTitle:integer;
 _(
 getTitle :=   findToken( 264 );
 _);

 _function U2360:integer;
 _(
 U2360 :=   findToken( 296 );
 _);

 _function U2365:integer;
_var l2v1z, l2v2z:integer;
_(
 g2081z := false;
 l2v1z :=   findToken( 308 );
 l2v2z :=   getDec;
 _if _not (l2v2z <= 127) _then  error;
 l2v1z := ((l2v1z * 16384) + (l2v2z * 128));
 g2085z := -1;
 _if (INP@ = '-') _then _(
 get(INP);
 _if INP@ _in digit _then _(
 l2v2z :=   getDec;
 g2085z := ;
 _if _not (l2v2z <= 177) _then  error;
 l2v1z := (l2v1z + l2v2z);
  _) _else
 g2081z := true;
  _);
 U2365 := l2v1z;
 _);

 _function U2427:integer;
 _(
 U2427 :=   findToken( 510 );
 _);

 _function U2434:integer;
 _(
 U2434 :=   findToken( 800 );
 _);

 _function U2441:integer;
 _(
 U2441 :=   findToken( 832 );
 cmpswap( g2087z, g2086z );
 _);

 _function U2453:integer;
 _(
 U2453 :=   findToken( 914 );
 _);

 _function U2460:integer;
 _(
 U2460 :=   findToken( 924 );
 _);

_function U2465:integer;
 _(
 U2465 :=   findToken( 934 );
 _);

_proced stats(l2a1z:integer; l2a2z:integer); (*=m-*)
_var l2v1z, l2v2z, l2v3z, l2v4z:integer;
_(
 _if _not debug _then _(
 l2v3z := (l2a1z - 1) * 6;
 l2v4z := d.statArr[l2a2z].i;
 l2v1z := sel(l2v4z, l2v3z, 6) + g2080z;
  code(СД/6/=); l2v2z := ;
  code(МР=СД/-6/,МР=);  l2v1z := ;
 ins(l2v4z, l2v1z, l2v3z, 6);
 d.statArr[l2a2z].i := l2v4z;
 _if l2v2z > 0 _then _(
    g2080z := l2v2z;
    stats(l2a1z, l2a2z-1);
    g2080z := 1;
  _);
   _if (l2a2z <= 21) & (l2a2z > 0) _then  stats(l2a1z, 0);
  _)
_);

_function today: alfa;
_var k:integer;l:alfa;
_(
  k:=00003777776Т;l:='3 1   ';
  СОDЕ(Э050114=,2СБ4=2РБ5,СД120=2ЗЧ4,МР=СД70,2ЗЧ5=МР,2СМ5=СД140,17ЛС=2СМ4,СД60=17ЛС,);
  today := ;
_);

_function U2553:alfa;
_var l2v1z, l2v2z:integer; l2v3z:sixchars; l2v9z:alfa;
_(
 code(Э05310=,);
 l2v1z := ;
 l2v1z := trunc(((l2v1z) / (3000)));
 l2v3z[1] := ' ';
 l2v3z[4] := '.';
 l2v2z := trunc(((l2v1z) / (600)));
 l2v3z[2] := ;
 l2v1z := (l2v1z - (l2v2z * 600));
 l2v2z := (l2v1z _DIV 60);
 l2v3z[3] := ;
 l2v1z := (l2v1z - (l2v2z * 60));
 l2v2z := (l2v1z _DIV 10);
 l2v3z[5] := ;
 l2v3z[6] := chr(l2v1z - (l2v2z * 10));
 pck(l2v3z[1], l2v9z);
 U2553 := l2v9z;
 _);

_function L2613(l2a1z:alfa):integer;
 _(
   g2385z := [ '777','ВОЗ','КПС','ВЛК','СТА','ЗАЧ','ЗАР', 'ДЕТ', 'ТЕЛ'];
 L2613 :=   U1557( l2a1z, 8, true );
 _);

_proced L2633(l2a1z:integer);
_var l2v1z:integer;
_(
 l2v1z := (l2a1z _DIV 10);
 write(l2v1z  :  1);
  write(chr(l2a1z - (l2v1z * 10)));
 _);

 _proced L2645(l2a1z:integer); (*=m+*)
_var l2v1z, l2v2z, l2v3z:integer;
_(
 l2v3z := 1000;
 _for l2v1z :=1_to 4 _do _(
 l2v2z := trunc(((l2a1z) / (l2v3z)));
 l2a1z := (l2a1z - (l2v2z * l2v3z));
 l2v3z := trunc(((l2v3z) / (10)));
 write(l2v2z  :  1);
  (* for 2651 *) _);
 _);

 _proced L2674(l2a1z:integer);(*=m-*)
_var l2v1z, l2v2z:integer;
_(
 _if _not (l2a1z <> 0) _then  _(
 write(sp :  10);
 _) _else _(
 l2v2z := (l2a1z _DIV 10000);
 l2a1z := (l2a1z - (l2v2z * 10000));
 l2v1z := (l2a1z _DIV 100);
 L2633( (l2a1z - (l2v1z * 100)) );
 write(dot);
 L2633( l2v1z );
 write(dot);
 ГГ( '19' );
 L2633( l2v2z );
  _);
 _);

_proced L2725;
 _(
 _for g2066z :=1_to (g2074z - g2075z) _do _(
 write(sp);
  (* for 2730 *) _);
 _);

_proced U2737(off2, off1:integer);(*=m+*)
_var i, j:integer; a:alfa; u:sixchars;
_(
 rdZPCH;
  g2075z := 0;
 a := listB[off1].a;
 g2074z := ;
 _for i := 1 _to 2  _do _(
   a := listB[2 * off2 + off1 + i + 1].a;
   _if (a <> stars) _then _(
     unpck(u[1],  a );
     _for j := 1 _to 6 _do _(
  _if (u[j] <> '*') _then _( write(u[j]); g2075z := g2075z + 1; _)
     _)
   _);
 _);
  _if _not (off1 = 308) _then  L2725;
_);

_proced prMonth(l2a1z:integer);
 _(
 _if l2a1z = 0 _then  l2a1z := 12;
 U2737( l2a1z, 942 );
 _);

 _proced L3014(l2a1z:integer);
 _(
 U2737( l2a1z,2);
 _);

 _proced U3021(l2a1z, l2a2z:integer);
 _(
 _if _not (l2a2z <> 1) _then  l2a2z := 10 _else l2a2z := 112;
 U2737( l2a1z, l2a2z );
 _);

 _proced L3035(l2a1z:integer);
 _(
 U2737( l2a1z, 934 );
 _);

 _proced L3042(l2a1z:integer);
 _(
 U2737( l2a1z, 214 );
 _);

 _proced L3047(l2a1z:integer);
 _(
 U2737( l2a1z, 232 );
 _);

 _proced L3054(l2a1z:integer);
 _(
 U2737( l2a1z, 264 );
 _);

 _proced L3061(l2a1z:integer);
 _(
 U2737( l2a1z, 296 );
 _);

_proced L3066(l2a1z:integer);
_var l2v1z, l2v2z, l2v3z:integer;
_(
 l2v1z := sel(l2a1z, 14, 7);
 l2v2z := sel(l2a1z, 7, 7);
 l2v3z := sel(l2a1z, 0, 7);
 U2737( l2v1z, 308 );
 _if _not (l2v2z = 0) _then  _(
 write(l2v2z:3 );
 g2075z := (g2075z + 3);
 _);
 _if _not (l2v3z = 0) _then  _(
 write(minus, l2v3z:2 );
 g2075z := (g2075z + 3);
 _);
 L2725
 _);

_proced L3116(l2a1z:integer);
 _(
 U2737( l2a1z, 510 );
 _);

 _proced L3123(l2a1z:integer);
 _(
 U2737( l2a1z, 800 );
 _);

 _proced L3130(l2a1z:integer);
 _(
 U2737( l2a1z, 832 );
 _);

 _proced L3135(l2a1z:integer);
 _(
 U2737( l2a1z, 914 );
 _);

 _proced L3142(l2a1z:integer);
 _(
 U2737( l2a1z, 924 );
 _);

 _proced U3147; (*=m-*)
_var l2v1z:integer;
_(
 code(Э0634=,);
 l2v1z := ;
 write('ИЗРАСХОДОВАНО ');
 ii := (l2v1z  _DIV 50);
 L2633( ii );
 write(dot);
 L2633( (l2v1z - (ii * 50)) * 2 );
 ГГ( ' СЕК' );
 writeLN;
 stats( 4, 13 );
 _);

_function L3223(l2a1z:integer):integer;
_var l2v1z, l2v2z, l2v3z, l2v4z, l2v5z, l2v6z:integer;

_proced L3173(l3a1z:integer);(*=m+*)
 _(
 l2v5z := (((l3a1z - 3) * 8) - 1);
 _for l2v3z :=1_to 8 _do _(
 l2v4z := (l2v5z + l2v3z);
   code(УИ7=7СА623,ВИ7=2ЗЧ5,7Э063=,СД/14/=МР,СД/44/=); l2v2z := ;
 _if (l2v2z = l2a1z) _then  _(
  code(3СЧ3=,СД/-3/=СД/-17/,2ЛС5=); l2v1z := ;
 l2v6z := (l2v6z + 1);
 _);
  (* for 3201 *) _);
 _);

_( (* L3223 *)
 l2v6z := 0;
 l2v1z := ;
 _if _not (l2a1z >= 2048) _then  _(
 L3173( 6 );
 L3173( 4 );
 L3173( 5 );
 _) _else _(
 L3173( 7 );
 L3173( 11 );
  _);
 _if _not (l2v6z <= 1) _then  _(
 writeln('РАБОТАТЬ НЕЛЬЗЯ-СТОЯТ ДВА ОДИНАКОВЫХ ДИСКА');
 _GOTO 7345;
 _);
 L3223 := l2v1z;
 _);

_proced modePrint;
_label 1, 2, 3;
_(
  _select
  INP@ = 'Д': 1: _(
    code(СЧ76013=17ЗЧ,СЧ31=); g2068z := ; code(17ЛС=ЗЧ76013,);
    writeln('ВКЛЮЧЕНА ПЕЧАТЬ АЦПУ');
    d.prnEnable := true;
  _if d.d14  _then _(
      code(СЧ=Э06276,);
      d.d14 := false;
    _);
  _);
  INP@  = 'Н': 2: _(
    d.prnEnable := false;
    writeln('ВЫКЛЮЧЕНА ПЕЧАТЬ АЦПУ');
    code(СЧ76013=17ЗЧ,СЧ13=); g2068z := ; code(17ЛУ=ЗЧ76013,);
  _);
  INP@ = etx: 3: _if d.prnEnable _then _goto 2 _else _goto 1;
  INP@ = '&': _goto 3;
  true:_(  writeln('ОШИБКА В ОПЕРАНДЕ ПРИКАЗА "ПЕЧ"'); L1456; _)
  _end;
  g2065z :=   getAlfa( cmd2, 3 );
  stats( 4, 11 );
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
  true: _( writeln('ОШ.В ОПЕРАНДЕ ПРИКАЗА "ЭКР"'); L1456 _)
  _end;
  g2065z :=   getAlfa( cmd2, 3 );
  stats (4, 12);
 _);

_proced L3401;
 _(
 writeln('СДЕЛАНО');
 _);

_proced U3406(_var l2a1z, l2a2z:integer);
 _(
 _if _not (g2088z <> 3) _then  _(
 l2a2z := g2086z;
 _) _else  _if _not (g2088z <> 4) _then  l2a2z := g2087z;
 cmpswap( l2a1z, l2a2z );
 _);

_function L3424(l2a1z:integer):integer;
_var l2v1z, l2v2z, l2v3z, l2v4z, l2v5z, l2v6z:integer;
l2v7z:@integer;
_(
 l2v5z := ((ord(ref(listA)) + 4) - 10);
 l2v1z := 1;
 l2v2z := g2073z;
 _while _not (l2v1z > l2v2z) _do _(
 l2v3z := trunc(((((l2v1z) + l2v2z)) / 2));
  (*=m-*)
 l2v7z := ptr((10 * l2v3z) + l2v5z);
 l2v6z := l2v7z@;
 l2v4z := ;
 _if (l2v4z <> l2a1z) _then _(
 _if _not (l2v4z <= l2a1z) _then  _(
 l2v2z := (l2v3z - 1);
 _) _else  l2v1z := (l2v3z + 1);
  _) _else _(
 L3424 := (l2v3z - 1);
 EXIT;
  _);
  (* while L3433 *) _);
 error;
 _);

_function L3464(l2a1z:integer):integer;
_var l2v1z:@integer;
_(
 l2v1z := ptr((ord(ref(listA)) + (10 * l2a1z)) + 4);
 L3464 := l2v1z@;
 _);

_function L3475(l2a1z:integer):integer;
_var l2v1z, l2v2z, l2v3z:integer; l2v4z:@integer;
_(
 L3475 := l2a1z;
 _if _not (-1 = g2085z) _then  EXIT;
 l2v1z :=   L3424( l2a1z );
 _while _not (l2v1z >= (g2073z - 1)) _do _(
 l2v1z := (l2v1z + 1);
  (*=m+*)
 l2v4z := ptr((ord(ref(listA)) + (10 * l2v1z)) + 4);
 l2v3z := l2v4z@;
 l2v2z := ;
 _if _not ((l2v2z - l2a1z) >= 127) _then  _(
 L3475 := l2v2z;
 _) _else EXIT;
  (* while L3505 *) _);
 _);

_proced U3567(l2a1z, l2a2z:integer);
_label 1, 2;
_var l2v1z, l2v2z, l2v3z, l2v4z:integer;
l2v5z, l2v6z:boolean;
l2v7z:@bitset;
 _proced L3527;
 _(
 _if (l2a2z = 20) _then _(
 l2v1z :=   L3424( l2v1z );
 l2v2z :=   L3424( l2v2z );
 _if _not (l2v1z >= g2281z) _then  g2281z := l2v1z;
 _if _not (l2v2z <= g2280z) _then  g2280z := l2v2z;
   _);
 _for l2v3z := l2v1z _to l2v2z _do _(
 l2v4z := trunc(l2v3z / 48);
 l2v7z := ptr(l2a1z + l2v4z);
 l2v7z@ := [l2v3z _MOD 48] + l2v7z@;
 _);
 _);

_( (* U3567 *)
  l2v5z := false;
 l2v6z := ;
 _if INP@ = '*' _then  _(
 g2196z := 1;
 get(INP);
 _);
 _if INP@ = '(' _then  _(
 get(INP);
 l2v5z := true;
 L1515;
 _);
  1: _if l2v6z _then  L1515;
 g2081z := false;
 _if _not (l2a2z <> 20) _then  _(
 l2v1z :=   U2365;
 l2v2z :=   L3475( l2v1z );
 _) _else _(
 l2v1z :=   U2427;
 l2v2z := ;
 _if (g2088z _IN [3,4]) _then  U3406( l2v1z, l2v2z );
 _);
 l2v6z := true;
  2: _select
  (INP@ = '+') : _(
 L3527;
 _if l2v5z  _then  _( get(INP);  _goto 1; _);
  _);
  (INP@ = ')')  : _(
   L3527;
   _if l2v5z _then   get(INP) _else  error;
  _);
  (INP@ = ',') _or  (INP@ = '&') _or (INP@ = etx) : _(
   _if l2v5z  _then  error;
   L3527;
  _);
  (INP@ = '-') _or  g2081z: _(
  L1515;
 _if _not g2081z  _then  get(INP);
 _if (l2a2z = 20) _then  _(
 l2v2z :=   U2365;
 l2v2z :=   L3475( l2v2z );
 _) _else l2v2z :=   U2427;
 cmpswap( l2v1z, l2v2z );
  _goto 2;
  _);
  true: _(  error  _)
  _end;
_);

_proced U3770(l2a1z, l2a2z, l2a3z:integer);
_var l2v1z, l2v2z, l2v3z, l2v4z, l2v5z:integer;
l2v6z, l2v7z, l2v8z:boolean; l2v9z:@bitset;

_proced L3731;
 _(
 _if l2v6z _then   write(pl);
 _if (l2a3z = 20) _then  L3066(   L3464( l2v4z) ) _else  L3116( l2v4z );
 _if l2v8z  _then _(
    write(minus);
 _if (l2a3z = 20) _then  L3066(   L3464( l2v5z) ) _else L3116( l2v5z );
 l2v1z := (l2v5z + 1);
   _) _else  l2v1z := (l2v4z + 1);
 l2v6z := true;
 _);

_((* U3770 *)
 l2v6z := false;
 l2v1z := 0;
 l2v2z := ((48 * l2a2z) + 47);
 (a) _(
 l2v7z := false;
 l2v8z := ;
 _for l2v3z := l2v1z _to l2v2z _do _(
 l2v9z := ptr(trunc(((l2v3z) / 48)) + l2a1z);
 _select
  ((l2v3z _MOD 48) _IN l2v9z@): _(
 _if l2v7z _then  _(
 l2v5z := l2v3z;
 l2v8z := true;
 _) _else _(
 l2v4z := l2v3z;
 l2v7z := true;
  _);
 _if _not (l2v3z <> l2v2z) _then  L3731;
  _);
  (l2v3z = l2v2z): _(
   _if l2v7z  _then  L3731;
    EXIT;
  _);
  l2v7z:  _( L3731;  _goto a; _);
  true: _( _)
  _end
  (* for 4005 *) _);
 _)
_);

_proced getValue(_var l2a1z, l2a2z:integer; _function l2a3z:integer);
 _(
 range := false;
 l2a1z := l2a3z; (* call code for the formal parameter function differs *)
 l2a2z := ;
 _if range _then  _(
 L1515;
 l2a1z := g2083z;
 l2a2z := g2084z;
 _) _else  _if (g2088z _IN [3,4]) _then _(
   U3406( l2a1z, l2a2z );
 _) _else _(
 _if (INP@ = '-') _then  _(
   get(INP);
   l2a2z := l2a3z; (* a difference here as well *)
   cmpswap( l2a1z, l2a2z );
 _);
   _);
 _);

_proced L5315(l2a1z:boolean);
_label 5330, 6240;
_var l2v1z:boolean;
l2v2z, l2v3z:alfa; l2v4z:integer;
 _proced U4110;
_var l3v1z:char;
_(
 tkNext;
 l2v3z := '0';
 _if (INP@ = '.') _then _(
 get(INP);
 g2065z :=   getAlfa( l2v3z, 3 );
 _);
 l3v1z := INP@;
  _select
(l3v1z = '=') : g2088z := 1;
 (l3v1z = chr(28)) : g2088z := 2;
 (l3v1z = '<') : g2088z := 3;
 (l3v1z = '>') : g2088z := 4;
  true: _( writeln('ОШ.ЗНАКА,МОЖНО =,#,<,>'); L1456; _)
  _end;
 _if (g2088z = 2) _then  curVal :=2_else curVal := 1;
  get(INP);
 skipsp;
_);

_function U4204(_var l3a1z, l3a2z:integer):boolean;
_label 1;
_var l3v1z:integer;
 _function U4162:integer;
_var l4v2z:integer;
_(
 _if _not (l3v1z <> 5) _then  l4v2z :=   getDate
 _else _if (l3v1z _IN [2,3]) _then l4v2z :=   getYear
 _else  l4v2z :=   getDec;
 U4162 := l4v2z;
 _);

_( (* U4204 *)
  U4204 := false;
 l3v1z :=   L2613( cmd2 );
 _if (l3v1z _IN [2,3]) _then  g2087z := 99;
 _if (getAlfa( l2v2z, 3)) _then _(
  _select 
  ('НЕТ' = l2v2z):  _(
 l3a1z := 0;
 l3a2z := ;
  _);
  ('ЗАП' = l2v2z) :  _(
 l3a1z :=   U1543;
 l3a2z := ;
 _);
  ('МАК' = l2v2z): _(
 g2197z[l3v1z] := true;
1:
 L1515;
 g2197v := true;
 U4204 := ;
 g2187z[l3v1z] := curVal;
 EXIT;
  _);
  ('МИН' = l2v2z): _(
 g2205z[l3v1z] := true;
  _goto 1;
 _);
  true:  error
  _end
  _) _else _(
 l3a1z :=   U4162;
 l3a2z := ;
  _);
 _if (g2088z _IN [3,4]) _then  _(
 U3406( l3a1z, l3a2z );
 _) _else  _if (INP@ = '-') _then _(
 get(INP);
 _if (getAlfa( l2v2z, 3)) _then _(
 _if _not (l2v2z <> 'ЗАП') _then  _(
 l3a2z :=   U1543;
 _) _else  error;
  _) _else  l3a2z :=   U4162;
 cmpswap( l3a1z, l3a2z );
  _);
_);

 _proced L4325(l3a1z:integer);
_var l3v1z:integer; l3v2z:char;
_(
 L1515;
 l3v1z := 0;
  _while (INP@ _in letter) _or ( (INP@ = ' ') _or  (INP@ = '.')) _do  _(
  _if ( (INP@ = ' ') _or  (INP@ = '.')) _then 
 _if _not (l3a1z = 1) _then  _( get(INP); skipsp; EXIT; _);  
 l3v2z := INP@;
 get(INP);
 l3v1z := (l3v1z + 1);
  _select
  ( (l3a1z = 0) _or  (l3a1z = 1)) :  _(
 s.s14 := curVal;
 famStr[l3v1z] := l3v2z;
 g2276z := (g2276z + 1);
  _);
  (l3a1z = 2) : _(
  s.s15 := curVal;
 givStr[l3v1z] := l3v2z;
 g2277z := (g2277z + 1);
 _);
  (l3a1z = 3) :  _(
  s.s16 := curVal;
 patStr[l3v1z] := l3v2z;
 g2278z := (g2278z + 1);
 _)
  _end;
  _)
 _);
_proced U4506;
_var l3v1z:integer; l3v2z:alfa;

_proced prCond(l4a1z:alfa; l4a2z:integer);
 _(
 ГГ( l4a1z );
 _if _not (l4a2z <> 1) _then  write(' = ') _else  write(' # ');
 _);

 _proced U4424(l4a1z, l4a2z:integer);
_var l4v1z:integer; l4v2z:char;
_(
 _for l4v1z :=1_to l4a2z _do _(
 _case l4a1z _of                             
  1: l4v2z := famStr[l4v1z];
  2: l4v2z := givStr[l4v1z];
  3: l4v2z := patStr[l4v1z]
  _end;
 write(l4v2z);
  (* for 4432 *) _);
 writeLN;
 _);

 _proced L4455(l4a1z:integer);
_var l4v1z:integer; l4v2z:char;
_(
 _for l4v1z :=1_to l4a1z _do _(
 l4v2z := g2281a[l4v1z];
 write(l4v2z);
  (* for 4460 *) _);
 writeLN;
 _);
 _proced U4471(l4a1z, l4a2z:integer);
 _(
 L2645( l4a1z );
 write(minus);
 L2645( l4a2z );
 writeLN;
 _);

_( (* U4506 *)
  _if g2174z <> 0 _then  _(
 prCond( 'ПОД', g2174z );
 U3770( ord(ref(g2214z)), 2, 20 );
 writeLN;
 _);
  _if s.s10 <> 0 _then  _(
  prCond( 'ДОЛ', s.s10 );
 U3770( ord(ref(g2217z)), 1, 22 );
 writeLN;
 _);
  _if s.s14 <> 0 _then  _(
  prCond( 'ФАМ', s.s14 );
 U4424( 1, g2276z );
 _);
  _if s.s15 <> 0 _then  _(
  prCond( 'ИМЯ', s.s15 );
 U4424( 2, g2277z );
 _);
  _if s.s16 <> 0 _then  _(
  prCond( 'ОТЧ', s.s16 );
 U4424( 3, g2278z );
 _);
 _if g2177z <> 0 _then  _(
 prCond( 'АДР', g2177z );
 L4455( g2279z );
 _);
  _if s.s17 <> 0 _then  _(
  prCond( 'ПОЛ', s.s17 );
 L3014( g2251z );
 writeLN;
 _);
 _if s.s4 <> 0 _then  _(
 prCond( 'ВОЗ', s.s4 );
 U4471( g2219z, g2220z );
 _);
  _if s.s5 <> 0 _then  _(
  prCond( 'КПС', s.s5 );
 U4471( g2221z, g2222z );
 _);
  _if s.s6 <> 0 _then  _(
  prCond( 'ВЛК', s.s6 );
 U4471( g2223z, g2224z );
 _);
  _if s.s8 <> 0 _then  _(
  prCond( 'ЗАЧ', s.s8 );
 L2674( g2227z );
 write(minus);
 L2674( g2228z );
 writeLN;
 _);
  _if s.s9 <> 0 _then  _(
  prCond( 'ЗАР', s.s9 );
 U4471( g2229z, g2230z );
 _);
  _if s.s7 <> 0 _then  _(
  prCond( 'СТА', s.s7 );
 U4471( g2225z, g2226z );
 _);
 _if g2169z <> 0 _then  _(
 prCond( 'ДЕТ', g2169z );
 U4471( g2242z, g2243z );
 _);
 _if g2176z <> 0 _then  _(
 prCond( 'ТЕЛ', g2176z );
 U4471( g2255z, g2256z );
 _);
 _if g2175z <> 0 _then  _(
 prCond( 'ПРО', g2175z );
 L3035( g2254z );
 writeLN;
 _);
_if g2197v _then _for l3v1z :=1_to 8 _do _(
 _if ( g2197z[l3v1z] _or g2205z[l3v1z]) _then _(
  _case l3v1z _of
  1: l3v2z := 'ВОЗ';
  2: l3v2z := 'КПС';
  3: l3v2z := 'ВЛК';
  4: l3v2z := 'СТА';
  5: l3v2z := 'ЗАЧ';
  6: l3v2z := 'ЗАР';
  7: l3v2z := 'ДЕТ';
  8: l3v2z := 'ТЕЛ'
  _end;
 prCond( l3v2z, g2187z[l3v1z] );
 _if (g2197z[l3v1z]) _then  writeln('МАК') _else  writeln('МИН');
  (* for 4667 *) _);
  _);

  _if (s.s13 <> 0) _then _(
 prCond( 'НАЦ', s.s13 );
 _if (s.s17 <> 0) _then _(
 _if _not (s.s17 <> 1) _then  _(
 l3v1z := g2251z;
 _) _else _if _not (g2251z <> 2) _then  _(
 l3v1z := 1;
 _) _else l3v1z := 2;
  _) _else  l3v1z := 1;
 U3021( g2250z, l3v1z );
 writeLN;
  _);
 _if s.s18 <> 0 _then  _(
 prCond( 'СТЕ', s.s18 );
 L3047( g2233z );
 write(minus);
 L3047( g2234z );
 writeLN;
 _);
 _if s.s19 <> 0 _then  _(
 prCond( 'ЗВА', s.s19 );
 L3054( g2235z );
 write(minus);
 L3054( g2236z );
 writeLN;
 _);
 _if s.s20 <> 0 _then  _(
 prCond( 'ОБР', s.s20 );
 L3042( g2237z );
 write(minus);
 L3042( g2238z );
 writeLN;
 _);
 _if s.s21 <> 0 _then  _(
 prCond( 'СПЕ', s.s21 );
 U4471( g2239z, g2240z );
 _);
 _if g2170z <> 0 _then  _(
 prCond( 'ВОИ', g2170z );
 L3130( g2246z );
 write(minus);
 L3130( g2247z );
 writeLN;
 _);
 _if g2168z <> 0 _then  _(
 prCond( 'СЕМ', g2168z );
 L3061( g2241z );
 writeLN;
 _);
_if s.s11 <> 0 _then  _(
 prCond( 'РОЖ', s.s11 );
 L2674( g2231z );
 write(minus);
 L2674( g2232z );
 writeLN;
 _);
 _if s.s12 <> 0 _then  _(
 prCond( 'ПОВ', s.s12 );
 L2674( g2244z );
 write(minus);
 L2674( g2245z );
 writeLN;
 _);
 _if g2171z <> 0 _then  _(
 prCond( 'СОС', g2171z );
 L3123( g2248z );
 write(minus);
 L3123( g2249z );
 writeLN;
 _);
 _if g2172z <> 0 _then  _(
 prCond( 'СТР', g2172z );
 L3135( g2252z );
 writeLN;
 _);
 _if g2173z <> 0 _then  _(
 prCond( 'БРО', g2173z );
 L3142( g2253z );
 writeLN;
 _);
 _if g2178z <> 0 _then  _(
 ГГ( 'РОЖ.' );
 prCond( 'ДЕН', g2178z );
 U4471( g2257z, g2258z );
 _);
 _if g2179z <> 0 _then  _(
 ГГ( 'РОЖ.' );
 prCond( 'МЕС', g2179z );
 prMonth( g2259z );
 write(minus);
 prMonth( g2260z );
 writeLN;
 _);
 _if g2180z <> 0 _then  _(
 ГГ( 'РОЖ.' ); prCond( 'ГОД', g2180z ); U4471( g2261z, g2262z );
 _);
 _if g2181z <> 0 _then  _(
 ГГ( 'ЗАЧ.' ); prCond( 'ДЕН', g2181z ); U4471( g2263z, g2264z );
 _);
_if g2182z <> 0 _then  _(
 ГГ( 'ЗАЧ.' );
 prCond( 'МЕС', g2182z );
 prMonth( g2265z );
 write(minus);
 prMonth( g2266z );
 writeLN;
 _);
 _if g2183z <> 0 _then  _(
 ГГ( 'ЗАЧ.' ); prCond( 'ГОД', g2183z ); U4471( g2267z, g2268z );
 _);
 _if g2184z <> 0 _then  _(
 ГГ( 'ПОВ.' ); prCond( 'ДЕН', g2184z ); U4471( g2269z, g2270z );
 _);
 _if g2185z <> 0 _then  _(
 ГГ( 'ПОВ.' );
 prCond( 'МЕС', g2185z );
 prMonth( g2271z );
 write(minus);
 prMonth( g2272z );
 writeLN;
 _);
 _if g2186z <> 0 _then  _(
 ГГ( 'ПОВ.' ); prCond( 'ГОД', g2186z ); U4471( g2273z, g2274z );
 _);
  _if (s.s2 <> '0') _then _(
 write('УПО=');
  _if s.s3 _then  write(star);
  ГГ( s.s2 );
 writeLN;
  _);
_);

_proced getText;
_var l3v1z:integer; l3v2z:alfa;
_(
 L1515;
 l3v1z := 0;
 _while (INP@ <> ',') _and  (INP@ <> etx) _and (INP@ <> '&') _do _(
 l3v2z := INP@;
 get(INP);
 l3v1z := (l3v1z + 1);
 g2177z := curVal;
 g2281a[l3v1z] := l3v2z;
 g2279z := (g2279z + 1);
 _);
_);

_( (* L5315 *)
   l2v1z := true;
 _if (INP@ = etx) _then _if l2a1z _then _goto 6240 _else EXIT;
 _if (INP@ = '&') _then  EXIT;
  5330:
 g2086z := 0;
  g2087z := 9999999;
 _if (getAlfa( cmd2, 3)) _then _(
  g2385z := [
  '777',  'ФАМ',  'ИМЯ',  'ОТЧ',  'ПОЛ',
  'РОЖ',  'ВОЗ',  'НАЦ',  'КПС',  'ВЛК',
  'ОБР',  'СТЕ',  'ЗВА',  'СПЕ',  'СЕМ',
  'ДЕТ',  'ЗАЧ',  'ПОД',  'СТА',  'ДОЛ',
  'ПОВ',  'ЗАР',  'СОС',  'ВОИ',  'СТР',
  'БРО',  'УПО',  'ПРО',  'ТЕЛ',  'АДР'];
 l2v4z :=   U1557( cmd2, 29, false );
 _if _not ( (l2v4z >= 27) _or  (l2v4z = 0)) _then  _(
 stats( 7, l2v4z );
 stats( 7, 28 );
 _);
_if _not ( (cmd2 = 'ПОК') _or  (cmd2 = 'СБР')) _then  U4110;
  _select
  ('ПОД' = cmd2) :_(
 rdDB;
 L1515;
 U3567( ord(ref(g2214z)), 20 );
 g2174z := curVal;
  _);
 ('ДОЛ' = cmd2) : _(
 U3567( ord(ref(g2217z)), 22 );
 s.s10 := curVal;
 _);
  ('ФИО' = cmd2) _or  ('ФИН' = cmd2) : _(
 g2276z := 0;
 g2277z := ;
 g2278z := ;
 L4325(0);
 L4325(2);
 L4325(3);
  _);
  ('ФАМ' = cmd2) : _( g2276z := 0; L4325(1); _);
  ('ИМЯ' = cmd2) : _( g2277z := 0; L4325(2); _);
  ('ОТЧ' = cmd2) : _( g2278z := 0; L4325(3); _);
  ('АДР' = cmd2) : _( g2279z := 0; getText; _);
  ('ВОЗ' = cmd2) : _if _not (U4204( g2219z, g2220z)) _then  s.s4 := curVal;
  ('КПС' = cmd2) : _if _not (U4204( g2221z, g2222z)) _then  s.s5 := curVal;
  ('ВЛК' = cmd2) : _if _not (U4204( g2223z, g2224z)) _then  s.s6 := curVal;
  ('ЗАЧ' = cmd2) :  _select
  (l2v3z = '0') : _if _not (U4204( g2227z, g2228z)) _then s.s8 := curVal;
  ('ДЕН' = l2v3z) : _( getValue( g2263z, g2264z, getDec ); g2181z := curVal;  _);
  ('МЕС' = l2v3z) : _( getValue( g2265z, g2266z, getMonth ); g2182z := curVal;  _);
  ('ГОД' = l2v3z) : _( getValue( g2267z, g2268z, getYear ); g2183z := curVal;  _);
  true:  error
  _end; 
  ('ЗАР' = cmd2) : _if _not (U4204( g2229z, g2230z)) _then  s.s9 := curVal;
  ('СТА' = cmd2) : _if _not (U4204( g2225z, g2226z)) _then  s.s7 := curVal;
  ('ДЕТ' = cmd2) : _if _not (U4204( g2242z, g2243z)) _then  g2169z := curVal;
  ('ТЕЛ' = cmd2) : _if _not (U4204( g2255z, g2256z)) _then  g2176z := curVal;
  ('СПЕ' = cmd2) :  _(  getValue( g2239z, g2240z, getDec );   s.s21 := curVal; _);
  ('РОЖ' = cmd2) :  _select
  (l2v3z = '0') :   _( getValue( g2231z, g2232z, getDate); s.s11 := curVal;  _);
  ('ДЕН' = l2v3z) : _( getValue( g2257z, g2258z, getDec ); g2178z := curVal;  _);
  ('МЕС' = l2v3z) : _( getValue( g2259z, g2260z, getMonth ); g2179z := curVal;  _);
  ('ГОД' = l2v3z) : _( getValue( g2261z, g2262z, getYear ); g2180z := curVal;  _);
  true:  error
  _end; 
  ('ПОВ' = cmd2) :  _select
  (l2v3z = '0') :   _( getValue( g2244z, g2245z, getDate); s.s12 := curVal;  _);
  ('ДЕН' = l2v3z) : _( getValue( g2269z, g2270z, getDec ); g2184z := curVal;  _);
  ('МЕС' = l2v3z) : _( getValue( g2271z, g2272z, getMonth ); g2185z := curVal;  _);
  ('ГОД' = l2v3z) : _( getValue( g2273z, g2274z, getYear ); g2186z := curVal;  _);
  true:  error
  _end; 
  ('СТЕ' = cmd2) : _( getValue( g2233z, g2234z, getDegree ); s.s18 := curVal;  _);
  ('ЗВА' = cmd2) : _( getValue( g2235z, g2236z, getTitle ); s.s19 := curVal;  _);
  ('ОБР' = cmd2) : _( getValue( g2237z, g2238z, U2276 ); s.s20 := curVal;  _);
  ('ВОИ' = cmd2) : _( getValue( g2246z, g2247z, U2441 ); g2170z := curVal;  _);
  ('СОС' = cmd2) : _( getValue( g2248z, g2249z, U2434 ); g2171z := curVal;  _);
  ('ПОЛ' = cmd2) : _( L1515; g2251z :=   U2264; s.s17 := curVal; _);
  ('НАЦ' = cmd2) : _( L1515; g2250z :=   U2271; s.s13 := curVal; _);
  ('СЕМ' = cmd2) : _( L1515; g2241z :=   U2360; g2168z := curVal; _);
  ('СТР' = cmd2) : _( L1515; g2252z :=   U2453; g2172z := curVal; _);
  ('БРО' = cmd2) : _( L1515; g2253z :=   U2460; g2173z := curVal; _);
  ('ПРО' = cmd2) : _( L1515; g2254z :=   U2465; g2175z := curVal; _);
  ('УПО' = cmd2) : _(
   _if _not (g2088z = 1) _then  _( writeln('ОШ.ЗНАКА В "УПО",НУЖНО ='); L1456; _);
   _if _not (INP@ <> '*') _then  _( get(INP); s.s3 := true; _);
   g2065z :=   getAlfa( s.s2, 3 );
  _);
  ('ПОК' = cmd2) : _( 6240:
 l2v1z := false;
  _if _not (s.s1 <> 1) _then U4506 _else  writeln('УСТАНОВОК НЕТ');
  _);
  ('СБР' = cmd2) : _( l2v1z := false; L1024; writeln('УСТАНОВКИ СБРОШЕНЫ'); _);
  true: _(  writeln('НЕТ ПАРАМЕТРА '); ГГ( cmd2 ); L1456; _)
  _end;
  _if _not ( (cmd2 = 'ПОК') _or  (cmd2 = 'СБР')) _then  s.s1 := 1;
  _) _else _( error; L1456 _);
  _select
  (INP@ = ',') : _(
   get(INP);
   _goto 5330;
 _);
  (INP@ = etx)  : _(
 _if l2a1z _and  l2v1z _then  L3401;
  _);
  (INP@ = '&') :;
  true: _(  writeln('ОШ.ЗНАКА ', INP@); L1456 _)
 _end
_);

_proced manpage(l2a1z:integer);
_var start, last, i, l2v4z, l2v5z, l2v6z:integer; l2v7z:sixchars;
_(
 code(2СЧ3=СД/14/,2ЗЧ4=МР,СД/44/=); last := ;
 g2069z := 0;
 last := (last - 2);
 _if (start < 1024) _then _(
   _if  (pg32ptr@[1].a <> 'КАДКАД') _then  rdpg32( 0, info );
 _) _else _(
   start := (start - 1024);
   last := (last - 1024);
    _if (pg32ptr@[1].a <> 'ДАКДАК') _then  rdpg32( 0, info+1 );
 _);
 _for i := start _to last _do _(
  unpck(l2v7z[1],  pg32ptr@[i].a );
   _for l2v4z :=1_to 6 _do _(
     l2v5z := (ord(l2v7z[l2v4z]) - 128);
     _if (l2v5z > 0) _then
       _for l2v6z :=1_to l2v5z _do write(sp)
     _else
       write(l2v7z[l2v4z]);
  _);
 _);
 U1434;
 _);

 _proced school;
_label 6476, 6503, 6624;
_var l2v1z:boolean;
l2v2z:boolean;
l2v3z:boolean; l2v4z:alfa;

 _proced L6410;
 _(
 manpage( (2210317C) );
 _if l2v2z _then  _(
 writeln('  ИМЕНА ПРИКАЗОВ МОЖНО СОКРАЩАТЬ ДО ТРЕХ БУКВ. НАБЕРИТЕ ПРИКАЗ,
ПОТОМ СДЕЛАЙТЕ ИСПОЛНЕНИЕ - НАЖМИТЕ  (ЕТХ)  И ВЫ ПОЛУЧИТЕ ОПИСАНИЕ
ПРИКАЗА И ЕГО ОПЕРАНДОВ.
');
 _);
_);

 _proced L6421;
 _(
 g2069z := (g2069z + 1);
 writeln('НЕПОНЯТНО');
  _case g2069z _of
  1, 2: _GOTO 6476;
  3: _( writeln(' НАБЕРИТЕ ИМЯ ПРИКАЗА. ВОТ СПИСОК');
    L6410; _GOTO 6476 _);
  4: _GOTO 6624
  _end
 _);

  _( (* school *)
 g2069z := 1;
 l2v2z := true;
    writeln(ornament:18, ' ВЫ ВОШЛИ В ШКОЛУ БЛОКА КАДРЫ ', ornament);
 _if (INP@ = etx) _then _( l2v3z := false; L6410 _)
    _else _( l2v3z := true; _goto 6503 _);
 6476:
 TTIN(2);
 l2v2z := false;
 _if  (INP@ = etx) _then  L6421;
 6503:
 _if (INP@ _in digit) _then  L6421 _else _if INP@ _in letter _then _(
   l2v1z :=   getAlfa( l2v4z, 3 );
    _select
    ('СПИ' = l2v4z): L6410;
    ('ИНФ' = l2v4z) : manpage( (3170634C) );
    ('ПАР' = l2v4z) : manpage( (6340672C) );
    ('ШКО' = l2v4z) : manpage( (15031635C) );
    ('ДАЙ' = l2v4z) : manpage( (17061746C) );
    ('ДАТ' = l2v4z) : manpage( (17461766C) );
    ('УСТ' = l2v4z) : _( manpage( (21342625C) ); manpage( (26253265C) );_);
    ('НАЙ' = l2v4z) : manpage( (32653740C) );
    ('АНК' = l2v4z) : manpage( (12121256C) );
    ('ПЕР' = l2v4z) : manpage( (12561503C) );
    ('ОТЧ' = l2v4z) : manpage( (20032056C) );
    ('СЛУ' = l2v4z) : manpage( (20562134C) );
    ('ВЫХ' = l2v4z) : _( _if l2v2z _then manpage( (16351706C) ); _goto 6624 _);
    true: L6421
    _end; (q) _exit q;
    _); 
    _if (INP@ = ',') _then _(  get(INP); _goto 6503 _)
    _else _if INP@ <> etx _then L6421 _else ;
    __if l2v3z _then _goto 6624; _goto 6476;
 6624:
    writeln(ornament:18, ' ВЫ ВЫШЛИ ИЗ ШКОЛЫ БЛОКА КАДРЫ ', ornament);
  _);

_proced save;
_var l2v1z:@page; l2v2z:integer;
_(
 l2v2z := 0;
  l2v1z := ref(s.sizeof);
  _for l2v2z := 0 _to s.sizeof _do g2077z@[l2v2z] := l2v1z@[l2v2z];
_);

 _proced restore;
_var l2v1z:@page; l2v2z:integer;
_(
 l2v2z := 0;
  l2v1z := ref(s.sizeof);
  _for l2v2z := 0 _to s.sizeof _do  l2v1z@[l2v2z] := g2077z@[l2v2z];
 _);

_proced U6673;
_var l2v1z, l2v2z:integer;
_(
 _if _not debug _then _(
 code(Э0634=,);
 l2v1z := ;
 l2v1z := (l2v1z - g2078z);
 _if _not (l2v1z >= 0) _then  EXIT;
 code(Э05310=,);
 l2v2z := ;
 l2v2z := (l2v2z - g2079z);
 _if _not (l2v2z >= 0) _then  EXIT;
 g2080z := shift(l2v1z, 2);
 stats(4, 33 );
 (q) g2080z := shift(l2v2z, 9);
 stats(4, 36 );
  _)
_);

_proced exec(l2a1z:integer);
_var l2v1z:integer; l2v2z:sixchars;
F:text;
_procedure L11256(_var f:text; _var d:data; j:integer); _( code(ПБ76022=,); _);
_(
 _if ЗАПРЕТ _or debug _then _GOTO 7563;
_if ([2,3] * d.flags) = [] _then  _(
 stats( 4, 16 );
 writeln(ornament:18, '   ВЫ ВЫШЛИ ИЗ БЛОКА СПРАВОК  ', ornament);
 _) _else save;
 U6673;

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
 reset(INP);
 _if ([2,3] * d.flags = []) _then _(
   L1024; L1446;
   writeln( ornament:18, '   ВЫ ВОШЛИ В БЛОК СПРАВОК    ', ornament);
 _) _else
 restore;
 d.flags := d.flags - [2,3];
 _GOTO 7322;
_);

_proced chkAdmin(l2a1z:integer);
 _(
 _if _not (l2a1z _IN d.perms) _then  _(
 writeln('ВАМ НЕЛЬЗЯ');
 d.flags := d.flags - [2,3];
 _GOTO 7315;
 _);
_);

_proced secret(l2a1z:integer);
 _(
   code(ИА76403=СЧ,17ЗЧ1=СЧ13,СД/-45/=17ЛУ1,17СР1=17ЗЧ1,2СЧ3=СД/-45/,17ЛС1=ИА76403,ЗЧ=);
 _);

_proced getPasswd(_var passwd:alfa);
_var a:sixchars; i:integer;
_(
 writeln('ПАРОЛЬ ?');
 secret(1);
 BIND(' --> {172');
 secret(0);
 _for i := 1 _to 6 _do
 _if input@ = etx _then a[i] := sp
  _else _( a[i] := input@; get(input) _);
 pck(a[1], passwd);
_);

_proced L7207(l2a1z:alfa);
_label 7243;
_var l2v1z, l2v2z:integer;
l2v3z:alfa;
l2v4z:sixchars;

_proced L7170(l3a1z:alfa);
_label 1;
 _(
 _if _not (l2v2z <= 1023) _then  _(
   _goto 1;
 _);
   pg32ptr@[l2v2z].a := l3a1z;
 l2v3z := ;
 l2v2z := (l2v2z + 1);
 _if (l2v3z = '(FIN){175') _then _(
1:
   code(2СЧ4=СД/-14/,2ЛС5=); (* (l2v1z << 12) | l2v2z *)
   pg32ptr@[0].i := ;
 _GOTO 7243;
   _);
 _);

_( (* L7207 *)
 enq66;
 rdpg32( 54, 474 );
  l2v3z := pg32ptr@[0].a;
  code(СД/14/=2ЗЧ4,МР=СД/44/,);
 l2v2z := ;
 L7170( 'АDМIN+' );
 L7170(   today  );
 L7170(   U2553  );
  l2v3z := d.d10;
  code(СД/10/=);
 l2v3z := ;
 unpck(l2v4z[1],  l2v3z );
 l2v4z[1] := sp;
 l2v4z[6] := ;
 pck(l2v4z[1], l2v3z);
 L7170( l2v3z );
 L7170( l2a1z );
 L7170( '(FIN){175' );
  7243:
 wrpg32( 54, 474 );
 deq66;
  _);


_(
 code(СЧ76233=,);
 a := ;
 pg32ptr := _nil;
 g2077z := ptr(67000B);
  g2061z := true;
  g2080z := 1;
 code(Э0634=,);
 g2078z := ;
 code(Э05310=,);
 g2079z := ;
 s.sizeof := ord(ref(last)) - ord(ref(s.sizeof));
 ЗАПРЕТ := false;
 debug := ;
 g2068z :=   L3223( 2060 );
  _if (a <> 'ТАМБОВ') _then _(
  d.d9 := 'ОТЛКАД';
  d.d10 := '501300';
 L1024;
 writeln('<*>  ОТЛАДКА  <*>');
 d.prnEnable := false;
 d.d14 := true;
 d.dpyEnable := ;
 debug := ;
 d.curVol := 0;
  _) _else  enter;
7315:
 timeout;
 L1446;
 TTIN(1);
 ЗАПРЕТ := false;
 g2061z := ;
 7322:
 g2062z := 0;
  7323:
 _if getAlfa(cmd, 3) _then _select
 ('КАД' = cmd) _or  ('СПР' = cmd)  : _(
  _if _not (32 _in d.flags) _then _(
  getPasswd( a );
 _if (a <> prof) _then_(
 writeln('ЗАФИКСИРОВАНА ПОПЫТКА ВХОДА В ЗАКРЫТЫЙ БЛОК 
      П О П А Л И С Ь !');
 L7207( '!КАДР!' );
 7345:
 ЗАПРЕТ := false;
 rewrite(INP);
 write(INP,'ВРЕ  {377');
 _goto 7532;
  _) _else  d.flags := d.flags  + [32];
  _);
  stats(4, 1);
  _goto 7315;
 _);
  ('СЛУ' = cmd) : _(
 chkAdmin( 3 );
 _if _not (33 _IN d.flags) _then  _(
 getPasswd( a );
  _if (a <> valet) _then _(  writeln('ВАМ НЕЛЬЗЯ'); L7207( '!СЛУК!' ); _goto 7315 _);
  _);
  d.flags := d.flags  + [33];
 exec( (5401553C) );
  _);
  ('УСТ' = cmd) : _(  L5315( true ); stats( 4,2) _);

  ('НАЙ' = cmd) | ('АНК' = cmd) | ('ПЕР' = cmd) : _(
  d.flags := d.flags + [2];
  exec( (6401545C) )
  _);
  ('ОТЧ' = cmd) : _(  chkAdmin( 2 );
    exec(report);
 _);
 ('ЛИН' = cmd) : _( 7432: chkAdmin( 4 ); exec( (6660723C) ); _);
 ('ПЕЧ' = cmd) : _(  chkAdmin( 5 ); modePrint _);
 ('ВЦП' = cmd) : U3147;
 ('НАС' = cmd) : U1750;
 ('ЗАК' = cmd) : L1736;
 ('ИНФ' = cmd) :  _( stats( 4, 7 ); manpage( 12433 ) _);
 ('ПАР' = cmd) : _(  stats( 4, 9 ); manpage( (6721212C) ) _);
 ('ЭКР' = cmd) : modeScreen;
 ('ШКО' = cmd) : _( stats( 4, 6 ); school _);
 ('ДАТ' = cmd) : _(
 stats( 4, 10 );
 rdDB;
 write('СОСТОЯНИЕ БАЗЫ:');
  L2674( sel(listA[3].i, 24, 24) );
 U1434;
  _);
   ('ДАЙ' = cmd) : _(
 stats( 4, 8 );
 d.flags := d.flags  + [2];
 exec( z5 );
 _);
 ('КОН' = cmd): _(
 rewrite(INP);
 write(INP,'КОН  {377');
7532:
 d.flags := d.flags + [2];
 exec( (3401751C) );
_);
 ('ВЫХ' = cmd): _(
   _if debug _then _(
     writeln('<*>  ВОЗВРАТ  <*>');
     code(СЧ12=ЗЧ76135,ПБ76002=,);
   _) _else  _if _not g2061z _then _( rewrite(INP); write(INP,'ВЫХ  {377'); _goto 7532 _);
  _);

 ('SLE' = cmd): _goto 7532; 

  true: _if ЗАПРЕТ _then _( 7563: write('В БЛОКЕ НЕТ ПРИКАЗА '); ГГ(cmd); writeln _)
  _else _(
   writeln('ХОТИТЕ ВЫЙТИ ИЗ БЛОКА СПРАВОК ? <ДА,НЕТ>');
   BIND(' --> {172');
  _if (input@ = 'Д') _then _goto 7532 _else _goto 7315
  _)

 _end _else writeln('НЕПОНЯТНО');
_if (INP@ = '&') _then  _( get(INP); _goto 7323; _);
 _goto 7315;
  
  _).
