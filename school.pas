(*=p-,t-,m-,l-*)
_program ШКОКАД;
_label 6724,6727,7037,7057,6737, 6730;
_const z1 = 3401751B; z2=5401540B; z3=5401553B; z4=3400225B;
dbVol=2060;c112=112;c189=189;c190=190;c191=191;
pl='+';c146=146B;c2=2;c4=4;c7=7;c8=8;c16=16;
sl='/';info=401756B;c1731=1731;
c214=214;c232=232;c264=264;c296=296;c308=308;c510=510;
c800=800;c832=832;c914=914;c924=924;c934=934;c942=942;
c56=56;
etx='{377';
sp=' ';dot='.';minus='-';eq='=';c36=36;comma=',';star='*';
stars='******';ornament='-=#=- ';
kadry='!КАДРЫ';katalo='КАТАЛО';zonkd='!ЗОНКД';zonpch='!ЗОНПЧ';
c17=17;
c60=60;lA='A';lZ='Z';c9=9;lD='D';c47=47;c1023=1023;c6=6;
c24=24;c39=39;c20=20;c44=44;c4096=4096;r32=001032T;
w32=000032T;
tene5=100000;
_type letter='A'..'Z'; digit='0'..'9'; t6='0'..'D';
pwrd = _record i: integer _end;
bitset=_set _of 0..47;
word=_record _case integer _of
0:(i:integer);
1:(b:bitset);
2:(a:alfa)
_end;
page= _array[0..1023] _of word;
sixchars=_array [1..6] _of char;
string=_array[1..24] _of char;
arr = _array [1..39] _of word;
setting = _record
sizeof:integer;
 hasDept,
 hasAnk,
 hasFam,
 hasGiven,
 hasPatr,
 hasVol,
 hasZone,
 hasV2,
hasZ2:boolean;
deptNum, ankBeg, ankEnd:integer;
volNum, zonBeg, zonEnd:integer;
volN2, zonB2, zonE2:integer;
famLen,  givLen, patLen: integer;
famStr:_array[1..24] _of char;
givStr:_array[1..16] _of char;
patStr:_array[1..16] _of char;
show, annex, upto:integer
_end;
_var cmd:alfa;
g11z:alfa;
g12z:alfa;
listA,listB:page;
g2061z:boolean;
g2062z:boolean;
g2063z:boolean;
g2064z:boolean;
tokLen:integer;
g2066z:integer;
g2067z:integer;
g2068z:integer;
g2069z:integer;
tokPos, qqaq, tokRem:integer;
g2073z:integer;
g2074z:integer;
g2075z,g2076z:integer;
g2077z:integer;
(* <- 2077 *)
g2078z:bitset;
g2079z:integer;
pos:integer;
g2081z:@arr;
pg32ptr:@page;
g2083z, begTime:integer;
g2085z,g2086z,g2087z,g2088z:integer; (* <- 2088 *)

curVol, g2090z:integer;
g2091z:integer; (* <- 2091 *)
g2092z, g2093z, g2094z, qqiq: integer;
g2096z:bitset;
flags:bitset;
prnEnable:boolean; (* <- 2098 *)
debug: boolean;
dpyEnable:boolean;
g2117z:integer;
g2118z:integer; (* <- 2102 *)
statArr:arr;
s:setting;
token:_array[1..20] _of char;
INP:text; (* <- 2243 *)

_proced skipsp;
 _(
 _while _not (INP@ <> ' ') _do get(INP);
 _);

 _proced L0663;
_(
  _while (token[tokPos] = ' ') & (tokRem > (0)) _do _(
   tokPos := (tokPos + (1));
   tokRem := (tokRem - (1));
 _);
_);

_proced tkNext;
 _(
   _while (token[tokPos] _in letter) & (tokRem > 0) _do _(
     tokPos := (tokPos + (1));
     tokRem := (tokRem - (1));
   _);
   L0663
 _);  

_proced fillToken;
 _(
 tokLen := (0);
   _while ((INP@ _in letter) | (INP@ = sp)) & (tokLen < 20) _do _(
    tokLen := (tokLen + (1));
   token[tokLen] := INP@;
   get(INP)
   _);
   qqaq := tokLen;
   tokRem := ;
   tokPos := (1);
 _);

_proced skipPrompt;
_var l2v1z:integer;
_(
 skipsp;
 _if (INP@ = eq) _then _for l2v1z := 1 _to 4 _do _(
   _if INP@ = etx _then  EXIT;
   get(INP);
 _);
 _);

_proced rdpg32(l2a1z, l2a2z:integer);
 _(
 l2a2z := (((l2a1z * 4096) + l2a2z) + (10320000000000C));
   code(2Э0704=,)
 _);

_proced wrpg32(l2a1z, l2a2z:integer);
 _(
 l2a2z := (((l2a1z * 4096) + l2a2z) + (320000000000C));
   code(2Э0704=,)
 _);
(*=m+*)
_function itoa(l2a1z:integer):alfa;
_var l2v1z, l2v2z, l2v3z:integer; l2v4z:sixchars; l2v10z:alfa;
_(
 l2v3z := 100000;
 _for l2v1z := 1 _to 6 _do _(
 l2v2z := trunc(l2a1z / l2v3z);
 l2a1z := l2a1z - l2v2z * l2v3z;
 l2v3z := l2v3z _div 10;
 l2v4z[l2v1z] := chr(l2v2z);
 _);
 pck(l2v4z[1], l2v10z);
 itoa := l2v10z;
 _);

_procedure TTIN(level:integer);
_label 1;
_var v1, v2: integer;
_(
  _if level = 1 _then BIND(' ==С {172') _else BIND(' =-С {172');
  _if prnEnable  _then _(
    code(СЧ76013=УИ7,);
    v1 := 2; code(ЗЧ76013=,);
    _if level = 1 _then write(' ==С ') _else write(' =-С ');
  _);
  rewrite(INP);
  v2 := 0;
  _while input@ <> etx _do _(
  _if prnEnable _then write(input@:1);
    v2 := v2 + 1;
    _if v2 > 800_then _(
      rewrite(INP);
      write(INP, 'SLЕ  {377');
      flags := flags + [47];
      _goto 1
    _);
    write(INP,input@);
    get(input);
  _); (* while *)
  write(INP, input@);
  1:
  reset(INP);
  _if prnEnable _then _(
    writeLN;
    code(ВИ7=ЗЧ76013,);
  _);
_);

_proced timeout;
_var i:integer;
_(
  _if g2063z _then EXIT;
 code(Э0634=,);
 i := ;
 _if g2093z - i < 50 _then _(
   rewrite(INP);
   writeln('ВАШЕ ВРЕМЯ ИСТЕКЛО');
   g2062z := false;
   write(INP, 'КОН  {377' );
  _GOTO 7037;
  _);
_);

 _proced chkMagic;
 _(
 _if pg32ptr@[0].a <> kadry _then _(
   writeln('БАНК ИСПОРЧЕН');
   _GOTO 6724;
 _);
_);

_proced enq52; _var l2v1z: integer;
_(
 l2v1z := (520000C);
 code(Э050105=,Э050115=,)
 _);

_proced deq52; _var l2v1z: integer;
_(
 l2v1z := (520000C);
 code(Э050105=,Э050116=,)
 _);

_proced rdPage(_var dst:page; vol, zone:integer;  copy:boolean);
_var i:integer;
l2v2z, l2v3z:alfa;
l2v4z:alfa;
_(
 timeout;
 _if (curVol <> vol) _then _(
   _if (curVol <> (0)) _then _(
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
     _GOTO 6724;
   _)
 _);
 rdpg32( 52B, zone );
 chkMagic;
 _if copy _then _for i := 0 _to 1023 _do _(
    code(2ИК7=ИА64000,СЧ=);
    dst[i] := ;
  _)
 _);

_proced wrPage(_var src: page; vol, zone:integer; copy:boolean);
_var l2v1z:integer; l2v2z, l2v3z, l2v4z:alfa;
_(
 timeout;
 _if copy _then _for l2v1z := (0) _to (1023) _do _(;
    l2v1z := l2v1z;
    code(УИ7=);
  g11z := src[l2v1z].a;
    code(ИА64000=7ЗЧ,)
 _);
 chkMagic;
 _if (curVol <> vol) _then _(
   _if (curVol <> (0)) _then _(
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
   _if (l2v1z = (0)) _then _(
      curVol := vol;
   _) _else _(
     writeln('РАБОТАТЬ НЕЛЬЗЯ КО=', l2v1z:3);
     _GOTO 6724;
   _)
 _);
 wrpg32(52B, zone );
_);

_proced rdDB;
 _(
   _if (listA[1].a <> katalo) _then
     rdPage( listA, dbVol, (112), true );
   g2073z := sel(lista[3].i, 0, 7);
 _);

 _proced rdMyZone;
 _(
 _if (g2075z = (0)) _then _(
   writeln('НЕТ БАЗЫ');
   _GOTO 6724;
  _);
  rdPage( listA, g2075z, g2076z, false );
  g2074z :=   sel( pg32ptr@[1].i, 0, 7);
_);

 _proced wrDB(l2a1z:boolean);
 _(
 enq52;
 wrPage( listA, dbVol, (112), l2a1z );
 deq52;
 _);

 _proced wrmyDB;
 _(
 enq52;
 wrPage( listA, g2075z, g2076z, false );
 deq52;
 _);

 _proced rdZKD;
 _(
   _if (listB[1].a <> '!ЗОНКД') _then 
    rdPage( listB, dbVol, (190), true );
 _);

 _proced rdZPCH;
 _(
   _if (listB[1].a <> '!ЗОНПЧ') _then
     rdPage( listB, dbVol, (191), true );
 _);

_proced TTOUT;
_var r:alfa;s:integer;
_(
  writeLN;
  timeout;
  code(СЧ77015=);
  r := ;
  _if (r = 'Н{3770000') _then_(
   _if (g2068z >= (0)) _then _(
    s := g2068z;
    code(ЗЧ76013=);
    g2068z := -1;
  _);
 _GOTO 6724;
  _)
_);

_proced stats(l2a1z:integer);
_var l2v1z, l2v2z, l2v3z:integer;
_(
 _if _not g2063z _then _(
  l2v1z := statArr[l2a1z].i;
 l2v3z := ;
 l2v1z := (sel( l2v3z, 12, 6) + g2085z);
  code(СД/6/=); l2v2z := ;
  code(МР=СД/-6/,МР=);  l2v1z := ;
  ins( l2v3z, l2v1z, 12, 6 );
  statArr[l2a1z] := ;
    _if l2v2z > 0 _then _(
    g2085z := l2v2z;
    stats(l2a1z - 1);
    g2085z := 1;
  _);
 _if (l2a1z <= 21) & (l2a1z > (0)) _then  stats( (0) );
 _if (l2a1z <= 21) & (l2v1z = 62) _then _(
   writeln('ПРИКАЗЫ КОНЧИЛИСЬ');
   rewrite(INP);
   write(INP,'КОН {377');
   _GOTO 7037;
  _)
  _)
_);

 _proced initAnk;
 _(
 s.hasDept := false;
 s.hasAnk := ;
 s.hasFam := ;
 s.hasGiven := ;
 s.hasPatr := ;
 s.hasVol := ;
 s.hasZone := ;
 s.hasV2 := ;
 s.hasZ2 := ;
 s.show := 0;
 s.famLen := 0;
 s.givLen := ;
 s.patLen := ;
 _);
 _proced error;
 _(
    ГГ(g11z); writeln('= <ОШИБКА>');
    initAnk;
    _GOTO 6724;
 _);

_function getNum(base:integer):integer;
_var l2v1z:char; l2v2z:integer;
 _(
 l2v2z := (0);
 skipsp;
 _while INP@ _in digit _do _(
   l2v1z := INP@;
 _if (ord(l2v1z) >= base) _then _(
   writeln('ОШИБКА В ЧИСЛЕ');
   _GOTO 6724;
 _);
l2v2z := (l2v2z * base) + ord(l2v1z);
 get(INP);
_);
 skipsp;
 getNum := l2v2z;
_);

_function getAlfa(_var l2a1z:alfa):boolean;
_var l2v1z:sixchars; l2v7z:integer;
_(
 skipPrompt;
 l2v7z := (1);
 l2a1z := '000000';
 unpck(l2v1z[1],  l2a1z );
 _while (INP@ _in letter) & (l2v7z < 4) _do _(
   l2v1z[l2v7z + 3] := INP@;
 get(INP);
 l2v7z := (l2v7z + (1));
  _);
  _while (INP@ _in letter) _or (INP@ = '-') _do get(INP);
 skipsp;
 pck(l2v1z[1], l2a1z);
 getAlfa := l2v7z > 1;
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
 a1 := stars;
 unpck(u[1],  a1 );
 unpck(u[7],  a1 );
 fillToken;
 k := (0);
 _repeat 
  i := (0);
  _while (token[tokPos] _in letter ) & (tokRem > 0) & (i < len) _do _(
   i := i + 1;
   k := k + 1;
   _if k > 12 _then  error;
    u[k] := token[tokPos];
   tokPos := tokPos + 1;
   tokRem := tokRem - 1;
  _);
  tkNext;
 _until _not (token[tokPos] _in letter) _or (tokRem <= 0);
 pck(u[1], a1);
 pck(u[7], a2);
 k := off + 2;
 _for i := 0 _to cnt - 1 _do _(;
   l2v5z := i * 2;
  _if (listB[k + l2v5z].a = a1) & 
  (listB[k + l2v5z + 1].a = a2) _then _(
     findToken := i;
     EXIT;
   _)
 _);
 error;
 _);

_function L1745:integer;
_var l2v1z, l2v2z:integer;
_(
 l2v1z :=   findToken( (308) );
 l2v2z :=   getNum( 10 );
 _if _not (l2v2z <= (127)) _then  error;
 l2v1z := ((l2v1z * 16384) + (l2v2z * (128)));
 _if (INP@ = '-') _then _(
   get(INP);
   l2v2z :=   getNum( 10 );
   _if _not (l2v2z <= (177)) _then  error;
   l2v1z := (l2v1z + l2v2z);
  _);
 L1745 := l2v1z;
 _);

_function today:integer;
_var l2v1z:integer;
_(
 code(Э050114=,);
 l2v1z := ; 
 today := sel(l2v1z,16,4) * 100000 + sel(l2v1z,20, 4) * 10000 +
  sel(l2v1z, 28, 1) * 1000 + sel(l2v1z, 24, 4) * 100 +
  sel(l2v1z, 33, 2) * 10 + sel(l2v1z, 29, 4);
 _);

_function L2033(l2a1z:integer):integer;
_var l2v1z, l2v2z, l2v3z, l2v4z:integer;
_(
  l2v1z := sel(l2a1z, 21, 3);
  l2v2z := sel(l2a1z, 9, 12);
  l2v3z := sel(l2a1z, 0, 9);
  l2v4z := (0);
  _case l2v1z _of 
  1: l2v4z := l2v2z;
  2: l2v4z := (l2v2z + l2v3z);
  3: l2v4z := (trunc((((l2v2z * l2v3z)) / ((100)))) + l2v2z);
  4: _( l2v4z := trunc((((l2v2z * (1731))) / ((10000))));
        l2v4z := (trunc((((l2v4z * l2v3z)) / ((100)))) + l2v4z);
     _)
  _end;
  L2033 := l2v4z;
_);

_proced L2110(l2a1z:integer);
_var l2v1z:integer;
_(
  l2v1z := trunc(l2a1z / 10);
  write(l2v1z:1, l2a1z - l2v1z * 10:1)
 _);

_proced L2126(l2a1z:integer);
_var l2v1z, l2v2z:integer;
_(
 l2a1z := (l2a1z + 25);
 l2v1z := trunc(((l2a1z) / ((537440C))));
 l2a1z := (l2a1z - (l2v1z * (537440C)));
 l2v2z := trunc(((l2a1z) / ((3000))));
 _if (l2v1z <> (0)) _then _(
   write( l2v1z:3, dot:1 );
   L2110( l2v2z ); code(ИА=)
  _) _else
    write( l2v2z:6);
  write(dot:1);
 L2110( trunc((((l2a1z - (l2v2z * (3000)))) / 50)) ); code(ИА=)
 _);

_proced wrDec(l2a1z:integer);
_var l2v1z, l2v2z, l2v3z:integer;
_(
 l2v3z := (1000);
 _for l2v1z := (1) _to 4 _do _(;
   l2v2z := trunc(l2a1z / l2v3z);
   l2a1z := (l2a1z - (l2v2z * l2v3z));
   l2v3z := trunc(l2v3z / 10);
   write(l2v2z:1);
 _);
_);

_proced wrOctal(i, len:integer);
_var a:alfa; b:sixchars;
_(
 mapia(i, a);
 unpck(b[1], a);
  _for i := 7 - len _to 6 _do _( write(b[i]:1); code(ИА=) _)
_);

_proced wrSpaces(l2a1z:integer);
_var l2v1z:integer;
_(
 _for l2v1z := (1) _to l2a1z _do _(
    output@ := sp;
    put(output);
 _);
_);

_proced L2256(l2a1z:integer);
_var l2v1z, l2v2z:integer;
_(
  _if (l2a1z = (0)) _then write('----------')
  _else _(
    l2v2z := trunc(((l2a1z) / ((10000))));
    l2a1z := (l2a1z - (l2v2z * (10000)));
    l2v1z := trunc(((l2a1z) / ((100))));
    L2110( (l2a1z - (l2v1z * (100))) );
    write(dot:1);
    L2110( l2v1z );
    write(dot:1, '19');
    L2110( l2v2z );
  _);
_);

_proced L2320(l2a1z:alfa; l2a2z, l2a3z:integer);
_var l2v1z, l2v2z:integer;
_(
 l2v2z := (1);
 code(СЧ76013=); g2068z := ;
 code(2ЛУ7=ЗЧ76013,);
 _for l2v1z := (1) _to 12 _do write(chr(146B):1 );
 ГГ( l2a1z );
 _if (l2a3z = (1)) _then wrDec( l2a2z ) _else wrOctal( l2a2z, (4) );
 TTOUT;
 l2v2z := g2068z;
 code(ЗЧ76013=);  
 g2068z := -1;
_);

_proced L2355(off2, off1:integer);
_var i, j:integer; a:alfa; u:sixchars;
_(
 rdZPCH;
 a := listB[off1].a;
 g2079z := ;
 pos := (0);
 _for i := 1 _to 2  _do _(;
   a := listB[2 * off2 + off1 + i + 1].a;
   _if (a <> stars) _then _(
     unpck(u[1],  a );
     _for j := 1 _to 6 _do _(
  _if (u[j] <> '*') _then _( write(u[j]:1); pos := pos + 1; code(ИА=ИА,) _)
     _)
   _);
 _);
_);

_proced wrDept(l2a1z:integer);
_var l2v1z, l2v2z, l2v3z:integer;
_(
  l2v1z := sel(l2a1z, 14, 7);
  l2v2z := sel(l2a1z, 7, 7);
  l2v3z := sel(l2a1z, 0, 7);
  L2355( l2v1z, (308) );
  _if (l2v2z <> (0)) _then _( write(l2v2z:3); pos := pos + 3 _);
  _if (l2v3z <> (0)) _then _( write(minus:1, l2v3z:2); pos := pos + 3 _);
 wrSpaces( (g2079z - pos) );
_);

_proced timeStamp(* 2453 *)(_var l2a1z:integer);
_var l2v1z:integer;
_(
 l2v1z :=   today;
 ins( l2a1z, l2v1z, 0, 24);
 code(Э05310=,);
 l2v1z := ;
 ins( l2a1z, l2v1z, 24, 24);
_);

_proced L2473(l2a1z:integer);
 _(
 write(' ДАТА='); L2256( sel(l2a1z, 0, 24) );
 write(' ВРЕМЯ='); L2126( sel(l2a1z, 24, 24) );
 _);
 
_proced L2505;
_var l2v1z:@page;
_(
 l2v1z := ref(listA);
  code(УИ16=7ПА76001,Ь1:7ИА1777=16СЧ,ИА65777=7ЗЧ,7КЦЬ1=);
 _);

_proced L2515;
_var l2v1z:@page;
_(
 l2v1z := ref(listA);
  code(УИ16=7ПА76001,Ь2:ИА65777=7СЧ,7ИА1777=16ЗЧ,7КЦЬ2=);
_);

_proced L2525(* 2525 *);
_var l2v1z, l2v2z:integer;
_(
_for l2v1z := (0) _to 1023  _do _(
  code(2СЧ3=УИ7,);
  l2v2z := listA[l2v1z].i;
  code(ИА64000=7СЧ,);
  listA[l2v1z] := ;
  code(2СЧ4=ИА64000,7ЗЧ=,);
 _);
 _);

_proced L2544(* 2544 *);
_var l2v1z:integer;
_(
 _for l2v1z := (0) _to 1023 _do _(
    l2v1z := l2v1z;
    code(УИ7=СЧ,ИА64000=7ЗЧ,)
 _);
_);

_proced CPUusage(* 2557 *);
_var l2v1z:integer;
_(
 code(Э0634=,);
 l2v1z := ;
 write('ИЗРАСХОДОВАНО ');
 g2066z := trunc(((l2v1z) / 50));
 l2v1z := ((l2v1z - (g2066z * 50)) * (2));
 L2110( g2066z );
 write(dot:1);
 L2110( l2v1z );
 writeln(' СЕК');
 stats( (17) );
 _);

_proced modeScreen;
_label 1, 2, 3;
_(
  _select
  INP@ = 'Д': 1: _(
    code(СЧ76013=17ЗЧ,СЧ13=); g2067z := ; code(17ЛС=ЗЧ76013,);
    writeln('ВКЛЮЧЕНА ВЫДАЧА НА ЭКРАН');
    dpyEnable := true;
    _);
  INP@  = 'Н': 2: _(
    dpyEnable := false;
    writeln('ВЫКЛЮЧЕНА ВЫДАЧА НА ЭКРАН');
    code(СЧ76013=17ЗЧ,СЧ27=); g2067z := ; code(17ЛУ=ЗЧ76013,);
  _);
  INP@ = etx: 3: _if dpyEnable _then _goto 2 _else _goto 1;
  INP@ = '&': _goto 3;
  true: _( writeln('НЕПОНЯТНО'); _goto 1 _)
  _end;
  g2064z :=   getAlfa( g12z );
  stats( (16) );
 _);

_proced modePrint;
_label 1, 2, 3;
_(
  _select
  INP@ = 'Д': 1: _(
    code(СЧ76013=17ЗЧ,СЧ27=); g2067z := ; code(17ЛС=ЗЧ76013,);
    writeln('ВКЛЮЧЕНА ПЕЧАТЬ АЦПУ');
    prnEnable := true;
    _if debug  _then _(
      code(СЧ=Э06276,);
      debug := false;
    _);
  _);
  INP@  = 'Н': 2: _(
    prnEnable := false;
    writeln('ВЫКЛЮЧЕНА ПЕЧАТЬ АЦПУ');
    code(СЧ76013=17ЗЧ,СЧ13=); g2067z := ; code(17ЛУ=ЗЧ76013,);
  _);
  INP@ = etx: 3: _if prnEnable _then _goto 2 _else _goto 1;
  INP@ = '&': _goto 3;
  true:_(  writeln('НЕПОНЯТНО'); _goto 1 _)
  _end;
  g2064z :=   getAlfa( g12z );
  stats(* 1446 *)( (15) );
 _);

_proced manpage(l2a1z:integer);
_var start, last, i, l2v4z, l2v5z, l2v6z:integer; l2v7z:sixchars;
_(
 code(2СЧ3=СД/14/,2ЗЧ4=МР,СД/44/=); last := ;
 g2069z := 0;
 last := (last - (2));
 _if (start < (1024)) _then _(
   _if  (pg32ptr@[1].a <> 'СЛУСЛУ') _then  rdpg32( (0), info );
 _) _else _(
   start := (start - (1024));
   last := (last - (1024));
    _if (pg32ptr@[1].a <> 'УЛСУЛС') _then  rdpg32( (0), info+1 );
 _);
 _for i := start _to last _do _(;
  unpck(l2v7z[1],  pg32ptr@[i].a );
   _for l2v4z := (1) _to 6 _do _(
     l2v5z := (ord(l2v7z[l2v4z]) - (128));
     _if (l2v5z > (0)) _then
       _for l2v6z := (1) _to l2v5z _do write(sp:1)
     _else
       write(l2v7z[l2v4z]:1 );
  _);
 _);
 TTOUT(* 1430 *);
 _);

_proced school(* 3066 *);
_label 3114, 3121, 3253;
_var l2v1z:boolean;
l2v2z:boolean;
l2v3z:boolean;
l2v4z:alfa;
_proced L3023;
 _(
 manpage( (02410350C) );
 _if l2v2z _then
 writeln('  ИМЕНА ПРИКАЗОВ МОЖНО СОКРАЩАТЬ ДО ТРЕХ БУКВ. НАБЕРИТЕ ПРИКАЗ,
ПОТОМ СДЕЛАЙТЕ ИСПОЛНЕНИЕ - НАЖМИТЕ  (ЕТХ)  И ВЫ ПОЛУЧИТЕ ОПИСАНИЕ
ПРИКАЗА И ЕГО ОПЕРАНДОВ.
');
 _);

 _proced L3034;
 _(
 g2069z := (g2069z + (1));
 writeln('НЕПОНЯТНО');
  _case g2069z _of
  1, 2: _GOTO 3114;
  3: _( writeln(' НАБЕРИТЕ ИМЯ ПРИКАЗА. ВОТ СПИСОК');
    L3023; _GOTO 3114 _);
  4: _GOTO 3253
  _end
 _);

  _( (* school *)
 g2069z := (1);
 l2v2z := true;
 writeln(sp:12, ornament, ' ВЫ ВОШЛИ В ШКОЛУ СЛУЖЕБНОГО БЛОКА ', ornament);
 _if (INP@ = etx) _then _( l2v3z := false; L3023 _)
    _else _( l2v3z := true; _goto 3121 _);
 3114:
 TTIN( (2) );
 l2v2z := false;
 _if  (INP@ = etx) _then  L3034;
 3121:
 _if (INP@ _in digit) _then  L3034 _else _if INP@ _in letter _then _(
   l2v1z :=   getAlfa( l2v4z );
    _select
    ('СПИ' = l2v4z): L3023;
    ('ИНФ' = l2v4z) : manpage( (3500544C) );
    ('ПАР' = l2v4z) : manpage( (5440602C) );
    ('ШКО' = l2v4z) : manpage( (24742630C) );
    ('УСТ' = l2v4z) : manpage( (7541143C) );
    ('РАЗ' = l2v4z) : manpage( (11431235C) );
    ('КАТ' = l2v4z) : manpage( (12351604C) );
    ('ВВО' = l2v4z) : manpage( (20032071C) );
    ('ЗАМ' = l2v4z) : manpage( (20712161C) );
    ('АНК' = l2v4z) : manpage( (21612250C) );
    ('ИСК' = l2v4z) : manpage( (22502314C) );
    ('ЗАЧ' = l2v4z) : manpage( (23142407C) );
    ('УПО' = l2v4z) : manpage( (24072474C) );
    ('ДАТ' = l2v4z) : manpage( (27012734C) );
    ('РАБ' = l2v4z) : manpage( (27343002C) );
    ('ВЫХ' = l2v4z) : _( _if l2v2z _then manpage( (26302701C) ); _goto 3253 _);
    true: L3034
    _end; (q) _exit q;
    _); (* 3237 *)
    _if (INP@ = ',') _then _(  get(INP); _goto 3121 _)
    _else _if INP@ <> etx _then L3034 _else ;
    __if l2v3z _then _goto 3253; _goto 3114;
 3253:
     writeln(sp:12, ornament, ' ВЫ ВЫШЛИ ИЗ ШКОЛЫ СЛУЖЕБНОГО БЛОКА ', ornament);
  _);

_proced done; _(   writeln('СДЕЛАНО'); _);

_proced setup(l2a1z:boolean);
_label 3641, 4064;
_var l2v1z, l2v2z, l2v3z:integer;
l2v4z:boolean;
l2v5z:boolean;
l2v6z:alfa;

_proced needEq;
_(
  _if (INP@ <> '=') _then _(
    (q) writeln('ОШИБКА-НЕТ НА МЕСТЕ ЗНАКА ', eq:1);
    initAnk;
    _GOTO 6724;
  _);
  get(INP);
 _);

_proced getName(what:integer);
_var i:integer; c: char;
_(
 i := (0);
 _while (ord(INP@) _in t6) & (INP@ <> ',') _do _(
   _if (INP@ = sp) _or (INP@ = '.') _then _(
    _if what <> 1 _then _(  get(INP); skipsp; EXIT _);
  _);
 c := INP@;
 get(INP);
 i := i + 1;
 _select
  (what = 0) _or (what = 1): _(
 s.hasFam := true;
 s.famStr[i] := c;
 s.famLen := s.famLen + 1;
  _);
  (what = 2): _(
 s.hasGiven := true;
 s.givStr[i] := c;
 s.givLen := s.givLen + 1;
  _);
  (what = 3): _(
 s.hasPatr := true;
 s.patStr[i] := c;
 s.patLen := s.patLen + 1;
_)
  _end
_);
_);

_proced show;
_var l3v1z:integer;
 _proced wrName(what, len:integer);
_var i:integer; c:char;
_(
  write( sp:1 );
 _for i := 1 _to len _do _(;
    _case what _of
    1: c := s.famStr[i];
    2: c := s.givStr[i];
    3: c := s.patStr[i]
    _end;
    write( c:1 );
  (q) _exit q;
 _);
 writeLN;
_);
_( (* 3431 *)
   _if s.hasDept _then _(
   write(' ПОД = ');
   s.deptNum := s.deptNum;
   l3v1z := ;
   wrDept( l3v1z );
   writeLN;
 _);
    _if s.hasFam _then _(  write(' ФАМ ='); wrName( (1), s.famLen ) _);
    _if s.hasGiven _then _(  write(' ИМЯ ='); wrName( (2), s.givLen ) _);
    _if s.hasPatr _then _(  write(' ОТЧ ='); wrName( (3), s.patLen ) _);
    _if s.hasAnk _then _(  write(' АНК = '); wrDec( s.ankBeg );
      _if (s.ankEnd <> s.ankBeg) _then _( write(minus:1); wrDec( s.ankEnd ) _);
      writeLN;
    _);
 _if s.hasVol _then _(  write(' БОБ = '); wrDec( s.volNum ); writeLN _);
 _if s.hasZone _then _(  write(' ЗОН = '); wrOctal( s.zonBeg, (4) );
    _if (s.zonEnd <> s.zonBeg) _then _(  write(minus:1 ); wrOctal( s.zonEnd, (4) ) _);
    writeLN;
  _);
 _if s.hasV2 _then _(  write('*БОБ = '); wrDec( s.volN2 ); writeLN _);
 _if s.hasZ2 _then _(  write('*ЗОН = '); wrOctal( s.zonB2, (4) );
   _if s.zonE2 <> s.zonB2 _then _( write(minus:1 ); wrOctal( s.zonE2, (4) ) _);
   writeLN;
 _)
_);

_( (* setup *)
  l2v5z := true;
 _if (INP@ = etx) _then _if l2a1z _then _goto 4064 _else EXIT;
 _if _not (INP@ <> '&') _then  EXIT;
  3641:
 l2v4z := false;
 _if (INP@ = '*') _then _(  get(INP); l2v4z := true _);
 _if getAlfa( g11z)  _then _(
 _if (g11z <> 'ПОК') _and _not (g11z = 'СБР') _then  needEq;
 _select
  ('БОБ' = g11z): _(
   l2v1z :=   getNum( 10 );
   _if l2v4z _then _(  s.volN2 := l2v1z; s.hasV2 := true _)
   _else _( s.volNum := l2v1z; s.hasVol := true; _)
  _);
  ('ЗОН' = g11z): _(
   l2v2z :=   getNum( (8) );
   _select
  (INP@ = '-'): _(  get(INP); l2v3z :=   getNum( (8) ) _);
  (INP@ = ':'): _(  get(INP); l2v3z := ((  getNum( (8)) + l2v2z) - (1)) _);
  (INP@ = ','):  l2v3z := l2v2z;
  (INP@ = etx): l2v3z := l2v2z;
  (INP@ = '&'): l2v3z := l2v2z;
  true: error
  _end;
  _if _not (l2v3z >= l2v2z) _then  error;
  _if l2v4z _then _(  s.zonB2 := l2v2z; s.zonE2 := l2v3z; s.hasZ2 := true _)
  _else _( s.zonBeg := l2v2z; s.zonEnd := l2v3z; s.hasZone := true _)
  _);
  ('ПОД' = g11z): _(  s.deptNum :=   L1745; s.hasDept := true _);
  ('БАЗ' = g11z): _(
   _if (getAlfa( l2v6z)) _then _select
     ('ДОП' = l2v6z): s.annex := (1);
     ('РЕЗ' = l2v6z): s.annex := (0);
     true: error
  _end _else  error;
  _);
  ('АНК' = g11z): _(
  _if (getAlfa( l2v6z)) _then _(
   _if (l2v6z = 'ВСЕ') _then  s.hasAnk := false _else error;
  _) _else _(
   s.ankBeg :=   getNum( 10 );
   s.ankEnd := ;
  _if (INP@ = '-') _then _(
    get(INP);
    s.ankEnd :=   getNum(10 );
   _if s.ankEnd < s.ankBeg _then  error;
  _);
  s.hasAnk := true;
  _)
  _);
  ('ФИО' = g11z): _(
 s.famLen := (0);
 s.givLen := ;
 s.patLen := ;
 getName( (0) );
 getName( (2) );
 getName( (3) );
  _);
  ('ФАМ' = g11z): _(  s.famLen := (0); getName( (1) ) _);
  ('ИМЯ' = g11z): _(  s.givLen := (0); getName( (2) ) _);
  ('ОТЧ' = g11z): _(  s.patLen := (0); getName( (3) ) _);
  ('ПОК' = g11z): _(  4064:
   l2v5z := false;
   write(' БАЗА =');
   _if (s.annex = (0)) _then write(' РЕЗИДЕНТНАЯ')
   _else write(' ДОПОЛНИТЕЛЬНАЯ');
    writeLN;
    _if _not (s.show <> (1)) _then  show;
  _);
  ('СБР' = g11z): _(
   l2v5z := false;
   initAnk;
   writeln('УСТАНОВКИ СБРОШЕНЫ');
  _);
  true: _(
   writeln('ОШИБКА ПАРАМЕТРА');
   initAnk;
   _GOTO 6724;
  _)
  _end;(* 4117 *)
  _if (g11z <> 'ПОК') & (g11z <> 'СБР') & _not (g11z = 'БАЗ') _then  s.show := (1);
  _) _else _( (* 4126 *)
   writeln('НЕВЕРНЫЙ ПАРАМЕТР');
   initAnk;
   _GOTO 6724;
  _); (* 4134 *)
  _select
  (INP@ = ','): _(  get(INP); _goto 3641 _);
  (INP@ = etx): _( _if l2a1z & l2v5z _then  done _);
  (INP@ = '&'):;
  true: _(  writeln('ОШИБКА ЗНАКА'); initAnk; _GOTO 6724 _)
  _end;
 stats( (2) );
  _);

_proced L4101(l2a1z:integer);
_var i, l2v2z:integer;
l2v4z:@page;
_(
 l2v4z := ref(listA);
 rdDB;
% g2069z := 0;
 _case l2a1z _of 
1: _(
  _if (g2073z = 102) _then _(  writeln('МНОГО ПОДРАЗДЕЛЕНИЙ'); _GOTO 6724 _);
  g2081z := ptr(10 * g2073z + ord(l2v4z) + 4);
  _);
2: _(
  _if _not s.hasDept _then _( writeln('НЕ ЗАДАНО ПОДРАЗДЕЛЕНИЕ'); _GOTO 6724 _);
  _for i := 0 _to g2073z - 1 _do _(
   l2v2z := 10 * i + 4;
  _if (sel(l2v4z@[l2v2z].i, 0, 21) = s.deptNum) _then _(
    g2081z := ptr(ord(l2v4z)+ l2v2z);
    EXIT;
  _)
 _);
 writeln('ПОДРАЗДЕЛЕНИЕ НЕ НАЙДЕНО');
 _GOTO 6724;
  _)
  _end
_);

_proced format(* 4157 *);
_var l2v1z:integer;
_(
 setup( false );
 _if _not s.hasVol _or _not s.hasZone _then _(  writeln('НЕТ РАБОТЫ'); EXIT _);
 write('РАЗМЕТИТЬ БОБ=', s.volNum:4, ' ЗОН=');
 wrOctal( s.zonBeg, (4) );
 write(minus:1 );
 wrOctal( s.zonEnd, (4) );
 writeLN;
 writeln('ДЕЛАТЬ ? <ДА,НЕТ>');
 BIND(' =-С {172');
 _if (input@ <> 'Д') _then  EXIT;
 _if (s.volNum <> 2060) _then _(  writeln('ЭТУ БОБИНУ НЕЛЬЗЯ'); EXIT _);
 L2544;
 pg32ptr@[0].a := kadry;
 _for l2v1z := s.zonBeg _to s.zonEnd _do _(
   enq52;
   wrPage( listA, s.volNum, l2v1z, false );
   deq52;
   L2320( 'ЗОНА=', l2v1z, (2) );
 _);
 stats( 10 );
 done;
 _);

_proced L4247(* 4247 *);
_type w10 = _array [1..10] _of word;
_var l2v1z, l2v2z, l2v3z, l2v4z:integer;
l2v5z, l2v6z:@page;
l2v7z:word;
l2v8z:boolean;
l2v9z, l2v10z:@w10;
_(
 l2v6z := ptr(ord(ref(listA)) + 4);
  _repeat
 l2v8z := true;
 _for l2v1z := (0) _to (g2073z - (2)) _do _(;
  l2v5z := ptr(10 * l2v1z + ord(l2v6z));
 l2v9z := ptr(ord(l2v5z));
 l2v10z := ptr(ord(l2v5z)+10);
 l2v7z := l2v9z@[1];
 l2v3z := ;
 l2v7z := l2v10z@[1];
 l2v4z := ;
 _if (l2v3z > l2v4z) _then _(
   l2v8z := false;
   _for l2v2z := (1) _to 10 _do _(
    l2v7z := l2v9z@[l2v2z];
    l2v9z@[l2v2z] := l2v10z@[l2v2z];
    l2v10z@[l2v2z] := l2v7z;
    _);
  _)
 _);
  _until l2v8z;code(ИА=ИА,)
_);

_proced L4320;
_label 4340;
_var l2v1z, l2v2z, l2v3z, l2v4z, l2v5z, l2v6z, l2v7z,l2v8z,l2v9z:integer;
l2v10z:boolean;
_(
  l2v10z := false;
  _if s.hasDept _then _(  L4101( (2) ); l2v10z := true; _goto 4340 _);
 (a) _for l2v2z := (0) _to g2073z - 1 _do _(
   g2081z := ptr(10 * l2v2z + ord(ref(listA)) + 4);
4340:
 _if (s.annex = (0)) _then _(
   l2v7z := (4);
   l2v8z := (7);
   l2v5z := (60);
   l2v9z := g2081z@[2].i;
  _) _else _(
   l2v7z := (8);
   l2v8z := 10;
   l2v5z := 10;
   l2v9z := g2081z@[3].i;
  _);

  g2075z := sel(l2v9z, 0, 16);
  (loop) _for l2v1z := l2v7z _to l2v8z _do _for l2v3z := 0 _to 3 _do _(
   l2v4z := 12 * l2v3z;
   g2076z := sel(g2081z@[l2v1z], l2v4z, 11);
  _if (g2076z = (0)) _then _exit loop;
  rdMyZone;
 _if (g2074z < l2v5z) _then  l2v6z := (0) _else  l2v6z := (1);
  l2v4z := (l2v4z + 11);
  ins(g2081z@[l2v1z].i, l2v6z,  l2v4z, 1);
  _);
  _if l2v10z _then _exit a;
  _);
  wrDB(true);
_);

(* Level 2 *) _proced catalog(* 5153 *);
_var l2v1z:alfa; l2v2z, l2v3z:@arr;
(* Level 3 *) _proced L4501(l3a1z:integer);
_var l3v1z:integer; l3v2z: @arr;
(* Level 4 *) _proced setLoc(l4a1z:integer);
_var l4v1z, l4v2z, l4v3z, l4v4z, l4v5z, l4v6z, l4v7z:integer;
_(
 l4v4z := (4);
 l4v5z := (7);
 l4v6z := s.zonBeg;
 l4v7z := s.zonEnd;
 _if (l4a1z = (2)) _then _(
 l4v4z := (8);
 l4v5z := 10;
 l4v6z := s.zonB2;
 l4v7z := s.zonE2;
  _);
 (loop) _for l4v1z := l4v4z _to l4v5z _do _for  l4v2z := (0) _to 3 _do _(
   l4v3z := 12 * l4v2z;
  _if (sel(g2081z@[l4v1z], l4v3z, 12) = (0)) _then _(
    ins(g2081z@[l4v1z], l4v6z, l4v3z, 12);
    l4v6z := (l4v6z + (1));
  _);
  _if (l4v6z > l4v7z) _then _exit loop;
 _);
 _if (l4v6z <= l4v7z) _then _(  writeln('В КТЛ НЕТ МЕСТА'); _GOTO 6724 _);
 _);

_( (* 4501 *)
  setup(* 3546 *)( false );
  _case l3a1z _of
  1: _(
 L4101( (1) );
 _if s.hasZone _then  setLoc( (1) );
  _if s.hasVol _then _( s.volNum := s.volNum; g2081z@[2] := ;  _);
 _if s.hasZ2 _then  setLoc( (2) );
 _if s.hasV2 _then _( s.volN2 := s.volN2; g2081z@[3] := ;  _);
 _if s.hasDept _then _( s.deptNum := s.deptNum; g2081z@[1] := ; g2073z := (g2073z + (1)); _)
 _else _( writeln('НЕ ЗАДАНО ПОДРАЗДЕЛЕНИЕ'); _GOTO 6724;  _)
  _);
  2: _(
  L4101( (2) );
 _if s.hasZone  _then  setLoc( (1) );
  _if s.hasVol _then _(  s.volNum := s.volNum; g2081z@[2] := ; _);
  _if s.hasZ2 _then  setLoc( (2) );
  _if s.hasV2 _then _(  s.volN2 := s.volN2; g2081z@[3] := ; _);
  _);
  3: _(
  L4101( (2) );
 _if _not s.hasZone & _not s.hasZ2 _then _(
 l3v2z := ptr((g2073z - 1) * 10 + ord(l2v2z));
 _for l3v1z := (1) _to 10  _do _(;
    g2081z@[l3v1z] := l3v2z@[l3v1z];
    l3v2z@[l3v1z].i := 0;
 _);
 g2073z := (g2073z - (1));
  _) _else _(
 _if s.hasZone _then _for l3v1z := (4) _to (7) _do  g2081z@[l3v1z].i := 0;
 _if s.hasZ2  _then _for l3v1z := (8) _to 10  _do  g2081z@[l3v1z].i := 0;
  _)

  _)
  _end;
  ins(l2v3z@[4].i, g2073z, 0, 7);
  l2v3z@[2].a := katalo;
  timestamp(l2v3z@[3].i);
  wrDB(true);
  _);

(* Level 3 *) _proced L4716(* 4716 *);
_label 4737;
_var l3v1z:integer; l3v2z:boolean;
(* Level 4 *) _proced L4643(* 4643 *)(l4a1z, l4a2z:integer);
_var l4v1z, l4v2z, l4v3z, l4v4z:integer;
_(
 _for l4v1z := l4a1z _to l4a2z _do _(
  _if g2081z@[l4v1z].i = 0  _then  EXIT;
  _for l4v2z := (0) _to 3 _do _(
    l4v3z := (12 * l4v2z);
  _if (l4a1z = (4)) _then _( write(sp:1); code(ИА=ИА,) _)
  _else _( write (star:1); code(ИА=ИА,) _);
    l4v4z := sel(g2081z@[l4v1z].i,  l4v3z, 11);
    _if (l4v4z <> (0)) _then wrOctal( l4v4z, (4) )
    _else _( write(sp:4); _)
  _)
 _);
_);

_(
 setup(false);
 _if s.hasDept _then _(
 L4101( (2) );
 l3v2z := true;
  _goto 4737;
  _) _else  l3v2z := false;
 _for l3v1z := (0) _to g2073z - (1) _do _(;
 g2081z := ptr((10 * l3v1z) + ord(l2v2z));
 4737:
  wrDept( g2081z@[1].i );
  write(sp:1);
  wrDec(* 2173 *)( sel(g2081z@[2].i, 0, 16) );
  write( star:2 );code(ИА=ИА,);
  wrDec(* 2173 *)( sel(g2081z@[3].i, 0, 16) );
 L4643(* 4643 *)( (4), (7) );
 L4643(* 4643 *)( (8), 10 );
 TTOUT(* 1430 *);
 _if  l3v2z  _then  EXIT;
 _);
 _);

_proced L4770(* 4770 *);
_label 5042;
_var l3v1z, l3v2z, l3v3z, l3v4z, l3v5z, l3v6z, l3v7z, l3v8z:integer;
l3v9z:@page;
_(
  writeln('НОМЕР НОВОЙ БОБИНЫ?');
 TTIN(* 1032 *)( (2) );
 l3v1z :=   getNum( 10 );
 _if l3v1z <> (0) _then _(
 l3v9z := ref(listA);
 rdDB;
 _for l3v4z := (0) _to g2073z - 1 _do _(
 l3v5z := ((10 * l3v4z) + (4));
 g2081z := ptr(ord(l3v9z) + l3v5z);
 l3v1z := l3v1z;
 g2081z@[2] := ;
 _);
ins(l3v9z@[3].i, g2073z, 0, 7);
l3v9z@[1].a := katalo;
timestamp(* 2453 *)( l3v9z@[2].i );
  wrDB(true);
 writeln('СДЕЛАНО');
_);
5042:
 writeln('НОМЕР СТАРОЙ ЗОНЫ?');
 TTIN(* 1032 *)( (2) );
 l3v3z :=   getNum( (8) );
 _if (l3v3z <> (0)) _then _(
 writeln('НОМЕР НОВОЙ ЗОНЫ?');
 TTIN(* 1032 *)( (2) );
 l3v2z :=   getNum( (8) );
 _if (l3v2z <> (0)) _then _(
l3v9z := ref(listA);
 rdDB(* 1333 *);
 _for l3v4z := (0) _to g2073z - 1 _do _(;
   l3v5z := ((10 * l3v4z) + (4));
   g2081z := ptr(ord(l3v9z) + l3v5z);
   _for l3v6z := (4) _to 7 _do_for l3v7z := (0) _to 3 _do _(
     l3v8z := (12 * l3v7z);
     _if sel(g2081z@[l3v6z], l3v8z, 12) = l3v3z _then
       ins(g2081z@[l3v6z].i, l3v2z, l3v8z, 12);
   _)
 _);
 ins(l3v9z@[3].i, g2073z, 0, 7);
 l3v9z@[1].a := katalo;
 timestamp(* 2453 *)( l3v9z@[2].i );
 wrDB(true);
 writeln('СДЕЛАНО');
 _goto 5042;
_)
_)
_);
_( (* 5153 *)
  stats(* 1446 *)( (8) );
 rdDB(* 1333 *);
 l2v3z := ref(listA);
 l2v2z := ptr(ord(l2v3z) + 4);
 _if (INP@ = etx) _or (INP@ = '&') _then_(
  write('ЧИСЛО ПОДР :', g2073z:3, sp:1); code(ИА=ИА,);
  L2473( l2v3z@[3].i );
  TTOUT(* 1430 *);
  EXIT;
 _);
 _if (getAlfa( l2v1z)) _then _select
  ('ФОР' = l2v1z):  L4501( (1) );
  ('ДОП' = l2v1z):  L4501( (2) );
  ('ИСК' = l2v1z):  L4501( 3 );
  ('ПЕР' = l2v1z):  L4770;
  ('УПО' = l2v1z): _( setup( false ); L4247;  L4320 _);
  ('ОЧИ' = l2v1z): _( L2544;  pg32ptr@[0].a := kadry; L2515; wrDB(false) _);
  ('ПОК' = l2v1z): _( L4716;  EXIT _);
  true: _( writeln('НЕ ЗАДАН РЕЖИМ'); EXIT _)
  _end _else _( writeln('НЕТ РЕЖИМА'); EXIT  _);
  done;
_);

_proced anketa;
_label 5313;
_var l2v1z, l2v2z, l2v3z:integer;
l2v4z:@arr;
l2v5z, l2v6z, l2v7z:integer;
l2v8z:boolean; l2v9z:integer;
l2v10z:@page;
_(
 stats( (7) );
 l2v10z := ref(listA);
 l2v4z := ptr(ord(l2v10z) + (4));
 l2v8z := false;
 g2077z := (0);
 setup( false );
 rdZPCH;
  _if s.hasDept _then _(  L4101( (2) ); l2v8z := true; _goto 5313 _);
 rdDB;
 _for l2v1z := (0) _to g2073z - 1 _do _(
 g2081z := ptr(10 * l2v1z + ord(l2v4z));
 g2077z := (0);
 5313:
 _if s.annex = 0 _then _(
 l2v6z := (4);
 l2v7z := (7);
  l2v9z := g2081z@[2].i;
  _) _else _(
 l2v6z := (8);
 l2v7z := 10;
  l2v9z := g2081z@[3].i;
  _);
  g2075z := sel(l2v9z, 0, 16);
  (a) _for l2v2z := l2v6z _to l2v7z _do _( _for l2v3z := (0) _to 3 _do _(
   l2v5z := (12 * l2v3z);
   g2076z := sel(g2081z@[l2v2z], l2v5z, 11);
  _if (g2076z = (0)) _then _exit a;
   rdMyZone;
  wrDept( g2081z@[1].i );
  ГГ( ' ЗОН=' );
  wrOctal( g2076z, (4) );
  ГГ( ' АНК=' );
  L2110( g2074z );
  L2473( pg32ptr@[2].i );
  TTOUT;
  _)
  _);
  _if l2v8z _then  EXIT;
 _);
 _);

 _proced sort(* 6134 *);
_var l2v1z, l2v2z, l2v3z, l2v4z, l2v5z, l2v6z, l2v7z, l2v8z, l2v9z, l2v10z:integer;
l2v11z:alfa;
l2v12z:integer;
l2v13z:_array [1..10] _of integer;
l2v23z, l2v24z:boolean;
_proced L5375(l3a1z:integer);
 _(
   writeln('УПОР  =', l2v24z:6, ' СДЕЛАНО ПРОХОДОВ: ', l3a1z:3 ); code(=ИА,);
_);

_proced L5411;
 _(
 writeln('ОШ.ТИП УПОР');
_GOTO 6724;
 _);
_function L5417(l3a1z:integer):integer;
_var l3v1z, l3v2z, l3v3z:integer;
_(
 _if (l3a1z > l2v9z) _then _(  L5417 := (0); EXIT _);
 l3v1z := (trunc(((((l3a1z) - (1))) / ((4)))) + l2v10z);
 l3v2z := (l3a1z - ((l3v1z - l2v10z) * (4)));
 l3v3z := ((l3v2z - (1)) * 12);
  L5417 := sel(l2v13z[l3v1z], l3v3z, 11);
 _);

_proced L5444(* 5444 *);
_var l3v1z, l3v2z, l3v3z:integer;
_(
 _for l3v1z := (1) _to l2v9z _do _(;
 g2076z :=   L5417( l3v1z );
 _if (g2076z = (0)) _then  EXIT;
 rdMyZone(* 1345 *);
 _if (g2074z = (0)) _then_(
 l3v3z := g2076z;
 L2515(* 2515 *);
 l3v2z := l2v9z;
 (a) _while (l3v2z >= l3v1z) _do _(
 _if (l3v2z = l3v1z) _then  EXIT;
 g2076z :=   L5417( l3v2z );
 _if (g2076z <> (0)) _then _(
 rdMyZone(* 1345 *);
 _if (g2074z > (0)) _then _(
  L2525(* 2525 *);
  wrMyDb;
  L2505(* 2505 *);
  g2076z := l3v3z;
  wrMyDb;
  _exit a
  _)
  _);
 l3v2z := (l3v2z - (1));
  _)
  _)
 _);
 _);

_proced L5603(* 5603 *);
_var l3v1z, l3v2z, l3v3z, l3v4z, l3v5z:integer;
l3v6z, l3v7z:@arr;
(* Level 4 *) _proced L5517(* 5517 *);
_label 5533;
_var l4v1z, l4v2z:integer;
l4v3z, l4v4z:char;
l4v5z:integer;
l4v6z:boolean;
  _(
 l4v6z := false;
 (loop) _for l4v5z := (1) _to 7 _do _(
    l4v1z := l3v6z@[l4v5z].i;
    l4v2z := l3v7z@[l4v5z].i;
    5533:
    _repeat
    (* l4v1z := l4v1z << 6; *)
    code(4CЧ3=СД/-6/,4ЗЧ3=,МР=);
    l4v3z := ;
    _until (l4v3z <> 'D');
    _repeat    
    (* l4v2z := l4v2z << 6 *);
    code(4CЧ4=СД/-6/,4ЗЧ4=,МР=);
    l4v4z := ;
    _until (l4v4z <> 'D');
    (q) _select
    (l4v3z = l4v4z): _if l4v3z <> '0' _then _goto 5533;
    (l4v3z > l4v4z): _( l4v6z := true; l2v24z := false; _exit loop _);
    true: EXIT
    _end;
 _);
 _if l4v6z  _then _for l4v5z := (1) _to 102 _do _(
    l4v1z := l3v6z@[l4v5z].i;
    l3v6z@[l4v5z] := l3v7z@[l4v5z];
    l3v7z@[l4v5z].i := l4v1z;
 _);    
_);

_( (* 5603 *)
 l3v2z := (64004B);
 l3v4z := ord(ref(listA)) + 4;
 _if l2v23z _then _(
 _for l3v1z := (l2v8z - (1)) _downto 1 _do _(
   l3v3z := ((102 * l3v1z) + l3v2z);
   l3v6z := ptr(l3v3z - 102);
   l3v7z := ptr(l3v3z);
   L5517(* 5517 *);
 _);
 l3v6z := ptr(((l2v7z - (1)) * 102) + l3v4z);
 l3v7z := ptr(l3v2z);
 L5517(* 5517 *);
  _);
 _for l3v1z := (l2v7z - (1)) _downto 1 _do _(;
 l3v5z := (102 * l3v1z);
 l3v6z := ptr((l3v4z + l3v5z) - 102);
 l3v7z := ptr(l3v4z + l3v5z);
 L5517(* 5517 *);
 _);
 _for l3v1z := (0) _to (l2v7z - (2)) _do _(;
 l3v5z := (102 * l3v1z);
 l3v6z := ptr(l3v4z + l3v5z);
 l3v7z := ptr((l3v4z + l3v5z) + 102);
 L5517(* 5517 *);
 _);
 _if l2v23z _then _(
 l3v6z := ptr(((l2v7z - (1)) * 102) + l3v4z);
 l3v7z := ptr(l3v2z);
 L5517(* 5517 *);
 _for l3v1z := (0) _to (l2v8z - (2)) _do _(;
 l3v3z := ((102 * l3v1z) + l3v2z);
 l3v6z := ptr(l3v3z);
 l3v7z := ptr(l3v3z + 102);
 L5517(* 5517 *);
 _);
  _)
_);
_proced L6026(* 6026 *);
_var l3v1z, l3v2z, l3v3z, l3v4z, l3v5z:integer;
l3v6z, l3v7z: @arr;
(* Level 4 *) _proced L5711(* 5711 *);
_label 5725,999;
_var l4v1z, l4v2z:integer;
l4v3z, l4v4z:char;
l4v5z:integer;
l4v6z:boolean;
_(
 l4v6z := false;
  _case l2v1z _of
  1: _(
  _for l4v5z := (1) _to 7 _do _(
  l4v1z := l3v6z@[l4v5z].i;
  l4v2z := l3v7z@[l4v5z].i;
  5725:
  _repeat
    code(4CЧ3=СД/-6/,4ЗЧ3=,МР=);
    l4v3z := ;
    _until (l4v3z <> 'D');
    _repeat    
    code(4CЧ4=СД/-6/,4ЗЧ4=,МР=);
    l4v4z := ;
    _until (l4v4z <> 'D');
    (q) _select
    (l4v3z = l4v4z): _if l4v3z <> '0' _then _goto 5725;
    (l4v3z > l4v4z): _( l4v6z := true; _goto 999 _);
    true: EXIT
    _end;
  _);
  _);
  2: _if L2033(l3v6z@[8].i) < L2033(l3v7z@[8].i) _then l4v6z := true;
  3: _(
    l4v5z := shift(l3v7z@[10].i, 40);
    _if (shift(l3v6z@[10].i, 40) > l4v5z) & (l4v5z <> (0)) _then  l4v6z := true;
  _)
  _end;
  999:
 _if l4v6z _then _(
 l2v24z := false;
 _for l4v5z := (1) _to 17 _do _(
  l4v1z := l3v6z@[l4v5z].i;
  l3v6z@[l4v5z] := l3v7z@[l4v5z];
  l3v7z@[l4v5z].i := l4v1z;
 _);
  _)
 _);
_( (* 6026 *)
 l3v2z := (64004B);
 l3v4z := ord(ref(listA)) + 4;
 _if l2v23z _then _(
 _for l3v1z := (l2v8z - (1)) _downto 1 _do _(
   l3v3z := ((17 * l3v1z) + l3v2z);
   l3v6z := ptr(l3v3z - 17);
   l3v7z := ptr(l3v3z);
   L5711(* 5711 *);
 _);
 l3v6z := ptr(((l2v7z - (1)) * 17) + l3v4z);
 l3v7z := ptr(l3v2z);
 L5711(* 5711 *);
  _);
 _for l3v1z := (l2v7z - (1)) _downto 1 _do _(;
 l3v5z := (17 * l3v1z);
 l3v6z := ptr((l3v4z + l3v5z) - 17);
 l3v7z := ptr(l3v4z + l3v5z);
 L5711(* 5711 *);
 _);
 _for l3v1z := (0) _to (l2v7z - (2)) _do _(;
 l3v5z := (17 * l3v1z);
 l3v6z := ptr(l3v4z + l3v5z);
 l3v7z := ptr((l3v4z + l3v5z) + 17);
 L5711(* 5711 *);
 _);
 _if l2v23z _then _(
 l3v6z := ptr(((l2v7z - (1)) * 17) + l3v4z);
 l3v7z := ptr(l3v2z);
 L5711(* 5711 *);
 _for l3v1z := (0) _to (l2v8z - (2)) _do _(;
 l3v3z := ((17 * l3v1z) + l3v2z);
 l3v6z := ptr(l3v3z);
 l3v7z := ptr(l3v3z + 17);
 L5711(* 5711 *);
 _);
  _);
_);  
_( (* 6134 *)
 stats(* 1446 *)( (9) );
 _if (INP@ = etx) _then _(
 L4101( (2) );
 _if (s.annex = (0)) _then _(
  l2v11z := g2081z@[2].a;
  l2v12z := g2081z@[4].i;
  _) _else _(
  l2v11z := g2081z@[3].a;
  l2v12z := g2081z@[8].i;
  _);
 g2075z := sel(l2v11z, 0, 16);
 g2076z := sel(l2v12z, 0, 11);
 rdMyZone(* 1345 *);
  L2473( pg32ptr@[3].i );
  l2v3z := sel(pg32ptr@[1].i, 7, 4);
 write(' ТИП УПОР :');
  _case l2v3z _of
  1: write('АЛФ');
  2: write('ЗАР');
  3: write('ДОЛ')
  _end;
 TTOUT(* 1430 *);
 EXIT;
  _);
  _if (getAlfa( l2v11z)) _then _select
  ('АЛФ' = l2v11z): l2v1z := (1);
  ('ЗАР' = l2v11z): l2v1z := (2);
  ('ДОЛ' = l2v11z): l2v1z := 3;
  true: L5411
  _end _else  L5411;
_if (s.annex = (1)) & (l2v1z <> (1)) _then  L5411;
 l2v2z :=   getNum( 10 );
  writeln('ЗАДАНО ПРОХОДОВ :', l2v2z:3);
  _if (l2v2z = (0)) _then  EXIT;
 setup( false );
 L4101( (2) );
 _if (s.annex = (0)) _then _(
 l2v9z := (16);
 l2v10z := (4);
 l2v11z := g2081z@[2].a;
  _) _else _(
 l2v9z := 12;
 l2v10z := (8);
 l2v11z := g2081z@[3].a;
  _);
  g2075z := sel(l2v11z, 0, 16);
  _for l2v3z := (1) _to 10 _do l2v13z[l2v3z] := g2081z@[l2v3z].i;
 L5444(* 5444 *);
 _for l2v3z := (1) _to l2v2z _do _(;
 l2v24z := true;
 l2v6z := (1);
 l2v4z :=   L5417( l2v6z );
 _if (l2v4z = (0)) _then  EXIT;
 g2076z := l2v4z;
 rdMyZone(* 1345 *);
 L2515(* 2515 *);
  l2v7z := sel(pg32ptr@[1], 0, 7);
 _if (l2v7z = (0)) _then  EXIT;
 l2v5z := l2v4z;
_repeat
 g2076z := l2v5z;
 l2v6z := (l2v6z + (1));
 l2v4z :=   L5417( l2v6z );
 l2v23z := false;
 l2v8z := (0);
 _if (l2v4z <> (0)) _then _(
 g2076z := l2v4z;
 rdMyZone(* 1345 *);
 g2076z := l2v5z;
  l2v8z := sel(pg32ptr@[1], 0, 7);
  _if (l2v8z > (0)) _then  l2v23z := true;
  _);
 _if (s.annex = (0)) _then L6026(* 6026 *) _else L5603(* 5603 *);
 _if l2v23z _then _(
 L2525(* 2525 *);
 l2v5z := l2v4z;
 l2v7z := l2v8z;
 _) _else L2505(* 2505 *);
  timestamp(* 2453 *)( pg32ptr@[3].i );
  ins(pg32ptr@[1].i, l2v1z, 7, 4);
 wrMyDb(* 1375 *);
  _until _not l2v23z;
 (q) _if l2v24z  _then _(  L4320; L5375( l2v3z ); EXIT _);
 _);
 L4320;
 L5375( l2v2z );  
_);

_proced save;
_var l2v1z:@page; l2v2z:integer;
_(
 l2v2z := (0);
 l2v1z := ref(s.sizeof);
 _for l2v2z := (1) _to s.sizeof _do pg32ptr@[l2v2z] := l2v1z@[l2v2z];
_);

 _proced restore;
_var l2v1z:@page; l2v2z:integer;
_(
 l2v2z := (0);
 l2v1z := ref(s.sizeof);
 _for l2v2z := (1) _to s.sizeof _do  l2v1z@[l2v2z] := pg32ptr@[l2v2z];
 _);

_proced L5764;
_var l2v1z, l2v2z:integer;
_(
 _if _not g2063z _then _(
 code(Э0634=,);
 l2v1z := ;
 l2v1z := (l2v1z - g2083z);
 _if _not (l2v1z >= (0)) _then  EXIT;
 code(Э05310=,);
 l2v2z := ;
 l2v2z := (l2v2z - begTime);
 _if _not (l2v2z >= (0)) _then  EXIT;
 g2085z := shift(l2v1z, 2);
 stats( (33) );
 (q) g2085z := shift(l2v2z, 9);
 stats( (36) );
  _)
_);

_proced exec(l2a1z:integer);
_var l2v1z:integer; l2v2z:sixchars;
F:text;
_procedure L6473(_var f:text; _var i:integer; j:integer); _( code(ПБ76022=,); _);
_(
 _if  g2062z _or g2063z _then _GOTO 7057;
 _if (l2a1z <> (5401553C)) _then _(
  _if (l2a1z <> (3400225C)) _then _(
   stats( 19 );
   writeln( ornament:18, ' ВЫ ВЫШЛИ ИЗ СЛУЖЕБНОГО БЛОКА ', ornament);
  _) _else writeln('{175');
  flags := flags + [2];
  save;
  _) _else  save;
 L5764;
_if (l2a1z = (3401751C))
 _or (l2a1z = (5401540C))
 _or (l2a1z = (3400225C)) _then _(
 L6473( INP, g2086z, 70B );
  _) _else _(
 rewrite(F);
 unpck(l2v2z[1],  cmd );
 _for l2v1z := (1) _to 3 _do _( F@ := l2v2z[(l2v1z + (3))]; put(F) _);
  F@ := sp; put(F);
 _while INP@ <> etx _do _( F@ := INP@; get(INP);  put(F) _);
  F@ := etx; put(F);
 reset(F);
 L6473( F, g2086z, 70B );
 _);
_);

_proced enter;
_procedure L6624(_var f:text; _var i:integer; j:integer); _( code(ПБ76021=,); _);
 _(
 L6624(INP, g2086z, 70B);
 reset(INP);
 restore;
 flags := flags - [2];
 _GOTO 6727;
_);

_proced checkAdmin(l2a1z:integer);
 _(
 _if _not (l2a1z _IN g2096z) _then _( writeln('ВАМ НЕЛЬЗЯ'); _GOTO 6724 _)
 _);

_(
 code(СЧ76233=,);
 g12z := ;
 pg32ptr := _nil;
 g2085z := (1);
 code(Э0634=,);
 g2083z := ;
 code(Э05310=,);
 begTime := ;
 s.sizeof := ord(ref(s.upto)) - ord(ref(s.sizeof));
 g2062z := false;
 g2063z := ;
 g2068z := -1;
 _if (g12z <> 'ТАМБОВ') _then _(
 initAnk;
 s.annex := (0);
 writeln('<*>  ОТЛАДКА  <*>');
 prnEnable := false;
 debug := true;
 dpyEnable := ;
 g2063z := ;
 curVol := (0);
  _) _else  enter;
 6724:
 timeout;
 TTIN( (1) );
 g2062z := false;
 6727:
 g2061z := false;
6730:
 _if (getAlfa( cmd)) _then _select
  ('КАД' = cmd) _or ('СПР' = cmd): _(  6737: checkAdmin( (1) ); exec( (5401540C) ) _);
  ('УСТ' = cmd):  setup( true );
  ('РАЗ' = cmd):  format;
  ('КАТ' = cmd):  catalog;
  ('АНК' = cmd):  anketa;
  ('УПО' = cmd):  sort;
  ('ВВО' = cmd) _or
  ('VVО' = cmd) _or
  ('СОN' = cmd) _or
  ('ЗАМ' = cmd) _or
  ('ЗАЧ' = cmd) _or
  ('ИСК' = cmd) _or
  ('ДАТ' = cmd): _(  flags := flags + [2]; exec( (5401553C) ) _);
  ('ПЕЧ' = cmd): modePrint;
  ('ЭКР' = cmd): modeScreen; 
  ('ВЦП' = cmd): CPUusage;
  ('ШКО' = cmd): _( stats(11); school _);
  ('ИНФ' = cmd): _( stats(12); manpage(00030241C) _);
  ('ПАР' = cmd): _( stats(13); manpage(06020754C) _);
  ('ДАЙ' = cmd): _(  g2061z := true; _goto 6730 _);
  ('КОН' = cmd): 7037:  exec( (3401751C) );
  ('ВЫХ' = cmd): _(
   _if g2063z _then _(
     writeln('<*>  ВОЗВРАТ  <*>');
     code(СЧ12=ЗЧ76135,ПБ76002=);
   _) _else _goto 7037;
  _);
  ('РАБ' = cmd): exec( (3400225C) );
  true: _if g2062z _then 7057: writeln('В БЛОКЕ НЕТ ТАКОГО ПРИКАЗА') _else _goto 6737
  _end
  _else (* 6535 *) writeln('НЕ ПОНИМАЮ');
 _if (INP@ = '&') _then _(  get(INP); _goto 6730 _);
 _goto 6724;
_).
