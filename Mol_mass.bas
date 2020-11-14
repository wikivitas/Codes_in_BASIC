REM Код предназначен для интерпретации программой BBC BASIC for Windows
*FONT COURIER, 15

REM Блок постоянных
I1=1
E=0 REM Идентификационный номер ошибки
J=0 REM Идентификационный номер элемента
M=0 REM Молярная масса вещества
MS=0   REM Молярная масса в скобках
REM Молярные массы элементов периодической системы:
H=1.00794:He=4.0026
Li=6.941:Be=9.0121
B=10.811:C=12.0107:N=14.00674:O=15.9994:F=18.9984032:Ne=20.1797
Na=22.98977:Mg=24.305:Al=26.981538:Si=28.0855:P=30.973761:S=32.066:Cl=35.4527:Ar=39.948
K=39.0983:Ca=40.078:Sc=44.95591:Ti=47.867:V=50.9415:Cr=51.9961:Mn=54.938046:Fe=55.845:Co=58.9332:Ni=58.6934:Cu=63.546:Zn=65.39:Ga=69.723:Ge=72.61:As=74.9216:Se=78.96:Br=78.904:Kr=83.8
Rb=85.4678:Sr=87.62:Y=88.90585:Zr=91.224:Nb=92.90638:Mo=95.94:Tc=97:Ru=101.07:Rh=102.9055:Pd=106.42:Ag=107.8682:Cd=112.411:In=114.818:Sn=118.71:Sb=121.76:Te=127.6:Jd=126.90447:Xe=131.29
Cs=132.90545:Ba=137.327:La=138.9055:Ce=140.116:Pr=140.90765:Nd=144.24:Pm=145:Sm=150.36:Eu=151.964:Gd=157.25:Tb=158.92534:Dy=162.5:Ho=164.93032:Er=167.26:Tm=168.93421:Yb=173.04:Lu=174.967:Hf=178.46:Ta=180.9479:W=183.84:Re=186.207:Os=190.217:Ir=192.217
Pt=195.078:Au=196.96655:Hg=200.59:Tl=204.3833:Pb=207.2:Bi=208.98038:Po=210:At=210:Rn=222:Fr=223:Ra=226:Ac=227:Th=232:Pa=231:U=238:Np=239:Pu=239:Am=243:Cm=247:Bk=247:Cf=251:Es=252:Fm=257:Md=258:No=259:Lr=262:Rf=261:Db=262:Sg=263:Bh=264:Hs=265:Mt=268
Ds=271:Rg=272
REM Массивы данных:
REM Массив разбиения введенной строки на одиночные разряды
DIM A2$(256)
REM Массив группирования элементов
DIM A2(256)
REM Массив считывания индексов
DIM A3$(256)
REM Массив преобразования индексов
DIM A3(256)

REM Надпись заголовка
COLOUR 4:PRINT TAB(17,1) "Рассчет молярной массы вещества":COLOUR 0
FOR I=1 TO 66
	PRINT"=";
NEXT I
PRINT"="

REM Ввод данных
1 INPUT "Введите эмпирическую формулу вещества: "A1$

REM Анализ данных
A1=LEN(A1$)
IF A1=0 THEN E=1:GOTO 1000
FOR I=1 TO A1
	A2$(I)=MID$(A1$,I,1)
NEXT I
FOR I=1 TO A1
	J1=J+1
9   IF A2$(I)="" THEN GOTO 100
	IF A2$(I)="A" THEN
          IF A2$(I+1)="c" THEN M+=Ac:I+=1:A2(J)+=Ac
          IF A2$(I+1)="g" THEN M+=Ag:I+=1:A2(J)+=Ag
          IF A2$(I+1)="l" THEN M+=Al:I+=1:A2(J)+=Al
          IF A2$(I+1)="m" THEN M+=Am:I+=1:A2(J)+=Am
          IF A2$(I+1)="r" THEN M+=Ar:I+=1:A2(J)+=Ar
          IF A2$(I+1)="s" THEN M+=As:I+=1:A2(J)+=As
          IF A2$(I+1)="t" THEN M+=At:I+=1:A2(J)+=At
          IF A2$(I+1)="u" THEN M+=Au:I+=1:A2(J)+=Au
          J+=1
        ENDIF
        IF A2$(I)="B" THEN
          IF A2$(I+1)="a" THEN M+=Ba:I+=1:A2(J)+=Ba
          IF A2$(I+1)="e" THEN M+=Be:I+=1:A2(J)+=Be
          IF A2$(I+1)="h" THEN M+=Bh:I+=1:A2(J)+=Bh
          IF A2$(I+1)="i" THEN M+=Bu:I+=1:A2(J)+=Bu
          IF A2$(I+1)="k" THEN M+=Bk:I+=1:A2(J)+=Bk
          IF A2$(I+1)="r" THEN M+=Br:I+=1:A2(J)+=Br
          IF A2$(I+1)<>"a" AND A2$(I)<>"e" AND A2$(I)<>"h"AND A2$(I)<>"i"AND A2$(I)<>"r" THEN M+=B:A2(J)+=B
          J+=1
        ENDIF
        IF A2$(I)="C" THEN
          IF A2$(I+1)="a" THEN M+=Ca:I+=1:A2(J)+=Ca
          IF A2$(I+1)="d" THEN M+=Cd:I+=1:A2(J)+=Cd
          IF A2$(I+1)="e" THEN M+=Ce:I+=1:A2(J)+=Ce
          IF A2$(I+1)="f" THEN M+=Cf:I+=1:A2(J)+=Cf
          IF A2$(I+1)="l" THEN M+=Cl:I+=1:A2(J)+=Cl
          IF A2$(I+1)="m" THEN M+=Cm:I+=1:A2(J)+=Cm
          IF A2$(I+1)="o" THEN M+=Co:I+=1:A2(J)+=Co
          IF A2$(I+1)="r" THEN M+=Cr:I+=1:A2(J)+=Cr
          IF A2$(I+1)="s" THEN M+=Cs:I+=1:A2(J)+=Cs
          IF A2$(I+1)="u" THEN M+=Cu:I+=1:A2(J)+=Cu
          IF A2$(I)<>"a" AND A2$(I)<>"d" AND A2$(I)<>"e"AND A2$(I)<>"f"AND A2$(I)<>"l"AND A2$(I)<>"m"AND A2$(I)<>"o"AND A2$(I)<>"r"AND A2$(I)<>"s"AND A2$(I)<>"u" THEN M+=C:A2(J)+=C
          J+=1
        ENDIF
        IF A2$(I)="D" THEN
          IF A2$(I+1)="b" THEN M+=Db:I+=1:A2(J)+=Db
          IF A2$(I+1)="y" THEN M+=Dy:I+=1:A2(J)+=Dy
          IF A2$(I+1)="s" THEN M+=Ds:I+=1:A2(J)+=Ds
          J+=1
        ENDIF
        IF A2$(I)="E" THEN
          IF A2$(I+1)="r" THEN M+=Er:I+=1:A2(J)+=Er
          IF A2$(I+1)="s" THEN M+=Es:I+=1:A2(J)+=Es
          IF A2$(I+1)="u" THEN M+=Eu:I+=1:A2(J)+=Eu
          J+=1
        ENDIF
        IF A2$(I)="F" THEN
          IF A2$(I+1)="e" THEN M+=Fe:I+=1:A2(J)+=Fe
          IF A2$(I+1)="m" THEN M+=Fm:I+=1:A2(J)+=Fm
          IF A2$(I+1)="r" THEN M+=Fr:I+=1:A2(J)+=Fr
          IF A2$(I)<>"e" AND A2$(I)<>"m" AND A2$(I)<>"r"THEN M+=F:A2(J)+=F
          J+=1
        ENDIF
        IF A2$(I)="G" THEN
          IF A2$(I+1)="a" THEN M+=Ga:I+=1:A2(J)+=Ga
          IF A2$(I+1)="d" THEN M+=Gd:I+=1:A2(J)+=Gd
          IF A2$(I+1)="e" THEN M+=Ge:I+=1:A2(J)+=Ge
          J+=1
        ENDIF
        IF A2$(I)="H" THEN
          IF A2$(I+1)="e" THEN M+=He:I+=1:A2(J)+=He
          IF A2$(I+1)="f" THEN M+=Hf:I+=1:A2(J)+=Hf
          IF A2$(I+1)="g" THEN M+=Hg:I+=1:A2(J)+=Hg
          IF A2$(I+1)="o" THEN M+=Ho:I+=1:A2(J)+=Ho
          IF A2$(I+1)="s" THEN M+=Hs:I+=1:A2(J)+=Hs
          IF A2$(I)<>"e" AND A2$(I)<>"g" AND A2$(I)<>"g"AND A2$(I)<>"o"AND A2$(I)<>"s" THEN M+=H:A2(J)+=H
          J+=1
        ENDIF
        IF A2$(I)="I" THEN
          IF A2$(I+1)="n" THEN M+=In:I+=1:A2(J)+=In
          IF A2$(I+1)="r" THEN M+=Ir:I+=1:A2(J)+=Ir
          IF A2$(I)<>"n" AND A2$(I)<>"r"THEN M+=Jd:I+=1:A2(J)+=Jd
          J+=1
        ENDIF
        IF A2$(I)="K" THEN
          IF A2$(I+1)="r" THEN M+=Kr:I+=1:A2(J)+=Kr
          IF A2$(I+1)<>"r" THEN M+=K:A2(J)+=K
          J+=1
        ENDIF
        IF A2$(I)="L" THEN
          IF A2$(I+1)="a" THEN M+=La:I+=1:A2(J)+=La
          IF A2$(I+1)="i" THEN M+=Li:I+=1:A2(J)+=Li
          IF A2$(I+1)="r" THEN M+=Lr:I+=1:A2(J)+=Lr
          IF A2$(I+1)="u" THEN M+=Lu:I+=1:A2(J)+=Lu
          J+=1
        ENDIF
        IF A2$(I)="M" THEN
          IF A2$(I+1)="d" THEN M+=Md:I+=1:A2(J)+=Md
          IF A2$(I+1)="g" THEN M+=Mg:I+=1:A2(J)+=Mg
          IF A2$(I+1)="n" THEN M+=Mn:I+=1:A2(J)+=Mn
          IF A2$(I+1)="o" THEN M+=Mo:I+=1:A2(J)+=Mo
          IF A2$(I+1)="t" THEN M+=Mt:I+=1:A2(J)+=Mt
          J+=1
        ENDIF
        IF A2$(I)="N" THEN
          IF A2$(I+1)="a" THEN M+=Na:I+=1:A2(J)+=Na
          IF A2$(I+1)="b" THEN M+=Nb:I+=1:A2(J)+=Nb
          IF A2$(I+1)="d" THEN M+=Nd:I+=1:A2(J)+=Nd
          IF A2$(I+1)="e" THEN M+=Ne:I+=1:A2(J)+=Ne
          IF A2$(I+1)="i" THEN M+=Ni:I+=1:A2(J)+=Ni
          IF A2$(I+1)="o" THEN M+=No:I+=1:A2(J)+=No
          IF A2$(I+1)="p" THEN M+=Np:I+=1:A2(J)+=Np
          IF A2$(I)<>"a" AND A2$(I)<>"b" AND A2$(I)<>"d"AND A2$(I)<>"e"AND A2$(I)<>"i"AND A2$(I)<>"o"AND A2$(I)<>"p" THEN M+=N:A2(J)+=N
          J+=1
        ENDIF
        IF A2$(I)="O" THEN
          IF A2$(I+1)="s" THEN M+=Os:I+=1:A2(J)+=Os
          IF A2$(I+1)<>"s" THEN M+=O:A2(J)+=O
          J+=1
        ENDIF
        IF A2$(I)="P" THEN
          IF A2$(I+1)="a" THEN M+=Pa:I+=1:A2(J)+=Pa
          IF A2$(I+1)="b" THEN M+=Pb:I+=1:A2(J)+=Pb
          IF A2$(I+1)="d" THEN M+=Pd:I+=1:A2(J)+=Pd
          IF A2$(I+1)="m" THEN M+=Pm:I+=1:A2(J)+=Pm
          IF A2$(I+1)="o" THEN M+=Po:I+=1:A2(J)+=Po
          IF A2$(I+1)="r" THEN M+=Pr:I+=1:A2(J)+=Pr
          IF A2$(I+1)="t" THEN M+=Pt:I+=1:A2(J)+=Pt
          IF A2$(I+1)="u" THEN M+=Pu:I+=1:A2(J)+=Pu
          IF A2$(I)<>"a" AND A2$(I)<>"b" AND A2$(I)<>"d"AND A2$(I)<>"m"AND A2$(I)<>"o"AND A2$(I)<>"r"AND A2$(I)<>"t"AND A2$(I)<>"u" THEN M+=P:A2(J)+=P
          J+=1
        ENDIF
        IF A2$(I)="R" THEN
          IF A2$(I+1)="a" THEN M+=Ra:I+=1:A2(J)+=Ra
          IF A2$(I+1)="b" THEN M+=Rb:I+=1:A2(J)+=Rb
          IF A2$(I+1)="e" THEN M+=Re:I+=1:A2(J)+=Re
          IF A2$(I+1)="f" THEN M+=Rf:I+=1:A2(J)+=Rf
          IF A2$(I+1)="g" THEN M+=Rg:I+=1:A2(J)+=Rg
          IF A2$(I+1)="h" THEN M+=Rh:I+=1:A2(J)+=Rh
          IF A2$(I+1)="n" THEN M+=Rn:I+=1:A2(J)+=Rn
          IF A2$(I+1)="u" THEN M+=Ru:I+=1:A2(J)+=Ru
          J+=1
        ENDIF
        IF A2$(I)="S" THEN
          IF A2$(I+1)="b" THEN M+=Sb:I+=1:A2(J)+=Sb
          IF A2$(I+1)="c" THEN M+=Sc:I+=1:A2(J)+=Sc
          IF A2$(I+1)="e" THEN M+=Se:I+=1:A2(J)+=Se
          IF A2$(I+1)="g" THEN M+=Sg:I+=1:A2(J)+=Sg
          IF A2$(I+1)="i" THEN M+=Si:I+=1:A2(J)+=Si
          IF A2$(I+1)="m" THEN M+=Sm:I+=1:A2(J)+=Sm
          IF A2$(I+1)="n" THEN M+=Sn:I+=1:A2(J)+=Sn
          IF A2$(I+1)="r" THEN M+=Sr:I+=1:A2(J)+=Sr
          IF A2$(I)<>"b" AND A2$(I)<>"c" AND A2$(I)<>"e"AND A2$(I)<>"g"AND A2$(I)<>"i"AND A2$(I)<>"m"AND A2$(I)<>"n"AND A2$(I)<>"r" THEN M+=S:A2(J)+=S
          J+=1
        ENDIF
        IF A2$(I)="T" THEN
          IF A2$(I+1)="a" THEN M+=Ta:I+=1:A2(J)+=Ta
          IF A2$(I+1)="b" THEN M+=Tb:I+=1:A2(J)+=Tb
          IF A2$(I+1)="c" THEN M+=Tc:I+=1:A2(J)+=Tc
          IF A2$(I+1)="e" THEN M+=Te:I+=1:A2(J)+=Te
          IF A2$(I+1)="h" THEN M+=Th:I+=1:A2(J)+=Th
          IF A2$(I+1)="i" THEN M+=Ti:I+=1:A2(J)+=Ti
          IF A2$(I+1)="l" THEN M+=Tl:I+=1:A2(J)+=Tl
          IF A2$(I+1)="m" THEN M+=Tm:I+=1:A2(J)+=Tm
          J+=1
        ENDIF
        IF A2$(I)="U" THEN M+=U:A2(J)+=U:J+=1
        IF A2$(I)="V" THEN M+=V:A2(J)+=V:J+=1
        IF A2$(I)="W" THEN M+=W:A2(J)+=W:J+=1
        IF A2$(I)="Xe" THEN M+=Xe:I+=1:A2(J)+=Xe:J+=1
        IF A2$(I)="Y" THEN
          IF A2$(I+1)="b" THEN M+=Yb:I+=1:A2(J)+=Yb
          IF A2$(I+1)<>"b" THEN M+=Y:I+=1:A2(J)+=Y
          J+=1
        ENDIF
        IF A2$(I)="Z" THEN
          IF A2$(I+1)="n" THEN M+=Zn:I+=1:A2(J)+=Zn
          IF A2$(I+1)="r" THEN M+=Zr:I+=1:A2(J)+=Zr
          J+=1
        ENDIF
   10   IF A2$(I)=" " THEN GOTO 11
        IF J1=J THEN GOTO 11
        IF A2$(I)="Q" OR (A2$(I-1)=" " AND (ASC(A2$(I))>=97 AND ASC(A2$(I))<=122)) THEN E=2:GOTO 1000
        IF (VAL(A2$(I))>=0 AND VAL(A2$(I))<=9 AND ASC(A2$(I))>=48 AND ASC(A2$(I))<=57) THEN
          A3$(I1)=A3$(I1)+A2$(I)
          I+=1:GOTO 10
        ELSE IF VAL(A2$(I))=0 AND (ASC(A2$(I))<48 OR ASC(A2$(I))>57) THEN
            A3(I1)=VAL(A3$(I1)):M+=((A3(I1)-1)*A2(J-1)):PRINT "Индекс (";I1;"): ";A3(I1);", A = ";A2(J-1)*A3(I1):I1+=1:GOTO 9
          ELSE GOTO 100
          ENDIF
	ENDIF
11 NEXT I

REM Вывод результата анализа данных
100 IF M<0 THEN E=2:GOTO 1000
PRINT "Mолярная масса ";A1$;" составляет ";M;" г/моль, или ";M/1000;" кг/моль"
PRINT "Вес частицы ";A1$;" составляет ";M/(6*10^23);" г или ";M/(6*10^26);" кг"
IF (M/22.4)<13.3 THEN
        PRINT "Если ";A1$;" - газ при н. у., то:"
        PRINT "* его плотность при н. у. равна ";M/(22.4*1.0302325581395348837209302325581);" кг/м^3"
        PRINT "* его плотность при водороду равна ";M/2.01588
        PRINT "* его плотность при воздуху равна ";M/29
ELSE PRINT A1$;" не может быть газом при н. у."
ENDIF

1000 REM Очистка данных
FOR I=1 TO 256
        A2$(I)=""
        A2(I)=0
        A3$(I)=""
        A3(I)=0
NEXT I
I=0:A1=0:M=0:J=1:I1=1

REM Блок ошибок
IF E<>0 THEN COLOUR 1:PRINT "Ошибка! ";
IF E=1 THEN PRINT "Формула не введена!"
IF E=2 THEN PRINT "Формула некорректно введена!"
IF E=3 THEN PRINT "Индекс не может быть нулевым!"
E=0:COLOUR 0:PRINT:GOTO 1
