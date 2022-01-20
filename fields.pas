(*=p-,t-*)_program ДАЙ;
_label 1372;
_const  main=5401540B; dbVol=2060;
c112=112;c189=189;c190=190;c191=191;
pl='+';c146=146B;
c2=2;c4=4;c7=7;c8=8;c16=16;
sl='/';
c214=214;c232=232;c264=264;c296=296;c308=308;c510=510;
c800=800;c832=832;c914=914;c924=924;c934=934;c942=942;
c56=56;c3=3;c6=6;
zonpch='!ЗОНПЧ';kadry='!КАДРЫ';
etx='{377';sp=' ';stars='******';
comma=',';star='*';

_type letter='A'..'Z';
word=_record _case integer _of 1:(i:integer); 2:(a:alfa) _end;
bitset=_set _of 0..47;
page=_array [0..1023] _of word;
sixchars=_array [1..6] _of char;
xx=_array [0..65] _of integer;
cmdArr = _array [0..24] _of alfa;
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
statArr:_array[1..39] _of integer
_end;

_var
cmd:alfa;
cmd2:alfa;
list:page;
begCPU, begTime:integer;
g1038z:integer;
pg32ptr:@page;
g1040z:@page;
d:data; (* <- 1041 *)
s:_record sizeof:integer;
www1, www2, www3:_array [0..39] _of char;(* ... 1097 - 1335 *)
www4, ww5, www6:_array [1..39] _of char;
last:integer
_end;
cmdList:_record cmd:cmdArr _end; (* <- 1336 *)
www7:_array [0..39] _of char;
g1401z:integer;
INP:text; (* <- 1402 *)

_proced stats(l2a1z:integer);
_var l2v1z, l2v2z, l2v3z:integer;
_(
 l2v1z := d.statArr[l2a1z];
  l2v3z := ;
 l2v1z := sel(l2v3z, 18, 6) + g1038z;
  code(СД/6/=); l2v2z := ;
  code(МР=СД/-6/,МР=);  l2v1z := ;
 ins(l2v3z, l2v1z, 18, 6);
 d.statArr[l2a1z] := ;
 _if l2v2z > 0 _then _(
    g1038z := l2v2z;
    stats(l2a1z-1);
    g1038z := 1;
  _);
   _if (l2a1z <= 21) & (l2a1z > 0) _then  stats( 0);
_);

_proced skipsp;
 _(
 _while _not (INP@ <> ' ') _do get(INP);
 _);

_proced L0365(* 0365 *);
_var r:alfa;
_(
 writeLN;
 code(СЧ77015=);
 r := ;
  _if r = 'Н{3770000' _then _GOTO 1372
_);
_function L0374(l2a1z:integer):integer;
_var l2v1z:integer;
_(
 _for l2v1z := 0 _to l2a1z _do _(
  _if _not (cmdList.cmd[l2v1z] <> cmd2) _then  _(
 L0374 := l2v1z;
 EXIT;
 _);
 _);
 write('НЕТ ПАРМЕТРА ');
 ГГ(cmd2 );
 L0365(* 0365 *);
 _GOTO 1372;
_);

_proced getAlfa(_var l2a1z:alfa; l2a2z:integer);
_var l2v1z:sixchars; l2v7z:integer;
_(
 skipsp;
 l2v7z := 0;
 l2a1z := '000000';
 unpck(l2v1z[1],  l2a1z );
 _while ( INP@ _in letter) & (l2v7z < l2a2z) _do _(
 l2v1z[7 - l2a2z + l2v7z] := INP@;
 get(INP);
 l2v7z := (l2v7z + 1);
  _);                                      
  _while INP@ _in letter _do get(INP);
  skipsp;
 pck(l2v1z[1], l2a1z);
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
(*=m-*)
_proced rdpg32(l2a1z, l2a2z:integer);
 _(
 l2a2z := (((l2a1z * 4096) + l2a2z) + (10320000000000C));
   code(2Э0704=,)
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
     _GOTO 1372
   _)
 _);
 rdpg32( 52B, zone );
 _if pg32ptr@[0].a <> kadry _then _(
  writeln('ЧП!! БАНК ИСПОРЧЕН', zone:5);
   _GOTO 1372
 _);
 _if copy _then _for i := 0 _to 1023 _do 
     code(2ИК7=ИА64000,СЧ=17ЗЧ,2СЧ7=2АС3,17ЗЧ=17ИК,ИА=15ПА,17СЧ=15ЗЧ,)
_);

 _proced rdZPCH;
 _(
   _if (list[1].a <> '!ЗОНПЧ') _then
     rdPage( list, dbVol, (191), true );
 _);

_proced L0631(l2a1z:integer);
_var l2v1z, l2v2z, l2v3z, l2v4z, l2v5z, l2v6z, l2v7z:integer;
l2v8z:sixchars; l2v14z:alfa;
_(
 rdZPCH(* 0620 *);
  l2v14z := list[l2a1z].a;
 l2v1z := ;
  l2v14z := list[(l2a1z + 1)].a;
 l2v2z := ;
 l2v3z := 0;
 l2v4z := ;
(*=m+*) _for l2v5z := (l2a1z + 2) _to (((2 * l2v2z) + l2a1z) + 1) _do _(
  l2v14z := list[l2v5z].a;
 _if l2v14z <> stars _then _(
 l2v7z := ((l2v5z - l2a1z) - 2);
 _if _not ( ((l2v7z _MOD 2) <> 0) _or  (l2v7z = 0)) _then_(
  write(comma:1);
 _for l2v6z := 1 _to ((l2v1z - l2v4z) + 1) _do _(
  write(sp:1);
 l2v3z := (l2v3z + 1);
  code(иа=иа,);
  (* for 0665 *) _); 
 l2v4z := 0;
 _if  (l2v3z > 77B) _then  _(
 writeLN;
 l2v3z := 0;
 _);
  _);
 unpck(l2v8z[1],  l2v14z );
 _for l2v6z := 1 _to 6 _do _(
 _if _not (l2v8z[l2v6z] = '*') _then  _(
  write(l2v8z[l2v6z]:1);code(иа=иа,);
 l2v4z := (l2v4z + 1);
 l2v3z := (l2v3z + 1);
 _);
  (* for 0706 *) _);
  _);
  (* for 0644 *) _);
_);

_function L0725:integer;
_(
cmdList := [
'777','ФАМ','ИМЯ','ОТЧ','ПОЛ',
'РОЖ','ВОЗ','НАЦ','КПС','ВЛК',
'ПРО','ОБР','СТЕ','ЗВА','СПЕ',
'СЕМ','ДЕТ','АДР','ТЕЛ','ЗАЧ',
'ПОД','СТА','ДОЛ','ПОВ','ЗАР',
'СОС','ВОИ','СТР','БРО'];
 getAlfa(cmd2, 3 );
 L0725 :=   L0374( 28 );
_);

_proced L0774(l2a1z:integer);
 _(
 write(stars); ГГ( cmd2 ); writeln(stars);
_case l2a1z _of
   1, 2, 3:
 write('ИВАНОВ АНДРЕЙ ЕВГЕНЬЕВИЧ, ИВАНОВ А И,...');
   4: L0631( 2 );
   5, 19, 23: write('12.11.1978, 12.11.78');
   6, 8, 9, 16, 21, 24: write('МИНИМУМ, МАКСИМУМ, 0, 1, 2, 3, 4...');
   7: L0631( 10 );
   10: L0631( (934) );
   11: L0631( (214) );
   12: L0631( (232) );
   13: L0631( 264 );
   14: write('0000, 0647, 2116,...');
   15: L0631( 296 );
   17: write('ЛЮБАЯ ПОСЛЕДОВАТЕЛЬНОСТЬ СИМВОЛОВ КРОМЕ "," - ОБРАЗЕЦ, 
   КОТОРЫЙ ВЫ ХОТИТЕ НАЙТИ В АДРЕСЕ');
   18: write('7-ЗНАЧНОЕ ЧИСЛО БЕЗ ПРОБЕЛОВ И ТИРЕ');
   20: L0631( 308 );
   22: L0631( (510) );
   25: L0631( 800 );
   26: L0631( 832 );
   27: L0631( (914) );
   28: L0631( (924) )
   _end;
   L0365(* 0365 *);
 _if (l2a1z _IN [5,6,8,9,11,12,13,14,16,18,19,21,23,24,25,26]) _then
 writeln(stars, 'МОЖНО ЗАДАВАТЬ ДИАПАЗОН ЗНАЧЕНИЙ', stars);

 _if (l2a1z _IN [20,22]) _then 
   writeln(stars, 'МОЖНО ЗАДАВАТЬ СПИСОК ЗНАЧЕНИЙ', stars);
 _if (l2a1z _IN [20]) _then 
 writeln(stars, 'КРОМЕ ТОГО,НАБРАВ "ПОД=*(ПОДРАЗД1-ПОДРАЗД2)" 
ВЫ ПОЛУЧИТЕ ДАННЫЕ ПО КАЖДОМУ ПОДРАЗДЕЛЕНИЮ В ОТДЕЛЬНОСТИ 
В ИНТЕРВАЛЕ ОТ ПОДРАЗД1 ДО ПОДРАЗД2 ', stars);
_);

_proced save;
_var l2v1z:@page; l2v2z:integer;
_(
  l2v1z := ref(s.sizeof);
  _for l2v2z := 0 _to s.sizeof _do g1040z@[l2v2z] := l2v1z@[l2v2z];
_);

 _proced restore;
_var l2v1z:@page; l2v2z:integer;
_(
  l2v1z := ref(s.sizeof);
  _for l2v2z := 0 _to s.sizeof _do  l2v1z@[l2v2z] := g1040z@[l2v2z];
 _);

 _proced L1234(* 1234 *);
_var l2v1z, l2v2z:integer;
_(
 code(Э0634=,);
 l2v1z := ;
 l2v1z := (l2v1z - begCPU);
 _if _not (l2v1z >= 0) _then  EXIT;
 code(Э05310=,);
 l2v2z := ;
 l2v2z := (l2v2z - begTime);
 _if _not (l2v2z >= 0) _then  EXIT;
 g1038z := shift(l2v1z, 2);
 stats( 33 );
 (q) g1038z := shift(l2v2z, 9);
 stats( 36 );
_);

_proced exec(l2a1z:integer);
_procedure L1260(_var f:text; _var d:data; j:integer); _( code(ПБ76022=,); _);
_(
save;
 L1234;
 rewrite(INP);
 write(INP,'ВЫХ {377');
 reset(INP);
 L1260( INP, d, 70B );
_);

_proced enter;
_procedure L1310(_var f:text; _var d:data; j:integer); _( code(ПБ76021=,); _);
 _(
 L1310(INP, d, 70B);
 reset(INP);
 restore;
_);

_(
 code(СЧ76233=,);
 cmd2 := ;
 pg32ptr := _nil;
 g1040z := ptr(67000B);
 g1038z := 1;
 code(Э0634=,);
 begCPU := ;
 code(Э05310=,);
 begTime := ;
 s.sizeof := ord(ref(s.last)) - ord(ref(s.sizeof));
  enter;
  getAlfa(cmd, 3);
 _while _not (INP@ = etx) _do _(
  L0774( L0725 );
  _if _not (INP@ <> ',') _then  get(INP);
 _);
 1372:
 exec( main );
_).
