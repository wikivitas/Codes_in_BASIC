      REM Переменные конфигурации
      PSX=36: REM Номер горизинтальной позиции настроечных и текущих значений таймера
      PSY=9: REM Номер вертикальной позиции настроечных и текущих значений таймера
      SND_T%=1: REM Если значение "1", сработает звук при окончании таймера
      CL_T%=1: REM Если значение "1", выключение окна заблокировано
      ON ERROR CLS:GOTO 5
      GWL_STYLE = -16
      WS_SIZEBOX = &40000
      WS_MAXIMIZEBOX = &10000
      SYS "GetWindowLong", @hwnd%, GWL_STYLE TO ws%
      SYS "SetWindowLong", @hwnd%, GWL_STYLE, ws% AND NOT (WS_SIZEBOX OR WS_MAXIMIZEBOX)
    5 H=0:M=0:S=0:I=0:I1=0

      *FONT CONSOLAS,45
      PROCT(16,3,"Таймер")
      *FONT CONSOLAS,15
      PROCT(39,15,"Для установки периода нажмите ENTER!")
   10 K$=GET$
      IF INKEY(-74) THEN
        CLS
        *FONT CONSOLAS,20
        PROCT(34,6,"1. Укажите время")
        PROCT(35,13,"Нажмите ENTER!")
        PROCT(36,15,"В меню: ESC")
        GOTO 20
      ELSE GOTO 10
      ENDIF

   20 COLOUR 1:PROCT(PSX+1+I,PSY+1,"^")
      PROCT(PSX+1+I,PSY+2,"|"):COLOUR 0

      IF H>=0 OR H<10 THEN PROCT(PSX,PSY,"0"+STR$(H))
      IF H>=10 THEN PROCT(PSX,PSY,STR$(H))
      PROCT(PSX+2,PSY," : ")
      IF M>=0 OR M<10 THEN PROCT(PSX+5,PSY,"0"+STR$(M))
      IF M>=10 THEN PROCT(PSX+5,PSY,STR$(M))
      PROCT(PSX+7,PSY," : ")
      IF S>=0 OR S<10 THEN PROCT(PSX+10,PSY,"0"+STR$(S))
      IF S>=10 THEN PROCT(PSX+10,PSY,STR$(S)):PROCT(PSX+12,PSY," ")
      K$=GET$
      IF INKEY(-122) AND I<10 THEN I+=5:PROCT(PSX+I-4,PSY+1," "):PROCT(PSX+I-4,PSY+2," "):GOTO 20
      IF INKEY(-26) AND I>0 THEN I-=5:PROCT(PSX+I+6,PSY+1," "):PROCT(PSX+I+6,PSY+2," "):GOTO 20
      IF INKEY(-58) THEN
        IF I=0 AND H<23 THEN H+=1: GOTO 20
        IF I=5 AND M<59 THEN M+=1: GOTO 20
        IF I=10 AND S<59 THEN S+=1: GOTO 20
      ENDIF
      IF INKEY(-42) THEN
        IF I=0 AND H>0 THEN H-=1: GOTO 20
        IF I=5 AND M>0 THEN M-=1: GOTO 20
        IF I=10 AND S>0 THEN S-=1: GOTO 20
      ENDIF
      IF INKEY(-74) THEN
        CLS:GOTO 30
      ELSE GOTO 20
      ENDIF

   30 PROCT(PSX,12,"Нажмите ENTER")
      PROCT(PSX+1,14,"В меню: ESC")
      PROCT(PSX-10,2,"Что сделать при завершении времени?")
      PROCT(PSX-4,6,"Завершить задачи")
      PROCT(PSX-4,7,"Выключить компьютер")
      PROCT(PSX-4,8,"Перезапустить компьютер")
      PROCT(PSX-4,9,"Ничего не делать")
      PROCT(PSX-7,6+I1,"=>")
   40 K$=GET$
      IF INKEY(-42) THEN
        IF I1<3 THEN I1+=1:PROCT(PSX-7,5+I1,"  "):GOTO 30
        IF I1=3 THEN GOTO 40
      ENDIF
      IF INKEY(-58) THEN
        IF I1>0 THEN I1-=1:PROCT(PSX-7,7+I1,"  "):GOTO 30
        IF I1=0 THEN GOTO 40
      ENDIF
      IF INKEY(-74) THEN
        GOTO 50
      ELSE GOTO 30
      ENDIF
      END

   50 SEC=(H*3600)+(M*60)+S
      K$="При завершении времени "
      IF I1=0 THEN K$+="все задачи завершатся"
      IF I1=1 THEN K$+="компьютер выключится"
      IF I1=2 THEN K$+="компьютер перезапустится"
      IF I1=3 THEN K$+="таймер просто выключится"
      *FONT CONSOLAS,20
      OFF
      CLS
      PROCT(PSX-17,PSY+4,K$)
      RECTANGLE 27*PSX,85*PSY,400,100
      PROCT(PSX+2,PSY," : "):PROCT(PSX+7,PSY," : ")
      IF CL_T%=1 THEN ON CLOSE RETURN
      FOR I=SEC TO 0 STEP -1
        A%=TIME
        IF H>=0 OR H<10 THEN PROCT(PSX,PSY,"0"+STR$(H))
        IF H>=10 THEN PROCT(PSX,PSY,STR$(H)+" ")
        IF M>=0 OR M<10 THEN PROCT(PSX+5,PSY,"0"+STR$(M))
        IF M>=10 THEN PROCT(PSX+5,PSY,STR$(M)+" ")
        IF S>=0 OR S<10 THEN PROCT(PSX+10,PSY,"0"+STR$(S))
        IF S>=10 THEN PROCT(PSX+10,PSY,STR$(S)+" ")
        S-=1
        IF S=-1 THEN S=59:M-=1
        IF M=-1 THEN M=59:H-=1
        IF I=0 THEN GOTO 60
        IF I<=60 THEN
          COLOUR 1
          IF SND_T%=1 THEN SOUND 1,-15,240,(1+(1/(I/60)))
        ENDIF
        WAIT 100-(TIME-A%)
      NEXT I
      DEFPROCT(U,V,A$)
      PRINTTAB(U,V)""A$;
      ENDPROC
   60 ON:SYS "GetEnhMetaFile", @dir$+"rec_2s.mp3" TO hemf%
      GOTO (100+I1)
  100 SYS "ShellExecute",@hwnd%,0,@dir$+"taskkill.lnk",0,0,1:QUIT
  101 SYS "ShellExecute",@hwnd%,0,@dir$+"shutdown.lnk",0,0,1
  102 SYS "ShellExecute",@hwnd%,0,@dir$+"restart.lnk",0,0,1
  103 QUIT

