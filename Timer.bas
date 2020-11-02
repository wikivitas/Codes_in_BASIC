REM Код предназначен для интерпретации программой BBC Basic for Windows

REM Переменные конфигурации
PS_T=36: REM Номер горизинтальной позиции настроечных и текущих значений таймера
PSY_T=9: REM Номер вертикальной позиции настроечных и текущих значений таймера

GWL_STYLE = -16
WS_SIZEBOX = &40000
WS_MAXIMIZEBOX = &10000
SYS "GetWindowLong", @hwnd%, GWL_STYLE TO ws%
SYS "SetWindowLong", @hwnd%, GWL_STYLE, ws% AND NOT (WS_SIZEBOX OR WS_MAXIMIZEBOX)
H=0:M=0:S=0:I=0:I1=0

1 CLS
*FONT CONSOLAS,45
PRINT TAB(16,3) "Таймер"
*FONT CONSOLAS,15
PRINT TAB(42,15) "Для установки периода нажмите T"
K$=GET$
IF K$="T" OR K$="t" OR K$="Е" OR K$="е" THEN
  GOTO 2
ELSE GOTO 1
ENDIF

2 CLS
*FONT CONSOLAS,20
PRINT TAB(35,6) "1. Укажите время"
PRINT TAB(37,15) "Нажмите ENTER"
COLOUR 1:PRINT TAB(PS_T+1+I,PSY_T+1) "^" :COLOUR 0
COLOUR 1:PRINT TAB(PS_T+1+I,PSY_T+2) "|" :COLOUR 0

IF H>=0 OR H<10 THEN PRINT TAB(PS_T,PSY_T) "0"+STR$(H);
IF H>=10 THEN PRINT TAB(PS_T,PSY_T) STR$(H)
PRINT TAB(PS_T+2,PSY_T) " : "
IF M>=0 OR M<10 THEN PRINT TAB(PS_T+5,PSY_T) "0"+STR$(M);
IF M>=10 THEN PRINT TAB(PS_T+5,PSY_T) STR$(M)
PRINT TAB(PS_T+7,PSY_T) " : "
IF S>=0 OR S<10 THEN PRINT TAB(PS_T+10,PSY_T) "0"+STR$(S);
IF S>=10 THEN PRINT TAB(PS_T+10,PSY_T) STR$(S):PRINT TAB(PS_T+12,PSY_T) " "
K$=GET$
IF INKEY(-122) AND I<10 THEN I=I+5: GOTO 2
IF INKEY(-26) AND I>0 THEN I=I-5:GOTO 2
IF INKEY(-58) AND I=0 AND H<23 THEN H=H+1: GOTO 2
IF INKEY(-58) AND I=5 AND M<59 THEN M=M+1: GOTO 2
IF INKEY(-58) AND I=10 AND S<59 THEN S=S+1: GOTO 2
IF INKEY(-42) AND I=0 AND H>0 THEN H=H-1: GOTO 2
IF INKEY(-42) AND I=5 AND M>0 THEN M=M-1: GOTO 2
IF INKEY(-42) AND I=10 AND S>0 THEN S=S-1: GOTO 2
IF INKEY(-74) THEN
  GOTO 3
ELSE GOTO 2
ENDIF

3 CLS
PRINT TAB(49,15) "Нажмите ENTER"
PRINT TAB(39,2) "Что сделать при завершении времени?"
PRINT TAB(45,6) "Завершить задачи"
PRINT TAB(45,7) "Выключить компьютер"
PRINT TAB(45,8) "Перезапустить компьютер"
PRINT TAB(45,9) "Ничего не делать"
PRINT TAB(42,6+I1) "=>"
K$=GET$
IF INKEY(-42) AND I1<3 THEN I1=I1+1:GOTO 3
IF INKEY(-58) AND I1>0 THEN I1=I1-1:GOTO 3
IF INKEY(-74) THEN
  GOTO 4
ELSE GOTO 3
ENDIF
END
4 SEC=(H*3600)+(M*60)+S
IF I1=0 THEN K$="При завершении времени все задачи завершатся"
IF I1=1 THEN K$="При завершении времени компьютер выключится"
IF I1=2 THEN K$="При завершении времени компьютер перезапустится"
IF I1=3 THEN K$="При завершении времени таймер просто выключится"
*FONT CONSOLAS,20
OFF
CLS
FOR I=SEC TO 0 STEP -1
  ON CLOSE RETURN
  RECTANGLE 27*PS_T,85*PSY_T,400,100
  IF H>=0 OR H<10 THEN PRINT TAB(PS_T,PSY_T) "0"+STR$(H);
  IF H>=10 THEN PRINT TAB(PS_T,PSY_T) STR$(H)
  PRINT TAB(PS_T+2,PSY_T) " : "
  IF M>=0 OR M<10 THEN PRINT TAB(PS_T+5,PSY_T) "0"+STR$(M);
  IF M>=10 THEN PRINT TAB(PS_T+5,PSY_T) STR$(M)
  PRINT TAB(PS_T+7,PSY_T) " : "
  IF S>=0 OR S<10 THEN PRINT TAB(PS_T+10,PSY_T) "0"+STR$(S);
  IF S>=10 THEN PRINT TAB(PS_T+10,PSY_T) STR$(S):PRINT TAB(PS_T+12,PSY_T) " "
  PRINT TAB(PS_T-17,PSY_T+4) K$
  S=S-1
  IF S=-1 THEN S=59:M=M-1
  IF M=-1 THEN M=59:H=H-1
  IF I=0 THEN GOTO 5
  IF I<=60 THEN K=1+(1/(I/60)):COLOUR 1:SOUND 1,-15,240,K
  WAIT 100
NEXT I
5 ON:SYS "GetEnhMetaFile", @dir$+"rec_2s.mp3" TO hemf%
GOTO (100+I1)
100 SYS "ShellExecute",@hwnd%,0,@dir$+"taskkill.lnk",0,0,1:QUIT
101 SYS "ShellExecute",@hwnd%,0,@dir$+"shutdown.lnk",0,0,1
102 SYS "ShellExecute",@hwnd%,0,@dir$+"restart.lnk",0,0,1
103 QUIT
