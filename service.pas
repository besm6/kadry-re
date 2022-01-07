(*=p-,t-,m-,l-*)
_program СЛУЖЕБ;
_label 6334,6340,6504,6525,6400, 6341;
_const z1 = 3401751B; z2=5401540B; z3=5401560B; z4=3400225B;
dbVol=2060;c112=112;c189=189;c190=190;c191=191;
pl='+';c146=146B;c2=2;c4=4;c7=7;c8=8;c16=16;
sl='/';gt='>';
c3=3;c5=5;c6=6;dot='.';c17=17;c9=9;minus='-';K='K';c20=20;
c34=34;c24=24;c27=27;c43=43;c48=48;comma=',';
c36=36;c40=40;eq='=';c46=46;c41=41;c38=38;c28=28;
c26=26;lt='<';star='*';c39=39;c44=44;c47=47;c37=37;
colon=':';semi=';';
c214=214;c232=232;c264=264;c296=296;c308=308;c510=510;
c800=800;c832=832;c914=914;c924=924;c934=934;c942=942;
val='ВАЛЕТ ';sh='Ш';etx='{377';
sp=' ';c81=81;spaces='      ';stars='******';ornament='-=#=- ';
kadry='!КАДРЫ';catalog='КАТАЛО';zonkd='!ЗОНКД';zonpch='!ЗОНПЧ';
c60=60;
_type letter='A'..'Z'; t6='0'..'D';digit='0'..'9';
pwrd = _record i: integer _end;
bitset=_set _of 0..47;
word=_record _case integer _of
0:(i:integer);
1:(b:bitset);
2:(a:alfa)
_end;
page= _array[0..1023] _of word;
sixchars=_array [1..6] _of char;
arr = _array [1..38] _of word;
_var cmd:alfa;
g11z:alfa;
g12z:alfa;
listA,listB:page;
allones:integer;
g2062z:bitset;
g2063z, g2064z,
ЗАПРЕТ:boolean;
debug:boolean;
g2067z:boolean;
g2068z, g2069z,
g2070z:boolean;
g2071z:boolean;
tokLen:integer;
tokPos, g2074z, tokRem:integer;
g2076z,myZlen:integer;
myDBVol,myDBZone, ankNum, g2081z:integer;
g2082z, g2083z, g2084z:integer;
g2085z, g2086z, g2087z:@arr;
pg32ptr:@page;
g2089z, begTime, g2091v:integer;
item:_array [1..17] _of integer;
g2109z, g2110z, g2111z, curVol: integer;
g2113z, g2114z, dpyEnable:boolean;
g2116z: integer;
g2117z, g2118z:integer;
g2119z, flags:bitset;
prnEnable:boolean;
g2122z:integer;
g2123z, g2124z, g2125v:integer;
g2125z:arr;
g2164z:bitset;
sizeof:integer;
 hasDept,
 hasAnk,
 hasFam,
 hasGiven,
 hasPatr,
 hasVol,
 hasZone,
 g2173z,
g2174z:boolean;
deptNum, ankBeg, ankEnd:integer;
g2178z, g2179z, g2180z:integer;
g2181z, g2182z, g2183z:integer;
famLen,  givLen, patLen: integer;
famStr:_array[1..24] _of char;
givStr:_array[1..16] _of char;
patStr:_array[1..16] _of char;
g2243z, annex, upto:integer;
g2246z:_record cmd: _array[0..25] _of alfa _end;
w6:_array [1..5] _of char;
token:_array[1..20] _of char;
INP:text;

_proced skipsp;
 _(
 _while _not (INP@ <> ' ') _do get(INP);
 _);

 _proced L0552;
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
   L0552
 _);  

_proced timeout;
_var i:integer;
_(
  _if debug _then EXIT;
 code(Э0634=,);
 i := ;
 _if g2116z - i < 50 _then _(
   rewrite(INP);
   writeln('ВАШЕ ВРЕМЯ ИСТЕКЛО');
   ЗАПРЕТ := false;
   write(INP, 'КОН  {377' );
  _GOTO 6504;
  _);
_);

_proced TTOUT;
_var r:alfa;
_(
  writeLN;
  timeout;
  code(СЧ77015=);
  r := ;
 _if r = 'Н{3770000' _then  _GOTO 6334;
_);

_proced fillToken;
 _(
 tokLen := (0);
   _while ((INP@ _in letter) | (INP@ = sp)) & (tokLen < 20) _do _(
    tokLen := (tokLen + (1));
   token[tokLen] := INP@;
   get(INP)
   _);
   g2074z := tokLen;
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

 _proced chkMagic;
 _(
 _if pg32ptr@[0].a <> kadry _then _(
   writeln('БАНК ИСПОРЧЕН');
   _GOTO 6334;
 _);
_);

_function mysel(l2a1z, l2a2z, l2a3z:integer):integer;
_var l2v1z:integer;
_(
  l2v1z := 77B - l2a2z;
  code(2АС6=СД/7/,МР=17ЗЧ,);
  l2v1z := 16;
  code(2АС5=СД/7/,МР=17ЗЧ,);
  code(2СЧ4=17СК,17СК=МР,);
 mysel := ;
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
     _GOTO 6334;
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
     _GOTO 6334;
   _)
 _);
 wrpg32(52B, zone );
_);

_proced rdDB;
 _(
   _if (listA[1].a <> catalog) _then
     rdPage( listA, dbVol, (112), true );
   g2076z :=   mysel( listA[3].i, (7), (1) );
 _);

 _proced rdMyZone;
 _(
 _if (myDBVol = (0)) _then _(
   writeln('НЕТ БАЗЫ');
   _GOTO 6334;
  _);
  rdPage( listA, myDBVol, myDBZone, false );
  myZlen :=   mysel( pg32ptr@[1].i, (7), (1) );
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
 wrPage( listA, myDBVol, myDBZone, false );
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

_proced L1270;
_var l2v1z, l2v2z:integer; l2v3v:char; l2v3z:sixchars;
_(
 rdpg32( 27B, (0) );
 rewrite(INP);
  _while _not (g2083z > 1024) _do _(;
 _if (g2083z = 1024) _then _(
   writeln('НЕТ КОНЦА АНКЕТ');
   g2071z := true;
   EXIT;
  _);
  unpck(l2v3z[1], pg32ptr@[g2083z].a);
  _for l2v1z := g2084z _to 6 _do _(
    l2v3v := l2v3z[l2v1z];
    INP@ := l2v3v;
    put(INP);
    _if (l2v3v = '/') _then _(
      _if (l2v1z < (6)) _then _(
        l2v3v := l2v3z[(l2v1z + (1))];
        g2084z := (l2v1z + (1));
      _) _else _(
        g2083z := (g2083z + (1));
        g2084z := (1);
  l2v2z :=   mysel(pg32ptr@[g2083z].i, (48), (41) );
        l2v3v := ;
      _);
      _if (l2v3v = '/') _then_(
        INP@ := '/';
        put(INP);
      _);
      INP@ := etx;
      put(INP);
      reset(INP);
      EXIT;
    _);
  _);
  g2083z := (g2083z + (1));
  g2084z := (1);
 _);
_);

_procedure TTIN(level:integer);
_label 1;
_var v1, v2: integer;
_(
  g2071z := false;
  _if g2067z _then L1270 _else _(
  _case level _of
  0: BIND;
  1: BIND(' ==С {172');
  2: BIND(' =-С {172')
  _end;
  _if prnEnable  _then _(
    code(СЧ76013=УИ7,);
    v1 := 2; code(ЗЧ76013=,);
    _case level _of 
      1: write(' ==С ');
      2: write(' =-С ')
    _end   
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
_);

_proced wrPacked(txt:integer);
_var i:integer; c: char;
_(
 c := 'D';
 i := (0);
 _while (c = 'D') & (i <= (8)) _do _(
   i := i + 1;
   code(2СЧ3=СД/-6/,2ЗЧ3=МР,);
   c := ; (q);
 _);
 _for i := i _to 8 _do _(;
   write(c:1);
   code(2СЧ3=СД/-6/,2ЗЧ3=МР,);
   c := ; (q);
 _);
_);

_function L1514(txt:integer;  l2a2z:char):integer;
_(
 _if (l2a2z >= 'D') _then _(
   writeln(l2a2z:1, ' ВВОДИТЬ НЕЛЬЗЯ');
   g2070z := true;
   EXIT;
   (q) _exit q; 
 _);
  code(2СЧ4=СД/-6/,2ЛС5=);
  L1514 := ;
_);

_function myins(l2a1z, l2a2z, l2a3z, l2a4z:integer):integer;
_var l2v1z, l2v2z:integer;
_(
 l2a4z := (l2a4z - (1));
 l2v2z := ((48) - l2a3z);
 l2v1z := (l2v2z + l2a4z);
  code(2СЧ11=7ПАINSMSK,7ЛС=СД/-51/,17ЗЧ=2ЗЧ11,2СЧ10=7ЛС,СД/-51/=7СР2,7ЦС1=17ЗЧ,2ЗЧ10=2СЧ5,);
  code(17СК=17СК,2СМ4=2СМ11,2СМ10=2СМ7,7ЛС=СД/-51/,2СМ4=17СК,17СК=17СК,17СР=17ЛС,7ПБ3=,);
  code(C;INSMSK:100,0020000000000000,7777777777777777,K;2ЗЧ3=)
_);

_proced stats(l2a1z:integer);
_var l2v1z, l2v2z, l2v3z:integer;
_(
 _if _not debug _then _(
  l2v1z := g2125z[l2a1z].i;
 l2v3z := ;
 l2v1z := (mysel( l2v3z, 18, 13) + g2091v);
  code(СД/6/=); l2v2z := ;
  code(МР=СД/-6/,МР=);  l2v1z := ;
  l2v3z :=   myins( l2v3z, l2v1z, 18, 13 );
 g2125z[l2a1z] := ;
    _if l2v2z > 0 _then _(
    g2091v := l2v2z;
    stats(l2a1z - 1);
    g2091v := 1;
  _);
 _if (l2a1z <= 21) & (l2a1z > (0)) _then  stats( (0) );
 _if (l2a1z <= 21) & (l2v1z = 62) _then _(
   writeln('ПРИКАЗЫ КОНЧИЛИСЬ');
   rewrite(INP);
   write(INP,'КОН {377');
   _GOTO 6504;
  _)
  _)
_);

 _proced initAnk;
 _(
 hasDept := false;
 hasAnk := ;
 hasFam := ;
 hasGiven := ;
 hasPatr := ;
 hasVol := ;
 hasZone := ;
 g2173z := ;
 g2174z := ;
 g2243z := 0;
 famLen := 0;
 givLen := ;
 patLen := ;
 _);
 _proced error;
 _(
 initAnk;
 g2069z := true;
 g2070z := ;
 _if (g2081z = (0)) _or (g11z = 'КЛЮЧ') _then _(
    ГГ(g11z); write('=<ОШИБКА>');
    TTOUT;
    g11z := '000000'
 _);
 _if _not (g2081z <> (0)) _then  _GOTO 6334;
 _);

_proced symErr(l2a1z:char);
 _(
   writeln('ОШИБКА ЗНАКА: ', l2a1z:1);
   g2070z := true;
   (q) exit
 _);

_function fieldNum(upto:integer):integer;
_var i:integer;
_(
 _for i := 0 _to upto _do 
  _if (g2246z.cmd[i] = g12z) _then _(
   fieldNum := i;
   EXIT;
 _);
 error;
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
   g2070z := true;
   _if g2067z _then  EXIT _else  _GOTO 6334;
 _);
 (*=m+*) l2v2z := (l2v2z * base) + ord(l2v1z);
 get(INP);
_);
 skipsp;
 getNum := l2v2z;
_);

_function getAlfa(_var a:alfa; len:integer):boolean;
_var u:sixchars; i:integer;
_(
 skipPrompt;
 i := 0;
 a := '000000';
 unpck( u[1], a);
 _while (INP@ _in letter) & (i < len) _do _(
    u[7 - len + i] := INP@;
    get(INP);
    i := i + 1;
 _);
 _while INP@ _in letter _do get(INP);
 skipsp;
 pck(u[1], a);
 getAlfa := i > 0;
 _);

_proced initCmd;
 _(
   g2246z := [
 '777', 'ФАМ', 'ИМЯ', 'ОТЧ', 'ПОЛ',
 'РОЖ', 'НАЦ', 'КПС', 'ВЛК', 'ПРО',
 'ОБР', 'СТЕ', 'ЗВА', 'СПЕ', 'СЕМ',
 'АДР', 'ТЕЛ', 'ЗАЧ', 'ПОВ', 'ПОД',
 'ДОЛ', 'ЗАР', 'СОС', 'ВОИ', 'СТР', 'БРО']
 _);

_function L2065(l2a1z:integer):integer;
_var l2v1z:boolean;
_(
 _if (g2081z <> (2)) _then _(
   _if (l2a1z >= 25) _then error _else L2065 := (l2a1z + (1))
  _) _else _(
 initCmd;
 l2v1z :=   getAlfa( g12z, (3) );
 g11z := 'КЛЮЧ';
 L2065 :=   fieldNum( 25 );
 g11z := '000000';
 _if (INP@ = eq) _then get(INP) _else symErr( '=' );
  _)
 _);

_function nyet:boolean;
_var a:alfa;
_(
  nyet := false;
 _if getAlfa(a, 1) & (a = 'Н') _then  nyet := true;
 _);

_function getDate:integer;
_label 2205;
_var l2v1z, l2v2z:integer;
_proced L2134;
 _(
   (a) _( skipsp;  _if (INP@ = '.') _then _( get(INP); _goto a _) _);
  _if _not (INP@ _in digit) _then _(
    l2v1z := (0);
    writeln('ОШИБКА В ДАТЕ');
    g2070z := true;
    _GOTO 2205;
   _)
 _);

_(
 L2134;
 l2v1z :=   getNum(10);
 L2134;
 l2v1z := ((  getNum(10) * (100)) + l2v1z);
 L2134;
 l2v2z :=   getNum( 10 );
 _if _not (l2v2z <= (100)) _then  l2v2z := (l2v2z _MOD (100));
 l2v1z := ((l2v2z * (10000)) + l2v1z);
 2205:
 getDate := l2v1z;
_);

_function L2207:integer;
_var l2v1z:integer;
_(
 _if nyet _then  l2v1z := (0) _else _(
 l2v1z :=   getNum( 10 );
 _if _not (l2v1z <= (100)) _then  l2v1z := (l2v1z _MOD (100));
 _if _not (l2v1z <= (100)) _then  g2070z := true;
  _);
  L2207 := l2v1z;
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

_function L2332:integer;
 _(
 L2332 :=   findToken( (2) );
 _);

_function L2337:integer;
 _(
 L2337 :=   findToken( 10 );
 _);

_function L2344:integer;
 _(
 L2344 :=   findToken( (934) );
 _);

 _function L2351:integer;
 _(
 L2351 :=   findToken( (214) );
 _);

_function L2356:integer;
 _(
 L2356 :=   findToken( (232) );
 _);

_function L2363:integer;
 _(
 L2363 :=   findToken( (264) );
 _);

_function L2370:integer;
 _(
 L2370 :=   findToken( (296) );
 _);

_function L2375:integer;
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
 L2375 := l2v1z;
 _);

_function L2433:integer;
 _(
 L2433 :=   findToken( (510) );
 _);

_function L2440:integer;
 _(
 L2440 :=   findToken( (800) );
 _);

_function L2445:integer;
 _(
 L2445 :=   findToken( (832) );
 _);

_function L2452:integer;
 _(
 L2452 :=   findToken( (914) );
 _);

_function L2457:integer;
 _(
 L2457 :=   findToken( (924) );
 _);

_function L2464:integer;
 _(
 _if nyet  _then  L2464 := (0) _else  L2464 :=   getNum( 10 );
 _);

_function L2475:integer;
_var l2v1z, l2v2z:integer; l2v3z:alfa;
_(
 l2v1z := (0);
 _if nyet  _then  l2v2z := (0) _else _(
   l2v2z :=   getDate;
   _if (getAlfa( l2v3z, (1)) ) _then _(
    _select
      (l2v3z = 'Д'): l2v1z := (1);
      (l2v3z = 'О') _or (l2v3z = 'З'): l2v1z := (2);
      true:  g2070z := true
    _end
   _);
 _);
 l2v2z := ((l2v2z * (4)) + l2v1z);
 L2475 := l2v2z;
_);

_function L2533:integer;
_var l2v1z, l2v2z, l2v3z:integer; l2v4z: alfa;
_(
 l2v1z := (0);
 l2v2z := ;
 _if (getAlfa( l2v4z, (1))) _then _(
 _select
  (l2v4z = 'P'): _(
    l2v2z := (getNum(10) * (4));
    _if (getAlfa( l2v4z, (1))) & (l2v4z = 'Т') _then  l2v1z := (4);
  _);
  (l2v4z = 'Т'): l2v1z := (4);
  true: g2070z := true
  _end;
  _);
 l2v3z :=   getNum( 10 );
 _if (INP@ = '.') _then _(
 _if (l2v1z <> (4)) _then  g2070z := true
  _else _(
    get(INP);
    l2v3z := ((l2v3z * 10) +   getNum(10) ) _)
  _) _else _(
   _if _not (l2v1z <> (4)) _then  g2070z := true;
  _);
 l2v3z := (l2v3z * (512));
 _if (l2v3z = (0)) _then  g2070z := true;
 _select
  (INP@ = chr(28)): _(
   get(INP);
   l2v2z := (l2v2z + (1));
   _if _not (l2v1z <> (0)) _then  l2v1z := (1);
  _);
  (INP@ = '+'): _(
   get(INP);
   l2v3z := (getNum(10) + l2v3z);
   _if (INP@ = chr(86)) _then _(
     get(INP);
     _if  (l2v1z = (0)) _then  l2v1z := (3);
    _) _else _if (l2v1z <> (0)) _then  g2070z := true _else  l2v1z := (2);
    skipsp;
    _if (INP@ = chr(28)) _then _(
       get(INP);
       l2v2z := (l2v2z + (1));
    _)
  _);
  ord(INP@) _IN g2062z: _(
    _if _not (l2v1z <> (0)) _then  l2v1z := (1);
  _);
  true:  g2070z := true
  _end;
 L2533 := ((((l2v2z * (8)) + l2v1z) * 10000000B) + l2v3z);
 _);

_function L2700(l2a1z, l2a2z, l2a3z:integer):integer;
_(
  L2700 :=   mysel(g2085z@[l2a1z].i, l2a2z, l2a3z );
_);

 (*=m-*)

_function find:boolean;
_label 3053;
_var l2v1z:integer;
 _proced compare(start, last, len:integer);
_var l3v1z:integer;
l3v2z, l3v3z:char;
cur, k, i, l3v7z:integer;
_(
 k := (0);
 _for cur := start _to last _do _(
   _if annex = 0 _then 
  l3v1z := g2085z@[cur].i
   _else
  l3v1z := g2087z@[cur].i;
   l3v1z := l3v1z;
   l3v7z := ;
 _if l3v7z = allones _then  _GOTO 3053;
 i := 0;
 (loop) _(
  (* l3v1z := l3v1z << 6; YTA *);
  code(3СЧ6=СД/-6/,3ЗЧ6=МР,);
  l3v2z := ;
  i := i + 1;
  _if (l3v2z = 'D') _then _goto loop;
  k := (k + (1));
  len := (len - (1));
  _case start _of
  1: l3v3z := famStr[k];
  4: l3v3z := givStr[k];
  6: l3v3z := patStr[k]
  _end;
 _if l3v2z <> l3v3z _then  _GOTO 3053;
 _if len <= 0 _then  EXIT;
  _if i < 8 _then _goto loop;
 _);
 _);
_);

_( (* find *)
  find := false;
 _if (annex = (0)) _then _(
   l2v1z :=   L2700( 12, 21, (1) );
 _if (hasDept) _then _(
   _if _not (l2v1z = deptNum) _then  EXIT;
  _) _else _(
   l2v1z := l2v1z;
   g12z := ;
  _if _not (g12z = g2086z@[1].a) _then  EXIT;
  _);
  _);
 _if (hasFam) _then  compare( (1), (3), famLen );
 _if (hasGiven) _then  compare( (4), (5), givLen );
 _if (hasPatr) _then  compare( (6), (7), patLen );
 _if hasZone _then _if ((myDBZone < g2179z) _or (myDBZone > g2180z)) _then EXIT;
 _if hasAnk _then _if ((ankNum < ankBeg) _or (ankNum > ankEnd)) _then EXIT;
  find := true;
  3053:;
_);

_function today:integer;
_var l2v1z:integer;
_(
 code(Э050114=,);
 l2v1z := ;
 today := (((((((((((shift(l2v1z,16) _mod 16) * 10) + (shift(l2v1z,20) _mod 16)) * 10) +
  (shift(l2v1z, 28) _mod 2)) * 10) + (shift(l2v1z, 24) _mod 16)) * 10) +
  (shift(l2v1z, 33) _mod 4)) * 10) + (shift(l2v1z, 29) _mod 16));
 _);
(*=m+*)
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
  _for i := 7 - len _to 6 _do _( write(b[i]:1); (q) _exit q; _)
_);

_proced L3156(off2, off1:integer);
_var i, j:integer; a:alfa; u:sixchars;
_(
 rdZPCH;
 _for i := 1 _to 2  _do _(;
   a := listB[2 * off2 + off1 + i + 1].a;
   _if (a <> stars) _then _(
     unpck(u[1],  a );
     _for j := 1 _to 6 _do _(
       _if (u[j] <> '*') _then (q) write(u[j]:1);
     _)
   _);
 _);
_);

_proced wrDept(l2a1z:integer);
_var l2v1z, l2v2z, l2v3z:integer;
_(
 l2v1z :=   mysel( l2a1z, 21, (15) );
 l2v2z :=   mysel( l2a1z, 14, (8) );
 l2v3z :=   mysel( l2a1z, (7), (1) );
 L3156( l2v1z, (308) );
 _if (l2v2z <> (0)) _then  write(l2v2z:3 );
  _if (l2v3z <> (0)) _then write( minus:1, l2v3z:2 );
_);

_proced timeStamp(_var l2a1z:integer);
_var l2v1z:integer;
_(
 l2v1z :=   today;
 l2a1z :=   myins( l2a1z, l2v1z, 24, (1) );
 code(Э05310=,);
 l2v1z := ;
 l2a1z :=   myins( l2a1z, l2v1z, (48), 25 );
_);

_proced L3271;
_var l2v1z, l2v2z, l2v3z, l2v4z, l2v5z, l2v6z, l2v7z:integer;
_(
 _if (annex = (0)) _then _(
   l2v6z := (4);
   l2v7z := (7);
   l2v4z := (60);
  _) _else _(
   l2v6z := (8);
   l2v7z := 10;
   l2v4z := 10;
  _);
 _if (myZlen < l2v4z) _then l2v5z := (0) _else  l2v5z := (1);
 _for l2v1z := l2v6z _to l2v7z _do _for l2v2z := (0) _to 3 _do _(
   l2v3z := ((12 * l2v2z) + (1));
   _if (mysel( g2086z@[l2v1z].i, (l2v3z + 10), l2v3z) = myDBZone) _then _(
     g2086z@[l2v1z].i := myins( g2086z@[l2v1z].i, l2v5z, (l2v3z + 11), (l2v3z + 11));
     EXIT;
   _)
 _);
_);

_proced done;
 _(
   writeln('СДЕЛАНО');
 _);

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
    _GOTO 6334;
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
 hasFam := true;
 famStr[i] := c;
 famLen := famLen + 1;
  _);
  (what = 2): _(
 hasGiven := true;
 givStr[i] := c;
 givLen := givLen + 1;
  _);
  (what = 3): _(
 hasPatr := true;
 patStr[i] := c;
 patLen := patLen + 1;
_)
  _end
_);
_);

_proced L3511;
_var l3v1z:integer;
 _proced wrName(what, len:integer);
_var i:integer; c:char;
_(
  write( sp:1 );
 _for i := 1 _to len _do _(;
    _case what _of
    1: c := famStr[i];
    2: c := givStr[i];
    3: c := patStr[i]
    _end;
    write( c:1 );
  (q) _exit q;
 _);
 writeLN;
_);

  _( (* L3511 *)
 _if hasDept _then _(
   write(' ПОД = ');
   deptNum := deptNum;
   l3v1z := ;
   wrDept( l3v1z );
   writeLN;
 _);
    _if hasFam _then _(  write(' ФАМ ='); wrName( (1), famLen ) _);
    _if hasGiven _then _(  write(' ИМЯ ='); wrName( (2), givLen ) _);
    _if hasPatr _then _(  write(' ОТЧ ='); wrName( (3), patLen ) _);
    _if hasAnk _then _(  write(' АНК = '); wrDec( ankBeg );
      _if (ankEnd <> ankBeg) _then _( write(minus:1); wrDec( ankEnd ) _);
      writeLN;
    _);
 _if hasVol _then _(  write(' БОБ = '); wrDec( g2178z ); writeLN _);
 _if hasZone _then _(  write(' ЗОН = '); wrOctal( g2179z, (4) );
    _if (g2180z <> g2179z) _then _(  write(minus:1 ); wrOctal( g2180z, (4) ) _);
    writeLN;
  _);
 _if g2173z _then _(  write('*БОБ = '); wrDec( g2181z ); writeLN _);
 _if g2174z _then _(  write('*ЗОН = '); wrOctal( g2182z, (4) );
   _if g2183z <> g2182z _then _( write(minus:1 ); wrOctal( g2183z, (4) ) _);
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
 _if getAlfa( g11z, (3))  _then _(
 _if (g11z <> 'ПОК') _and _not (g11z = 'СБР') _then  needEq;
 _select
  ('БОБ' = g11z): _(
   l2v1z :=   getNum( 10 );
   _if l2v4z _then _(  g2181z := l2v1z; g2173z := true _)
   _else _( g2178z := l2v1z; hasVol := true; _)
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
  _if l2v4z _then _(  g2182z := l2v2z; g2183z := l2v3z; g2174z := true _)
  _else _( g2179z := l2v2z; g2180z := l2v3z; hasZone := true _)
  _);
  ('ПОД' = g11z): _(  deptNum :=   L2375; hasDept := true _);
  ('БАЗ' = g11z): _(
   _if (getAlfa( l2v6z, (3))) _then _select
     ('ДОП' = l2v6z): annex := (1);
     ('РЕЗ' = l2v6z): annex := (0);
     true: error
  _end _else  error;
  _);
  ('АНК' = g11z): _(
  _if (getAlfa( l2v6z, (3))) _then _(
   _if (l2v6z = 'ВСЕ') _then  hasAnk := false _else error;
  _) _else _(
   ankBeg :=   getNum( 10 );
   ankEnd := ;
  _if (INP@ = '-') _then _(
    get(INP);
    ankEnd :=   getNum(10 );
   _if ankEnd < ankBeg _then  error;
  _);
  hasAnk := true;
  _)
  _);
  ('ФИО' = g11z): _(
 famLen := (0);
 givLen := ;
 patLen := ;
 getName( (0) );
 getName( (2) );
 getName( (3) );
  _);
  ('ФАМ' = g11z): _(  famLen := (0); getName( (1) ) _);
  ('ИМЯ' = g11z): _(  givLen := (0); getName( (2) ) _);
  ('ОТЧ' = g11z): _(  patLen := (0); getName( (3) ) _);
  ('ПОК' = g11z): _(  4064:
   l2v5z := false;
   write(' БАЗА =');
   _if (annex = (0)) _then write(' РЕЗИДЕНТНАЯ')
   _else write(' ДОПОЛНИТЕЛЬНАЯ');
    writeLN;
    _if _not (g2243z <> (1)) _then  L3511;
  _);
  ('СБР' = g11z): _(
   l2v5z := false;
   initAnk;
   writeln('УСТАНОВКИ СБРОШЕНЫ');
  _);
  true: _(
   writeln('ОШИБКА ПАРАМЕТРА');
   initAnk;
   _GOTO 6334;
  _)
  _end;(* 4117 *)
  _if (g11z <> 'ПОК') & (g11z <> 'СБР') & _not (g11z = 'БАЗ') _then  g2243z := (1);
  _) _else _( (* 4126 *)
   writeln('НЕВЕРНЫЙ ПАРАМЕТР');
   initAnk;
   _GOTO 6334;
  _); (* 4134 *)
  _select
  (INP@ = ','): _(  get(INP); _goto 3641 _);
  (INP@ = etx): _( _if l2a1z & l2v5z _then  done _);
  (INP@ = '&'):;
  true: _(  writeln('ОШИБКА ЗНАКА'); initAnk; _GOTO 6334 _)
  _end;
 stats( (2) );
_);

_proced wr7pck;
_var i:integer;
_(
 _for i := 1 _to 7 _do _(
   wrPacked(g2085z@[i].i);
  _if (i = 3)_or (i = 5) _then write( sp:1 ); (q) _exit q;
 _);
 writeLN;
_);

_proced L4207(l2a1z:integer);
_var i, l2v2z, l2v3z:integer;
l2v4z:@page;
_(
 l2v4z := ref(listA);
 rdDB;
 g2069z := false;
 _case l2a1z _of 
1: g2086z := ref(l2v4z@[4 + 10 * g2076z]);
2: _(
 _if _not hasDept _then writeln('НЕ ЗАДАНО ПОДРАЗДЕЛЕНИЕ')
 _else _(
 _for i := 0 _to g2076z - 1 _do _(
   l2v2z := 10 * i + 4;
  _if (mysel(l2v4z@[l2v2z].i, 21, (1)) = deptNum) _then _(
    g2086z := ref(l2v4z@[l2v2z]);
    EXIT;
  _)
 _);
 write('ПОДРАЗДЕЛЕНИЕ=');
 deptNum := deptNum;
 l2v3z := ;
 wrDept( l2v3z );
 write(' НЕ СУЩЕСТВУЕТ');
 TTOUT;
  _);
 g2069z := true;
 _if _not g2067z _then  _GOTO 6334;
  _)
  _end
_);

_proced L4273(l2a1z:integer);
_var l2v1z, l2v2z, l2v3z, i:integer;
l2v5z:@page;
l2v6z, l2v7z, l2v8z, l2v9z, l2v10z:integer;
_(
 L4207( (2) );
 _if g2069z _then  EXIT;
 l2v5z := ptr(64004B);
 ankNum := (0);
  _if (annex = (0)) _then _(  l2v6z := (4); l2v7z := (7); l2v10z := g2086z@[2].i _)
  _else _( l2v6z := (8); l2v7z := 10; l2v10z := g2086z@[3].i _);
 myDBVol :=   mysel( l2v10z, (16), (1) );
_case l2a1z _of
  1: _(
 _for l2v1z := l2v6z _to l2v7z _do _for l2v2z := (0) _to 3 _do _(
   l2v3z := ((12 * l2v2z) + (1));
   myDBZone :=   mysel(g2086z@[l2v1z].i, (l2v3z + 11), l2v3z );
   l2v8z := trunc(myDBZone / 2048);
   myDBZone := (myDBZone _MOD (2048));
   _if (myDBZone = (0)) _then _(
     writeln('НЕТ МЕСТА В БАЗЕ');
     write('ПОД=');
     deptNum := deptNum;
     l2v9z := ;
     wrDept( l2v9z );
     TTOUT;
     _GOTO 6334;
   _);
   _if (l2v8z = (0)) _then _(
   rdMyZone;
   _if (annex = (0)) _then _(
    _if (myZlen < (60)) _then _(  g2085z := ref(l2v5z@[17 * myZlen]); EXIT _);
  _) _else _(
    _if (myZlen < 10) _then _(  g2087z := ref(l2v5z@[102 * myZlen]); EXIT _);
  _)
  _);
  _)
  _); (* 4410 *)
  2: _(
   _if _not hasFam & _not hasGiven & _not hasPatr & _not hasAnk _then _(
     writeln('НЕ ЗАДАНА АНКЕТА');
     _GOTO 6334
   _);
  (a) _for l2v1z := l2v6z _to l2v7z _do  _for l2v2z := (0) _to 3 _do _(
     l2v3z := ((12 * l2v2z) + (1));
     myDBZone :=   mysel(g2086z@[l2v1z].i, (l2v3z + 10), l2v3z );
     _if (myDBZone = (0)) _then _exit a;
     rdMyZone;
    _if (annex = (0)) _then _(
      _for i := (0) _to myZlen - 1_do _(
        ankNum := (ankNum + (1));
        g2085z := ref(l2v5z@[17 * i]);
        _if find _then _(  wr7pck; EXIT _);
      _)
    _) _else _(
    _for i := (0) _to myZlen - 1 _do _(
      ankNum := (ankNum + (1));
      g2087z := ref(l2v5z@[102 * i]);
      _if find  _then  EXIT;
    _)
  _)
 _);
 writeln('НЕТ ТАКОГО');
 _GOTO 6334;

  _)
  _end
_);

_proced L4656(l2a1z:integer);
_var l2v1z:integer; 
 _proced L4521(l3a1z, l3a2z:integer);
_var l3v1z, l3v2z, l3v3z, l3v4z:integer;
l3v5z:char;
_(
 _for l3v1z := l3a1z _to l3a2z _do _(
   allones := allones;
   l3v4z := ;
  _if (g2081z = (2)) _then g2085z@[l3v1z].i := l3v4z
  _else item[l3v1z] := l3v4z;
 _);
 l3v1z := l3a1z;
 l3v2z := (0);
 l3v3z := ;
 _while (INP@ <> '=') & (INP@ <> ',') & (INP@ <> '/') & (INP@ <> etx) _do _(;
 l3v5z := INP@;
 get(INP);
 l3v3z := (l3v3z + (1));
 l3v2z := (l3v2z + (1));
 _if (l3v3z > (((l3a2z - l3a1z) + (1)) * (8))) _then _(  g2070z := true; EXIT _);
 _if (l3v2z > (8)) _then_(  l3v1z := (l3v1z + (1)); l3v2z := (1) _);
 _if (l3v1z > l3a2z) _then _(  g2070z := true; EXIT _);
  _if (g2081z = (2)) _then g2085z@[l3v1z].i :=  L1514( g2085z@[l3v1z].i, l3v5z)
 _else item[l3v1z] :=   L1514( item[l3v1z], l3v5z );
 _if g2070z _then  EXIT;
 _);
 _);

_proced L4625(l3a1z, l3a2z, l3a3z:integer);
 _(
 _if g2070z  _then  EXIT;
   _if (g2081z = (2)) _then g2085z@[l3a1z].i := myins( g2085z@[l3a1z].i, l2v1z, l3a2z, l3a3z )
_else  item[l3a1z] :=   myins( item[l3a1z], l2v1z, l3a2z, l3a3z );
 _);

_( (* 4656 *)
  skipsp;
  _case l2a1z _of
  1: L4521( (1), (3) );
  2: L4521( (4), (5) );
  3: L4521( (6), (7) );
  4: _( l2v1z :=   L2332; L4625( (9), 42, (41) ) _);
  5: _( l2v1z :=   getDate; L4625( 10, (20), (1) ) _);
  6: _( l2v1z :=   L2337; L4625( (9), (34), 29 ) _);
  7: _( l2v1z :=   L2207; L4625( (9), (8), (1) ) _);
  8: _( l2v1z :=   L2207; L4625( (9), (16), (9) ) _);
  9: _( l2v1z :=   L2344; L4625( (9), 24, (17) ) _);
  10:_( l2v1z :=   L2351; L4625( (9), 27, 25 ) _);
  11:_( l2v1z :=   L2356; L4625( (8), (43), (39) ) _);
  12:_( l2v1z :=   L2363; L4625( (8), (48), (44) ) _);
  13:_( l2v1z :=   L2464; L4625( 11, 13, (1) ) _);
  14:_( l2v1z :=   L2370;
        l2v1z := ((l2v1z * (16)) +   getNum(10) );
        L4625( (9), (48), (43) ) _);
  15: L4521( 14, (17) );
  16:_( l2v1z :=   L2464; L4625( 11, (36), 14 ) _);
  17:_( l2v1z :=   getDate; L4625( 10, (40), 21 ) _);
  18:_( l2v1z :=   L2475; L4625( 12, (48), 27 ) _);
  19:_( deptNum :=   L2375; l2v1z := ; L4625( 12, 21, (1) );
        _if _not g2070z _then  hasDept := true _);
  20:_( l2v1z :=   L2433; L4625( 10, (48), (41) );
        l2v1z :=   getNum( 10 ); L4625(8, 38, 31) _);
  21:_( l2v1z :=   L2533; L4625( (8), 30, (1) ) _);
  22:_( l2v1z :=   L2440; L4625( 11, (46), (44) );
  _if (l2v1z <= (1)) _then _(
  L4625( 11, (41), (37) );
  L4625( 11, (43), 42 );
  L4625( 11, (48), (47) ); _) _);
  23:_( l2v1z :=   L2445; L4625( 11, (41), (37) ) _);
  24:_( l2v1z :=   L2452; L4625( 11, (43), 42 ) _);
  25:_( l2v1z :=   L2457; L4625( 11, (48), (47) ) _)
  _end;
  _if (INP@ <> ',') & _not (INP@ = '/') _then  g2070z := true;
  _if (INP@ = ',') _then  get(INP);
  _if (g2070z) _then _(  initCmd; ГГ( g2246z.cmd[l2a1z] ); write('=<ОШИБКА>'); TTOUT _);
_);

_proced inpAnk(l2a1z:integer);
_label 5311;
_var l2v1z, l2v2z, l2v3z, l2v4z:integer; l2v5z :char;
_proced L5213;
 _(
 _if g2067z  _then _(
   write(l2v2z:2, dot:1 ); (q) _exit q;
   reset(INP);
   _while _not (INP@ = etx) _do _( write( INP@:1 ); get(INP); _);
   TTOUT;
   _if (g2081z = (4)) _then _( write('АНКЕТА НЕ ВВЕДЕНА'); TTOUT _);
   _GOTO 5311;
 _) _else _(
   write('АНКЕТА НЕ ');
   _if (g2081z = (1)) _then  write('ВВЕДЕНА') _else  write('ИСПРАВЛЕНА');
   TTOUT;
   _GOTO 6334;
 _)
_);

_proced report;
 _(
 _if (g2081z = (1)) _then writeln('АНКЕТА ВВЕДЕНА')
 _else _if (g2081z = (2)) _then writeln('АНКЕТА ИСПРАВЛЕНА');
_);

_( (* inpAnk *)
  rdZKD;
 g2081z := l2a1z;
 l2v2z := (0);
 l2v3z := ;
  _if (g2081z = (2)) _then _(  L4273( (2) ); _if g2069z _then  EXIT; _);
5311:
  l2v2z := (l2v2z + (1));
 _if (INP@ = etx) _or g2067z _then  TTIN( (2) );
 _if  (g2081z <> (2)) _then  hasDept := false;
 _if g2071z _then  EXIT;
 skipPrompt;
 _for l2v1z := (1) _to 17 _do item[l2v1z] := (0);
 l2v4z := (0);
 g2070z := false;
_while _not (INP@ = '/') & (INP@ <> etx) _do _(
 l2v4z :=   L2065( l2v4z );
 _if g2070z  _then  L5213;
 L4656( l2v4z );
 _if g2070z  _then  L5213;
 _);
 _if (INP@ <> '/') _then _(  symErr( '/' ); L5213 _) _else get(INP);
 _if (g2081z <> (2)) _then _( L4273( (1) ); _if g2069z _then  L5213  _);
 _if (g2081z <> (3)) _then _(
 _if (g2081z _IN [1,4]) _then _(
   _for l2v1z := (1) _to 17 _do g2085z@[l2v1z].i := item[l2v1z];
   myZlen := (myZlen + (1));
  pg32ptr@[1].i :=   myins( pg32ptr@[1].i, myZlen, (7), (1) );
  _);
  timeStamp( pg32ptr@[2].i );
 wrmyDB;
 report;
 l2v3z := (l2v3z + (1));
 _if (myZlen = (60)) _then _(  L3271; wrDB( true ) _);
  _);
 l2v5z := INP@;
 _select
  (l2v5z = '/'): _(
  _if (g2081z = (4)) _then  writeln('ВВЕДЕНО АНКЕТ:', l2v3z:3 );
  get(INP);
  _);
  (l2v5z = etx): _if (g2081z <> (2)) _then _goto 5311;
  (l2v5z = '&'):;
  true: _( symErr( l2v5z ); _if (g2081z <> (2)) _then _goto 5311 _)
_end
_);

_proced convvo(mode:integer);
_var start, last, cur:integer;
_(
 start :=   getNum( (8) );
 last := ;
  _if (INP@ = '-') _then _( get(INP); last :=   getNum( (8) ); _);
 _if (mode = (3)) _then  write('КОНТРОЛЬ')
 _else write('ВВОД');
 write(' ЗОН='); wrOctal( start, (4) );  write(minus:1 ); wrOctal( last, (4) );
 TTOUT;
 writeln('ПОДТВЕРДИТЕ <ДА,НЕТ>');
 TTIN( (2) );
 _if INP@ <> 'Д' _then  _GOTO 6334;
 g2067z := true;
 _for cur := start _to last _do _(;
 rdpg32( 30B, cur );
 wrpg32( 27B, 0 );
 write(spaces, 'ЗОН='); wrOctal( cur, (4) );
 TTOUT;
 g2083z := (0);
 g2084z := (1);
 inpAnk( mode );
 _);
_);

_proced erase;
_var l2v1z:integer; l2v2z:integer; l2v3z:@arr;
_(
 setup( false );
 L4273( (2) );
 _if (annex = (0)) _then  l2v2z := 17 _else l2v2z := 102;
 l2v3z := ptr(((myZlen - (1)) * l2v2z) + (26628));
 _if (annex = (0)) _then_(
   _for l2v1z := (1) _to (17) _do _(
  g2085z@[l2v1z] := l2v3z@[l2v1z];
  l2v3z@[l2v1z].i := 0;
 _);
  _) _else _(
   _for l2v1z := (1) _to  102 _do _(;
    g2087z@[l2v1z] := l2v3z@[l2v1z];
    l2v3z@[l2v1z].i := 0;
   _);
  _);
  pg32ptr@[1].i :=   myins( pg32ptr@[1].i, (myZlen - (1)), (7), (1) );
  timeStamp( pg32ptr@[2].i );
 wrmyDB;
 L3271;
 wrDB( true );
 stats( (5) );
 done;
 _);

_proced insert;
_var l2v1z, l2v2z:integer;
l2v2a: _array [1..17] _of integer;
_(
 L4273( (2) );
 _for l2v1z := (1) _to (17) _do l2v2a[l2v1z] := g2085z@[l2v1z].i;
 l2v2z := deptNum;
 setup( false );
 L4273( (1) );
 _for l2v1z := (1) _to (17) _do g2085z@[l2v1z].i := l2v2a[l2v1z];
  g2085z@[12].i :=   myins( g2085z@[12].i, deptNum, 21, (1) );
  myZlen := (myZlen + (1));
  pg32ptr@[1].i :=   myins( pg32ptr@[1].i, myZlen, (7), (1) );
  timeStamp( pg32ptr@[2].i );
 wrmyDB;
 deptNum := l2v2z;
 erase;
 initAnk;
 stats( (6) );
 _);

_proced save;
_var l2v1z:@page; l2v2z:integer;
_(
 l2v2z := (0);
 l2v1z := ref(sizeof);
 _for l2v2z := (1) _to sizeof _do pg32ptr@[l2v2z] := l2v1z@[l2v2z];
_);

 _proced restore;
_var l2v1z:@page; l2v2z:integer;
_(
 l2v2z := (0);
 l2v1z := ref(sizeof);
 _for l2v2z := (1) _to sizeof _do  l2v1z@[l2v2z] := pg32ptr@[l2v2z];
 _);

_proced L5764;
_var l2v1z, l2v2z:integer;
_(
 _if _not debug _then _(
 code(Э0634=,);
 l2v1z := ;
 l2v1z := (l2v1z - g2089z);
 _if _not (l2v1z >= (0)) _then  EXIT;
 code(Э05310=,);
 l2v2z := ;
 l2v2z := (l2v2z - begTime);
 _if _not (l2v2z >= (0)) _then  EXIT;
 g2091v := shift(l2v1z, 2);
 stats( (33) );
 (q) g2091v := shift(l2v2z, 9);
 stats( (36) );
  _)
_);

_proced exec(l2a1z:integer);
_var l2v1z:integer; l2v2z:sixchars;
F:text;
_procedure L6020(_var f:text; _var i:integer; j:integer); _( code(ПБ76022=,); _);
_(
 _if ЗАПРЕТ _or debug _then _GOTO 6525;
 _if (l2a1z <> (5401560C)) _then _(
  _if (l2a1z <> (3400225C)) _then _(
  _if _not (l2a1z <> (3401751C)) _then  stats( 19 );
  writeln( ornament:18, ' ВЫ ВЫШЛИ ИЗ СЛУЖЕБНОГО БЛОКА ', ornament);
  _) _else _(
 writeln(' ');
  flags := flags + [2];
 save;
  _);
  _) _else  save;
 L5764;
_if (l2a1z = (3401751C))
 _or (l2a1z = (5401540C))
 _or (l2a1z = (3400225C)) _then _(
 L6020( INP, g2109z, 70B );
  _) _else _(
 rewrite(F);
 unpck(l2v2z[1],  cmd );
 _for l2v1z := (1) _to 3 _do _( F@ := l2v2z[(l2v1z + (3))]; put(F) _);
  F@ := sp; put(F);
 _while INP@ <> etx _do _( F@ := INP@; get(INP);  put(F) _);
  F@ := etx; put(F);
 reset(F);
 L6020( F, g2109z, 70B );
 _);
_);

_proced enter;
_procedure L6154(_var f:text; _var i:integer; j:integer); _( code(ПБ76021=,); _);
 _(
 L6154(INP, g2109z, 70B);
 reset(INP);
 _if _not (2 _IN flags) _then _(
   initAnk;
   annex := (0);
   writeln(ornament:18, '  ВЫ ВОШЛИ В СЛУЖЕБНЫЙ БЛОК   ', ornament);
 _) _else  restore;
 flags := flags - [2];
 _GOTO 6340;
_);

_proced checkAdmin(l2a1z:integer);
 _(
 _if _not (l2a1z _IN g2119z) _then _( writeln('ВАМ НЕЛЬЗЯ'); _GOTO 6334 _)
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


_(
 code(СЧ76233=,);
 g12z := ;
 pg32ptr := _nil;
 allones := 7777777777777777B;
 g2062z := [11,12,13,21];
 g2063z := true;
 g2091v := (1);
 code(Э0634=,);
 g2089z := ;
 code(Э05310=,);
 begTime := ;
 sizeof := ord(ref(upto)) - ord(ref(sizeof));
 ЗАПРЕТ := false;
 debug := ;
 g2067z := ;
  _if (g12z <> 'ТАМБОВ') _then _(
 initAnk;
 annex := (0);
 writeln('-=  ОТЛАДКА  =-');
 prnEnable := false;
 g2122z := (1);
 g2123z := ;
 debug := ;
 curVol := (0);
  _) _else  enter;
 6334:
 timeout;
 g2067z := false;
 TTIN( (1) );
 ЗАПРЕТ := false;
 6340:
 g2064z := ;
 g2063z := ;
6341:
 g2081z := (0);
 _if (getAlfa( cmd, (3))) _then_(
 _select
  ('СЛУ' = cmd): _(
   _if _not (33 _IN flags) _then _(
    getPasswd( g12z );
   _if (g12z <> val) _then _(
    writeln('ВАМ НЕЛЬЗЯ');
    ЗАПРЕТ := false;
    rewrite(INP);
    write(INP,'ВЫХ {377');
    _goto 6504;
  _);
  flags := flags + [33];
  _); (* 6372 *)
   stats( (1) );
  _goto 6334;
  _); (* 6374 *)
  ('КАД' = cmd) _or ('СПР' = cmd): _(  6400: checkAdmin( (1) ); exec( (5401540C) ) _);
  ('УСТ' = cmd):  setup( true );
  ('ВВО' = cmd): _(  inpAnk( (1) ); stats( (3) ) _);
  ('ЗАМ' = cmd): _(  inpAnk( (2) ); stats( (4) ) _);
  ('СОN' = cmd): convvo( (3) );
  ('VVО' = cmd): convvo( (4) );
  ('ИСК' = cmd): erase;
  ('ЗАЧ' = cmd): insert;
  ('АНК' = cmd)
 _or ('КАТ' = cmd)
 _or ('УПО' = cmd)
 _or ('РАЗ' = cmd)
 _or ('ПЕЧ' = cmd)
 _or ('ЭКР' = cmd)
 _or ('ВЦП' = cmd)
 _or ('ШКО' = cmd)
 _or ('ИНФ' = cmd)
 _or ('ПАР' = cmd): _( flags := flags + [2]; exec( (5401560C) ) _);
  ('ДАТ' = cmd): _(
   rdDB;  listA[3].i := myins( listA[3].i, getDate, (48), 25 );
   wrDB( true ); stats( 14 ); done;
  _);
  ('ДАЙ' = cmd): _(  g2064z := true; _goto 6341 _);
  ('КОН' = cmd): 6504:  exec( (3401751C) );
  ('РАБ' = cmd): exec( (3400225C) );
  ('ВЫХ' = cmd): _(
   _if debug _then _(
     writeln('<*>   ВОЗВРАТ   <*>');
     code(СЧ12=ЗЧ76135,ПБ76002=);
   _) _else _if _not g2063z _then _goto 6504;
  _);
  true: _if ЗАПРЕТ _then _(  6525: write('В БЛОКЕ НЕТ ПРИКАЗА '); ГГ( cmd ); writeLN _)
  _else _goto 6400
  _end;
  _) _else (* 6535 *) writeln('НЕ ПОНИМАЮ');
 _if (INP@ = '&') _then _(  get(INP); _goto 6341 _);
 _goto 6334;
_).
