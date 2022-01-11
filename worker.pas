(*=p-,t-,l-*)
_program РАБОЧ;
_label 3142, 3176, 3150;
_const z0 = 3401751B; z1 = 5401553B;
dbVol=2060;c112=112;c189=189;c190=190;c191=191;
pl='+';c146=146B;c2=2;c4=4;c7=7;c8=8;c16=16;
sl='/';etx='{377';c172=172B;lf='{175';c214=214B;
sp=' ';eq='=';c36=36;minus='-';comma=',';star='*';
stars='******';kadry='!КАДРЫ';zonkd='!ЗОНКД';zonpch='!ЗОНПЧ';
c17=17;c3=3;ornament='-=#=- ';spaces='      ';c56=56;
_type letter='A'..'Z'; digit='0'..'9';
pwrd = _record i: integer _end;
bitset=_set _of 0..47;
word=_record _case integer _of
0:(i:integer);
1:(b:bitset);
2:(a:alfa)
_end;
page= _array[0..1023] _of word;
sixchars=_array [1..6] _of char;
arr = _array [1..6] _of word;

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

_var
listA,listB:page;
star6a:alfa;
cmd:alfa;
temp:alfa;
tambov:alfa;
mainPtr:@arr;
curPtr:@arr;
pg32ptr:@page;
limCnt:integer;
opCnt, ankCnt:integer;
myDBVol, myDBZone:integer;
Zlen:integer;
myZlen:integer;
begZon, endZon:integer;

num1, num2, num3, num4, num5:integer;
ЗАПРЕТ:boolean;
debug:boolean;
g2080z, g2083z, g2086z, g2089z, g2092z: _array [1..3] _of integer;
g2095z, g2099z, g2103z, g2107z, g2111z: _array [1..4] _of integer;
begCPU,begTime,incr:integer;
g2119z, qqx7, qqx8, curVol, qqx10:integer;
qqx11, qqx12, g2126z:integer;
qqx14, qqx15, qqx16: integer;
flags:bitset; (* <- 2130 *)
prnEnable:boolean; (* <- 2131 *)
g2132z, g2133z: integer;
qqx17:integer;
qqx18:bitset;
statArr:_array[1..39] _of word;
s:setting; (* not used, only restored/saved *)
INP:text; (* <- 2256 *)

_proced error(l2a1z:integer);
 _(
   writeln('ОШ.ТИП=', l2a1z:2 );
 _GOTO 3142;
 _);

 _proced L0341(l2a1z:alfa);
 _(
   rewrite(INP); write(INP, l2a1z);
 _);

_procedure TTIN(level:integer);
_label 1;
_var v1, v2: integer;
_(
  _select
  level = 0: BIND;
  level = 1: BIND(' ==> {172');
  level = 2: BIND(' =-> {172')
  _end;
  
  _if prnEnable  _then _(
    code(СЧ76013=УИ7,);
    v1 := 2; code(ЗЧ76013=,);  
    _select
  level = 1: write(' ==> ');
  level = 2: write(' =-> ')
  _end
  _);
  rewrite(INP);
  v2 := 0;
  _while input@ <> etx _do _(
  _if prnEnable _then write(input@:1);
    v2 := v2 + 1;
    _if v2 > 960_then _(
      L0341('SLЕ   ');
      flags := flags + [47];
      _goto 1
    _);
    write(INP,input@);
    get(input);
  _);
  1:
  INP@ := etx;
  put(INP);
  reset(INP);
  _if prnEnable _then _(
    writeLN;
    code(ВИ7=ЗЧ76013,);
  _);
_);

_proced stats(l2a1z:integer);
_var l2v1z, l2v2z, l2v3z:integer;
_(
 _if _not debug _then _(
  l2v1z := statArr[l2a1z].i;
 l2v3z := ;
 l2v1z := (sel( l2v3z, 12, 6) + incr);
  code(СД/6/=); l2v2z := ;
  code(МР=СД/-6/,МР=);  l2v1z := ;
  ins( l2v3z, l2v1z, 12, 6 );
  statArr[l2a1z].i := l2v3z;
    _if l2v2z > 0 _then _(
    incr := l2v2z;
    stats(l2a1z - 1);
    incr := 1;
  _);
 _if (l2a1z <= 21) & (l2a1z > (0)) _then  stats( (0) );
 _if (l2a1z <= 21) & (l2v1z = 62) _then _(
   writeln('ПРИКАЗЫ КОНЧИЛИСЬ');
   rewrite(INP);
   write(INP,'КОН {377');
   _GOTO 3176;
  _)
  _)
_);

_proced timeout;
_var i:integer;
_(
  _if debug _then EXIT;
 code(Э0634=,);
 i := ;
 _if g2126z - i < 50 _then _(
%   rewrite(INP);
   writeln('ВАШЕ ВРЕМЯ ИСТЕКЛО');
   ЗАПРЕТ := false;
   L0341('КОН  {377');
  _GOTO 3176;
  _);
_);

_proced yousure;
 _(
 writeln('ДЕЛАТЬ ? <ДА,НЕТ>');
 TTIN( (2) );
 _if (INP@ <> 'Д') _then  _GOTO 3142;
_);

_proced skipsp;
 _(
 _while _not (INP@ <> ' ') _do get(INP);
 _);

_proced ckipsp;
 _(
 _while _not (INP@ <> ' ') _do get(INP);
 _);

_function getNum(base:integer):integer;
_var l2v1z:char; l2v2z:integer;
 _(
 l2v2z := (0);
 skipsp;
   _if _not (INP@ _in digit) _then error(0);
 _while INP@ _in digit _do _(
   l2v1z := INP@;
   _if (ord(l2v1z) >= base) _then error(0);
   l2v2z := (l2v2z * base) + ord(l2v1z);
   get(INP);
_);
 skipsp;
 getNum := l2v2z;
_);

_proced getAlfa(_var l2a1z:alfa);
_var l2v1z:sixchars; l2v7z:integer;
_(
 skipsp;
 l2v7z := (1);
 l2a1z := '000000';
 unpck(l2v1z[1],  l2a1z );
  _while (INP@ _in letter) & (l2v7z < 4) _do _( 
 l2v1z[(l2v7z + (3))] := INP@;
 get(INP);
 l2v7z := (l2v7z + (1));
  _);
  _while (INP@ _in letter) _do get(INP);
  skipsp;
  pck(l2v1z[1], l2a1z);
_);

_proced get3Num;
 _(
 num1 :=   getNum( 10 );
 num2 :=   getNum( 10 );
 num3 :=   getNum( 10 );
 _);

 _proced getZones;
 _(
 writeln('ДАЙ ЗОНЫ');
 writeln('НАЧЗОН = ?');
 TTIN( (2) );
 begZon :=   getNum( (8) );
 writeln('КОНЗОН = ?');
 TTIN( (2) );
 endZon :=   getNum( (8) );
 _);

_proced getLimits;
 _(
 writeln('ДАЙ ОГРАНИЧЕНИЯ');
 (a) _(
 writeln('  ЯЧ   Р2  Р1      З1      З2');
 TTIN( (2) );
 _if (INP@ = etx) _then  EXIT;
 get3Num;
 num4 :=   getNum( 10 );
 num5 :=   getNum( 10 );
 limCnt := (limCnt + (1));
 _if  (limCnt > (3)) _then  error( (1) );
 g2080z[limCnt] := num1;
 g2083z[limCnt] := num2;
 g2086z[limCnt] := num3;
 g2089z[limCnt] := num4;
 g2092z[limCnt] := num5;
_goto a _)
   _);

_proced getOper;
_var l2v1z, l2v2z:integer; l2v3z:char;
_(
 writeln('ДАЙ ОПЕРАЦИЮ');
(a) _(
 writeln('  ЯЧ  Р2  Р1 <=,+,-> <ЧИСЛО>');
 TTIN( (2) );
 _if (INP@ = etx) _then  EXIT;
 get3Num;
 l2v3z := INP@;
  _select
  (l2v3z = '='):  l2v2z := (1);
  (l2v3z = '+'):  l2v2z := (2);
  (l2v3z = '-'):  l2v2z := (3);
  true: error( (2) )
  _end;
 get(INP);
 l2v1z :=   getNum( 10 );
 opCnt := (opCnt + (1));
 _if (opCnt > (4)) _then  error( (3) );
 g2095z[opCnt] := num1;
 g2099z[opCnt] := num2;
 g2103z[opCnt] := num3;
 g2111z[opCnt] := l2v2z;
 g2107z[opCnt] := l2v1z;
  _goto a_);
  _);

_proced wrOctal(i, len:integer);
_var a:alfa; b:sixchars;
_(
 mapia(i, a);
 unpck(b[1], a);
  _for i := 7 - len _to 6 _do _( (q) write(b[i]:1); _)
_);

_proced work;
_var l2v1z, l2v2z, l2v3z:integer;
_(
 writeln('ЗАДАНА РАБОТА :');
 write('ЗОН=');
 wrOctal( begZon, (4) );
  write(minus:1 );
 wrOctal( endZon, (4) );
 writeLN;
 writeln('ОГРАНИЧЕНИЯ:');
 writeln('  ЯЧ  Р2  Р1      З1      З2');
 _for l2v1z := (1) _to limCnt _do
  writeln(g2080z[l2v1z]:4, g2083z[l2v1z]:4, g2086z[l2v1z]:4, g2089z[l2v1z]:8, g2092z[l2v1z]:8 );
 writeln('ОПЕРАЦИИ:');
 writeln('  ЯЧ  Р2  Р1  ОПЕР  ЧИСЛО');
 _for l2v1z := (1) _to opCnt _do _(;
 l2v3z := g2111z[l2v1z];
 l2v2z := ;
  writeln( g2095z[l2v1z]:4,   g2099z[l2v1z]:4,   g2103z[l2v1z]:4, l2v2z:6,   g2107z[l2v1z]:7);
 _);
 yousure;
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

_function L1234(l2a1z, l2a2z, l2a3z:integer):integer;
_(
  L1234 :=   mysel(mainPtr@[l2a1z].i, l2a2z, l2a3z );
_);

 _function find:boolean;
_var l2v1z, l2v2z:integer;
_(
 find := false;
 _for l2v1z := (1) _to limCnt _do _(;
   l2v2z :=   L1234( g2080z[l2v1z], g2083z[l2v1z], g2086z[l2v1z] );
  _if (l2v2z < g2089z[l2v1z]) _or (l2v2z > g2092z[l2v1z]) _then EXIT;
 _);
 ankCnt := (ankCnt + (1));
 find := true;
 _);

 _proced chkMagic;
 _(
 _if pg32ptr@[0].a <> kadry _then _(
   writeln('БАНК ИСПОРЧЕН');
   _GOTO 3142;
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

(*=m-*)
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
 l2v3z := (303240C);
 _for l2v1z := 1 _to 6 _do _(;
   l2v2z := trunc(l2a1z / l2v3z);
   l2a1z := l2a1z - l2v2z * l2v3z;
   l2v3z := trunc(l2v3z / 10);
   l2v4z[l2v1z] := chr(l2v2z);
 _);
  pck(l2v4z[1], l2v10z);
  itoa := l2v10z;
_);

_proced rdPage(_var dst:page; vol, zone:integer;  copy:boolean);
_var i:integer;
l2v2z, l2v3z:alfa;
l2v4z:alfa;
_(
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
     _GOTO 3142;
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
 _if copy _then _for l2v1z := (0) _to (1023) _do _(;
    l2v1z := l2v1z;
    code(УИ7=);
    temp := src[l2v1z].a;
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
     _GOTO 3142;
   _)
 _);
 wrpg32(52B, zone );
_);

_proced rdDB;
 _(
   rdPage( listA, dbVol, (112), true );
   Zlen :=   mysel( listA[3].i, (7), (1) );
 _);

 _proced rdMyZone;
 _(
 _if (myDBVol = (0)) _then _(
   writeln('НЕТ БАЗЫ');
   _GOTO 3142;
  _);
  rdPage( listA, myDBVol, myDBZone, false );
  myZlen :=   mysel( pg32ptr@[1].i, (7), (1) );
_);

 _proced wrmyDB;
 _(
 enq52;
 wrPage( listA, myDBVol, myDBZone, false );
 deq52;
 _);

_proced patch;
_var l2v1z, l2v2z, l2v3z:integer;
_(
_for l2v1z := (1) _to  opCnt _do _(;
 num1 := g2095z[l2v1z];
 num2 := g2099z[l2v1z];
 num3 := g2103z[l2v1z];
 l2v3z := g2107z[l2v1z];
 l2v2z :=   L1234( num1, num2, num3 );
  _case g2111z[l2v1z] _of
  1: l2v2z := l2v3z;
  2: l2v2z := (l2v2z + l2v3z);
  3: l2v2z := (l2v2z - l2v3z)
  _end;
  mainPtr@[num1].i := myins(mainPtr@[num1].i, l2v2z, num2, num3);
 _);
 _);

_proced anketa(mode:integer);
_var l2v1z, l2v2z, l2v3z, i, start, l2v6z:integer;
l2v7z, l2v8z:integer; flags:bitset;
_(
 limCnt := (0);
 opCnt := ;
 _if (mode = (1)) _then _(
 ankCnt := (0);
 getZones;
 getLimits;
 getOper;
 work;
  _);
 l2v7z := ord(ref(listA));
 start := (l2v7z + (4));
 rdDB;
 _for l2v1z := (0) _to Zlen - 1 _do _(
 curPtr := ptr((10 * l2v1z) + start);
  myDBVol :=   mysel( curPtr@[2].i, (16), (1) );
 (a) _for l2v2z := (4) _to 7 _do  _for l2v3z := (0) _to 3 _do _(
 l2v6z := ((12 * l2v3z) + (1));
  myDBZone :=   mysel(curPtr@[l2v2z].i, (l2v6z + 10), l2v6z );
  _if (myDBZone = (0)) _then _exit a;
 _if (myDBZone >= begZon) & (myDBZone <= endZon) _then _(
 rdMyZone;
  l2v8z := pg32ptr@[1].i;
 flags := ;
 _if (mode = (1)) _then _(
   _if _not (0 _IN flags) _then _(
     flags := flags + [0];
     pg32ptr@[1] := ;
     _for i := (0) _to myZlen - 1 _do _(
       mainPtr := ptr(17 * i + 64004B);
       _if find _then  patch;
     _)
   _)
 _) _else _(  flags := flags - [0];  pg32ptr@[1] := ;  _);
 wrmyDB;
  _)
  _)
 _);
 _if (mode = (2)) _then   writeln('ОБРАБОТАНО АНКЕТ:', ankCnt:5);
_);

_proced tab;
_label 1;
_var l2v1z, l2v2z, l2v3z, l2v4z, l2v5z, l2v6z, l2v7z:integer;
(* Level 3 *) _proced getParam;
 _(
 writeln('ДАЙ ПАРАМЕТРЫ');
 writeln('ТИП.ТАБЛИЦЫ    КIJ    МIJ     ФОРМАТ');
 TTIN( (2) );
 l2v1z :=   getNum( 10 );
 l2v2z :=   getNum( 10 );
 l2v3z := ((  getNum( 10) * (2)) + (2));
 l2v4z :=   getNum( 10 );
 _);

_proced nuzzzz;
 _(
 write('НУЗЗЗЗ = ?');
 writeLN;
 TTIN( (2) );
 l2v5z :=   getNum( (8) );
 l2v6z := (l2v5z _MOD (4096));
 l2v5z := trunc(((l2v5z) / ((4096))));
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


 _proced wrZKD;
 _(
 enq52;
 wrPage( listB, dbVol, (190), true );
 deq52;
 _);

 _proced wrZPCH;
 _(
 enq52;
 wrPage( listB, dbVol, (191), true );
 deq52;
 _);

_proced getText(l3a1z, l3a2z, l3a3z, l3a4z:integer);
_label 2260, 2222;
_var l3v1z, l3v2z, l3v3z, l3v4z:integer;
l3v5z: _array [1..12] _of char;
_(
 _if (l3a1z= (1)) _then _(
 rdZPCH;
  listB[1].a := zonpch;
 _) _else _(
 rdZKD;
  listB[1].a := zonkd;
  _);
 _for l3v1z := (l3a2z + (2)) _to l3a2z + l3a3z - 1 _do _(;
  listB[l3v1z].a := star6a;
 _);
 l3a4z := l3a4z;
 listB[l3a2z] := ;
 l3v3z := (0);
 _while (INP@ <> etx) _do _(;
 l3v3z := (l3v3z + (1));
 l3v4z := (l3v3z * (2));
 _if _not (l3v4z <= (l3a3z - (2))) _then  error( (4) );
 l3v1z := (0);
 unpck(l3v5z[1],  star6a );
 unpck(l3v5z[7],  star6a );
 _if (l3a1z = (1)) _then _(
 _while (INP@ <> ',') & (INP@ <> etx) _do _(
   l3v1z := (l3v1z + (1));
   _if _not (l3v1z > l3a4z) _then  l3v5z[l3v1z] := INP@;
   get(INP);
  _);
  _goto 2260;
 _);
 2222: (* _repeat *)
 l3v2z := (0);
 _while (INP@ <> ',') & (INP@ <> etx) & (l3v2z < l3a4z) _do _(
 l3v2z := (l3v2z + (1));
 l3v1z := (l3v1z + (1));
 _if _not (l3v1z <= 12) _then  error( (6) );
 l3v5z[l3v1z] := INP@;
 get(INP);
  _);
  _while INP@ _in letter _do get(INP);
 ckipsp;
  _if _not (INP@ _in letter) _then _goto 2260; _goto 2222;2260: (* _until _not (INP@ _in letter) *)
 _if (INP@ = ',') _then _(
  get(INP);
 _if (INP@ = '{214') _then  get(INP);
  _) _else  _if _not (INP@ = etx) _then  error( (7) );
  pck(l3v5z[1], listB[(l3a2z + l3v4z)].a);
  pck(l3v5z[7], listB[((l3a2z + l3v4z) + (1))].a);
 _);
 l3v3z := l3v3z;
  listB[(l3a2z + (1))] := ;
 _if (l3a1z = (1)) _then  wrZPCH
 _else wrZKD;
_);
_proced L2323(l3a1z, l3a2z:integer);
_var l3v1z, l3v2z, l3v3z, l3v4z, l3v5z, l3v6z, l3v7z:integer;
l3v8z:sixchars;
l3v14z:alfa;
_(
   _if (l3a1z= (1)) _then _(
 rdZPCH;
 _) _else _(
 rdZKD;
  _);

  l3v14z := listB[l3a2z].a;
  l3v1z := ;
  l3v14z := listB[(l3a2z + (1))].a;
 l3v2z := ;
 l2v7z := ;
 rewrite(INP);
 write(INP, l3v1z:1 );
  write(INP, lf:1); 
 l3v3z := (0);
 l3v4z := ;
  code(ИА=);
 _for l3v5z := (l3a2z + (2)) _to ((((2) * l3v2z) + l3a2z) + (1)) _do _(;
  l3v14z := listB[l3v5z].a;
 _if (l3v14z <> stars) _then _(
   l3v7z := ((l3v5z - l3a2z) - (2));
   _if ((l3v7z _MOD (2)) = (0)) & (l3v7z <> (0)) _then _(
    write(INP, comma:1);
    l3v3z := (l3v3z + (1));
    _if (l3v3z > 63) _then _(  write(INP, lf:1); l3v3z := (0); code(ИА=ИА,) _);
  _);
 unpck(l3v8z[1],  l3v14z );
 _if (l3a1z = (1)) _then _(
 _for l3v6z := (1) _to 6 _do _if (l3v8z[l3v6z] <> '*') _then _(
    write(INP, l3v8z[l3v6z]:1);
  l3v3z := (l3v3z + (1)); code(ИА=ИА,)
  _);
  _) _else _(
 _if ((l3v7z _MOD (2)) = (0)) _then  l3v4z := (0);
 _for l3v6z := (1) _to 6 _do _(
  _if (l3v8z[l3v6z] <> '*') _then _(
 _if ((l3v4z _MOD l3v1z) = (0)) & (l3v4z <> (0)) _then _(
  write(INP, sp:1);
 l3v3z := (l3v3z + (1));
  _);
  write(INP, l3v8z[l3v6z]:1);
 l3v3z := (l3v3z + (1));
 l3v4z := (l3v4z + (1));
  _)
  _)
  _);
  _);
 _);
  write(INP, etx:1);
 reset(INP);code(ИА=ИА,)
_);

_proced L2476;
_var l3v1z, l3v2z:integer; l3v3z: sixchars;
_(
 l3v1z := (0);
 _repeat 
  unpck(l3v3z[1],  star6a );
  (a) _for l3v2z := (1) _to 6 _do _(;
   _if (INP@ = etx) _then _exit a;
   l3v3z[l3v2z] := INP@;
   get(INP);
  _);
  pck(l3v3z[1], pg32ptr@[l3v1z].a);
  l3v1z := (l3v1z + (1));
 _until (INP@ =etx);
 l3v3z[1] := '^';
 l3v3z[2] := '{172';
 l3v3z[3] := lf;
 pck(l3v3z[1], pg32ptr@[l3v1z].a);
 write('ТАБЛИЦУ --> НУЗЗЗЗ=');
 wrOctal( l2v5z, (2) );
 wrOctal( l2v6z, (4) );
 writeLN;
 yousure;
 wrpg32( l2v5z, l2v6z );
 _);

_proced L2554;
_var l3v1z, l3v2z:integer; l3v3z:sixchars;
l3v9z:char;
_(
 rdpg32( l2v5z, l2v6z );
 rewrite(INP);
 (a) _for l3v1z := (0)_to 1023 _do _(;
 unpck(l3v3z[1],  pg32ptr@[l3v1z].a);
 _for l3v2z := (1) _to 6 _do _(
   l3v9z := l3v3z[l3v2z];
    _if (l3v9z = '{172') _or (l3v9z = '^') _then _exit a;
    _if (l3v9z <> '{175') _then write(INP, l3v9z:1);
   _)
 _);
  write(INP, etx:1);
  reset(INP); code(ИА=ИА,)
 _);

_(
(* tab *)
1:
  writeln('ЧТО ДЕЛАТЬ? <ВВО,ПУЛ,ЗАП,ПОК,ВЫХ>');
 TTIN( (2) );
 getAlfa( cmd );
 _select
  ('ВВО' = cmd): _(
 getParam;
 writeln('ДАЙ ТЕКСТ');
 TTIN( (2) );
 getText( l2v1z, l2v2z, l2v3z, l2v4z );
  _);
  ('ПУЛ' = cmd): _(
 nuzzzz;
 L2554;
 getParam;
 getText( l2v1z, l2v2z, l2v3z, l2v4z );
  _);
  ('ЗАП' = cmd)_or ('ПОК' = cmd): _(
 getParam;
 L2323( l2v1z, l2v2z );
 _if ('ЗАП' = cmd) _then_( nuzzzz; L2476;  _)
  _else _(
    write('ЧИСЛО ЗАПИСЕЙ=', l2v7z:1, ' ФОРМАТ=');
    _while (INP@ <> etx) _do _(write(INP@:1 ); get(INP); _);
    writeLN;
    _goto 1
  _);
  _);
  ('ВЫХ' = cmd):  _GOTO 3142;
  true: error( (8) )
  _end;
 writeln('СДЕЛАНО');
  _goto 1;
_);

_proced saveStats;
_var l2v1z, l2v2z:integer;
_(
 _if _not debug _then _(
 code(Э0634=,);
 l2v1z := ;
 l2v1z := (l2v1z - begCPU);
 _if _not (l2v1z >= (0)) _then  EXIT;
 code(Э05310=,);
 l2v2z := ;
 l2v2z := (l2v2z - begTime);
 _if _not (l2v2z >= (0)) _then  EXIT;
incr := shift(l2v1z, 2);
 stats( (33) );
 (q) incr := shift(l2v2z, 9);
 stats( (36) );
  _)
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

_proced exec(l2a1z:integer);
_procedure L3012(_var f:text; _var i:integer; j:integer); _( code(ПБ76022=,); _);
_(
  _if debug _then EXIT;
 _if (l2a1z <> (5401553C)) _then _(
  stats( 19 );
  writeln( sp: 12, ornament, ' ВЫ ВЫШЛИ ИЗ СЛУЖЕБНОГО БЛОКА ', ornament);
  _) _else  save;
 saveStats;
 L3012( INP, g2119z, 70B );
  _);

_proced enter;
_procedure L3055(_var f:text; _var i:integer; j:integer); _( code(ПБ76021=,); _);
 _(
 L3055(INP, g2119z, 70B);
 reset(INP);
 restore;
 flags := flags - [2];
 _GOTO 3150;
_);


_(
 star6a := '******';
 ЗАПРЕТ := true;
  pg32ptr := _nil;
   code(СЧ76233=,);
 tambov := ;
 debug := false;
 incr := (1);
 code(Э0634=,);
 begCPU := ;
 code(Э05310=,);
 begTime := ;
 s.sizeof := ord(ref(s.upto)) - ord(ref(s.sizeof));
 _if (tambov <> 'ТАМБОВ') _then _(
 writeln('  -= ОТЛАДКА =-');
 prnEnable := false;
 g2132z := (1);
 debug := ;
 g2133z := ;
 curVol := (0);
  _) _else enter;
  3142:
 timeout;
 writeln('ДАЙ РАБОТУ <ТАБ,АНК,КОН,ВЫХ>');
 TTIN( (1) );
 ЗАПРЕТ := false;
 3150:
  getAlfa( cmd );
  _select 
  ('ТАБ' = cmd): tab;
  ('АНК' = cmd): _(  anketa( (1) ); anketa( (2) ) _);
  ('ВЫХ' = cmd):  _if debug _then _(  writeln('<*>  ВОЗВРАТ  <*>');  code(ПБ76002=) _)
  _else _(  flags := flags + [2];  exec( (5401553C) ) _);
  ('КОН' = cmd): 3176: exec( (3401751C) );
  ('РАБ' = cmd):  _if (INP@ = etx) _then _goto 3142 _else _(  ЗАПРЕТ := true; _goto 3150 _);
  true: _( writeln('НЕПОНЯТНО'); _goto 3142 _)
  _end;
 writeln('СДЕЛАНО');
 _goto 3142;
_).
