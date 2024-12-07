
MUSEROFFS EQU 344 

AHEADER 0 ,'Q,',cfa_Qcom

 call cfa_com+00H
 DB 0C3H
AHEADER 0 ,'VECT',cfa_VECT

 call cfa_HEADER+00H
 call cfa_QVECTminusCODE+00H
 call cfa_COMPILEcom+00H
 call cfa_XLIT+00H
 DD 00H
 call cfa_Lcom+00H
 call cfa_QTOVALUEminusCODE+00H
 call cfa_COMPILEcom+00H
 call cfa_lessticgreat+00H
 call cfa_NOOP+00H
 call cfa_Qcom+00H
 DB 0C3H
AHEADER 0 ,'LASTWORD',cfa_LASTWORD

 DB 0C3H
AHEADER 0 ,'TL@',cfa_TL_ld

 call cfa_SL_ld+00H
 call cfa_DUP+00H
 DB 048H
 DB 0B8H
 DD 0FFFFFFFFH,00H
 call cfa_DUP+00H
 call cfa_Hdot+00H
 call cfa_AND+00H
 call cfa_DUP+00H
 call cfa_Hdot+00H
 DB 0C3H
AHEADER 0 ,'ZL@',cfa_ZL_ld

 call cfa_SL_ld+00H
 call cfa_DUP+00H
 DB 048H
 DB 0B8H
 DD 0FFFFFFFFH,00H
 call cfa_AND+00H
 DB 0C3H
AHEADER 0 ,'CONSTANT',cfa_CONSTANT

 call cfa_HEADER+00H
 call cfa_CONSTANTminusCODE+00H
 call cfa_COMPILEcom+00H
 call cfa_com+00H
 DB 0C3H
AHEADER 0 ,'ALIGN-NOP',cfa_ALIGNminusNOP

 call cfa_HERE+00H
 call cfa_DUP+00H
 call cfa_ROT+00H
 call cfa__2DUP+00H
 call cfa_MOD+00H
 call cfa_DUP+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_ALIGNminusNOP+038H-$-4
 call cfa_minus+00H
 call cfa_plus+00H
 DB 0E9H
 DD cfa_ALIGNminusNOP+03DH-$-4
 call cfa__2DROP+00H
 call cfa_OVER+00H
 call cfa_minus+00H
 call cfa_DUP+00H
 call cfa_ALLOT+00H
 call cfa_XLIT+00H
 DD 090H
 call cfa_FILL+00H
 DB 0C3H
AHEADER 0 ,'HIDE',cfa_HIDE

 call cfa_XLIT+00H
 DD 0CH
 call cfa_CminusSMUDGE+00H
 call cfa_Csave+00H
 call cfa_SMUDGE+00H
 DB 0C3H
AHEADER 0 ,'SMUDGE',cfa_SMUDGE

 call cfa_CminusSMUDGE+00H
 call cfa_C_ld+00H
 call cfa_LAST+00H
 call cfa__ld+00H
 call cfa__1plus+00H
 call cfa_C_ld+00H
 call cfa_CminusSMUDGE+00H
 call cfa_Csave+00H
 call cfa_LAST+00H
 call cfa__ld+00H
 call cfa__1plus+00H
 call cfa_Csave+00H
 DB 0C3H
AHEADER 0 ,'C-SMUDGE',cfa_CminusSMUDGE

 call cfa__USERminusCODE+00H
 DD reserve+0150H
AHEADER 0 ,'H-STDERR',cfa_HminusSTDERR

 call cfa__QVALUEminusCODE+00H
 DD 00H
 call cfa__QTOVALUEminusCODE+00H
 DD 01H
 DD 00H
AHEADER 0 ,'H-STDOUT',cfa_HminusSTDOUT

 call cfa__QVALUEminusCODE+00H
 DD 00H
 call cfa__QTOVALUEminusCODE+00H
 DD 01H
 DD 00H
AHEADER 0 ,'H-STDIN',cfa_HminusSTDIN

 call cfa__QVALUEminusCODE+00H
 DD 00H
 call cfa__QTOVALUEminusCODE+00H
 DD 00H
 DD 00H
AHEADER 0 ,'SHEADER',cfa_SHEADER

 call cfa__VECTminusCODE+00H
 DD cfa_YSHEADER+00H
 call cfa__TOVALUEminusCODE+00H
AHEADER 1 ,'}}',cfa_rskrsk

 call cfa_PREVIOUS+00H
 DB 0C3H
AHEADER 1 ,'{{',cfa_lsklsk

 call cfa_DEPTH+00H
 call cfa_greatR+00H
 call cfa_ALSO+00H
 call cfa_tic+00H
 call cfa_EXECUTE+00H
 call cfa_DEPTH+00H
 call cfa_Rgreat+00H
 call cfa_lessgreat+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_lsklsk+03DH-$-4
 call cfa__CONTEXT+00H
 call cfa_save+00H
 DB 0C3H
AHEADER 0 ,';MODULE',cfa__endMODULE

 call cfa_SETminusCURRENT+00H
 call cfa_PREVIOUS+00H
 DB 0C3H
AHEADER 0 ,'EXPORT',cfa__EXPORT

 call cfa_DUP+00H
 call cfa_SETminusCURRENT+00H
 DB 0C3H
AHEADER 0 ,'MODULE:',cfa_MODULEdcoma

 call cfa_greatIN+00H
 call cfa_A_ld+00H
 call cfa_lessticgreat+00H
 call cfa_tic+00H
 call cfa_CATCH+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_MODULEdcoma+056H-$-4
 call cfa_greatIN+00H
 call cfa_save+00H
 call cfa_VOCABULARY+00H
 call cfa_GETminusCURRENT+00H
 call cfa_ALSO+00H
 call cfa_LATEST+00H
 call cfa_NAMEgreat+00H
 call cfa_EXECUTE+00H
 call cfa_DEFINITIONS+00H
 DB 0E9H
 DD cfa_MODULEdcoma+074H-$-4
 call cfa_NIP+00H
 call cfa_GETminusCURRENT+00H
 call cfa_SWAP+00H
 call cfa_ALSO+00H
 call cfa_EXECUTE+00H
 call cfa_DEFINITIONS+00H
 DB 0C3H
AHEADER 0 ,'INIT',cfa_INIT

 call cfa_DECIMAL+00H
 call cfa_lessticgreat+00H
 call cfa_queSLITERAL2+00H
 call cfa_queSLITERAL+09H
 call cfa_lessticgreat+00H
 call cfa__QCONSTANTminusCODE+00H
 call cfa_CONSTANTminusCODE+09H
 call cfa_SPINIT+00H
 call cfa_COMMANDLINE+00H
 call cfa_queDUP+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_INIT+075H-$-4
 call cfa_lessticgreat+00H
 call cfa_EVALUATE+00H
 call cfa_CATCH+00H
 call cfa_queDUP+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_INIT+070H-$-4
 call cfa_lessticgreat+00H
 call cfa_ERROR+00H
 call cfa_CATCH+00H
 call cfa_DROP+00H
 DB 0E9H
 DD cfa_INIT+07FH-$-4
 call cfa_DROP+00H
 call cfa_TITLE+00H
 DB 090H
 call cfa_lessticgreat+00H
 call cfa_QUIT+00H
 call cfa_CATCH+00H
 call cfa_SAVEERR+00H
 call cfa_queDUP+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_INIT+0C7H-$-4
 call cfa_CR+00H
 call cfa_lessticgreat+00H
 call cfa_ERROR+00H
 call cfa_CATCH+00H
 call cfa_DROP+00H
 call cfa_CR+00H
 DB 0E9H
 DD cfa_INIT+0CCH-$-4
 call cfa_BYE+00H
 call cfa_SPINIT+00H
 DB 0EBH,0ADH
 DB 0C3H
AHEADER 0 ,'NH.',cfa_NHdot

 call cfa_EMIT+00H
 DB 0C3H
AHEADER 0 ,'MM',cfa_MM

 call cfa__SLITERALminusCODE+00H
 DB 04H
 DB 'MM.F',0
 DB 0C3H
AHEADER 0 ,'COMMANDLINE',cfa_COMMANDLINE

 call cfa_COMMAND_LINE+00H
 DB 090H
 DB 090H
 call cfa__1plus+00H
 call cfa_DUP+00H
 call cfa_C_ld+00H
 call cfa_BL+00H
 call cfa_Uless_equ+00H
 call cfa_QBRANCH+00H
;je  cfa_COMMANDLINE+07H
 DB 074H,0E0H
 call cfa_ASCIIZgreat+00H
 DB 0C3H
AHEADER 0 ,'RRR',cfa_RRR

 call cfa__1plus+00H
 call cfa_DUP+00H
 call cfa_DROP+00H
 DB 0C3H
AHEADER 0 ,'TTF',cfa_TTF

 call cfa__SLITERALminusCODE+00H
 DB 08H
 DB 'spf/TT.F',0
 DB 0C3H
AHEADER 0 ,'THTST',cfa_THTST

 call cfa_XLIT+00H
 DD 01H
 call cfa_THROW+00H
 DB 0C3H
AHEADER 0 ,'SPINIT',cfa_SPINIT

 call cfa_S0+00H
 call cfa_A_ld+00H
 call cfa_SPsave+00H
 DB 0C3H
AHEADER 0 ,'EMIT',cfa_EMIT

 call cfa__VECTminusCODE+00H
 DD cfa_EMIT_M+00H
 call cfa__TOVALUEminusCODE+00H
AHEADER 0 ,'TYPE',cfa_TYPE

 call cfa__VECTminusCODE+00H
 DD cfa_TYPE1+00H
 call cfa__TOVALUEminusCODE+00H
AHEADER 0 ,'ttt',cfa_ttt

 call cfa_TTT+00H
 DB 0C3H
AHEADER 0 ,'TTT',cfa_TTT

 call cfa__SLITERALminusCODE+00H
 DB 04H
 DB 'TT.F',0
 call cfa_INCLUDED+00H
 DB 0C3H
AHEADER 0 ,'TSTVAR',cfa_TSTVAR

 call cfa__CREATEminusCODE+00H
 DD 00H,00H
AHEADER 0 ,'TITLE',cfa_TITLE

 call cfa_CR+00H
 call cfa__SLITERALminusCODE+00H
 DB 0CH
 DB 'ANS FORTH 94',0
 call cfa_TYPE+00H
 call cfa_CR+00H
 call cfa__SLITERALminusCODE+00H
 DB 024H
 DB 'A.Cherezov  http://www.forth.org.ru/',0
 call cfa_TYPE+00H
 call cfa_CR+00H
 call cfa__SLITERALminusCODE+00H
 DB 023H
 DB 'M.Maksimov  http://www.chat.ru/~mak',0
 call cfa_TYPE+00H
 call cfa_CR+00H
 DB 0C3H
AHEADER 0 ,'REFILL',cfa_REFILL

 call cfa_SOURCEminusID+00H
 call cfa_XLIT+00H
 DD 0FFFFFFFFH
 call cfa__equ+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_REFILL+02CH-$-4
 call cfa_XLIT+00H
 DD 00H
 DB 0E9H
 DD cfa_REFILL+0BDH-$-4
 call cfa_SOURCEminusID+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_REFILL+0A5H-$-4
 call cfa_TIB+00H
 call cfa_C_divL+00H
 call cfa_SOURCEminusID+00H
 call cfa_READminusLINE+00H
 call cfa_CURSTR+00H
 call cfa__1plussave+00H
 call cfa_THROW+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_REFILL+091H-$-4
 call cfa_nTIB+00H
 call cfa_save+00H
 call cfa_greatIN+00H
 call cfa__0save+00H
 call cfa_lessPREgreat+00H
 call cfa_XLIT+00H
 DD 0FFFFFFFFH
 DB 0E9H
 DD cfa_REFILL+0A0H-$-4
 call cfa_DROP+00H
 call cfa_XLIT+00H
 DD 00H
 DB 0C3H
 DB 0E9H
 DD cfa_REFILL+0BDH-$-4
 call cfa_QUERY+00H
 call cfa_greatIN+00H
 call cfa__0save+00H
 call cfa_XLIT+00H
 DD 0FFFFFFFFH
 DB 0C3H
AHEADER 0 ,'QUERY',cfa_QUERY

 call cfa_TIB+00H
 call cfa_XLIT+00H
 DD 050H
 call cfa_ACCEPT+00H
 call cfa_nTIB+00H
 call cfa_save+00H
 DB 0C3H
AHEADER 0 ,'CONSOLE-HANDLES',cfa_CONSOLEminusHANDLES

 DB 0C3H
AHEADER 0 ,'<PRE>',cfa_lessPREgreat

 call cfa__VECTminusCODE+00H
 DD cfa_NOOP+00H
 call cfa__TOVALUEminusCODE+00H
AHEADER 0 ,'PSKIP',cfa_PSKIP

 DB 090H
 call cfa_DUP+00H
 call cfa_GetChar+00H
 call cfa_greatR+00H
 call cfa__equ+00H
 call cfa_Rgreat+00H
 call cfa_AND+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_PSKIP+036H-$-4
 call cfa_greatIN+00H
 call cfa__1plussave+00H
 DB 0EBH,0CBH
 call cfa_DROP+00H
 DB 0C3H
AHEADER 0 ,'PARSE',cfa_PARSE

 call cfa_CharAddr+00H
 call cfa_greatIN+00H
 call cfa__ld+00H
 call cfa_ROT+00H
 call cfa_SkipUpTo+00H
 call cfa_greatIN+00H
 call cfa__ld+00H
 call cfa_minus+00H
 call cfa_NEGATE+00H
 call cfa_greatIN+00H
 call cfa__1plussave+00H
 DB 0C3H
AHEADER 0 ,'PARSE-NAME',cfa_PARSEminusNAME

 call cfa_PARSEminusWORD+00H
 DB 0C3H
AHEADER 0 ,'NextWord',cfa_NextWord

 call cfa_PARSEminusWORD+00H
 DB 0C3H
AHEADER 0 ,'PARSE-WORD',cfa_PARSEminusWORD

 call cfa_SkipDelimiters+00H
 call cfa_ParseWord+00H
 call cfa_greatIN+00H
 call cfa__1plussave+00H
 DB 0C3H
AHEADER 0 ,'UPPER_NW',cfa_UPPER_NW

 call cfa_UPPER_SCR+00H
 call cfa_PLACE+00H
 call cfa_UPPER_SCR+00H
 call cfa_COUNT+00H
 call cfa__2DUP+00H
 call cfa_UPPER+00H
 DB 0C3H
AHEADER 0 ,'UPPER',cfa_UPPER

 call cfa_XLIT+00H
 DD 00H
 call cfa_YQDO+00H
 DQ cfa_UPPER+03CH
 call cfa_COUNT+00H
 call cfa_UPC+00H
 call cfa_OVER+00H
 call cfa__1minus+00H
 call cfa_Csave+00H
 DB 049H
 DB 0FFH,0C6H
 DB 049H
 DB 0FFH,0C7H
;jno cfa_UPPER+016H
 DB 071H,0DFH
 DB 041H
 DB 05EH
 DB 041H
 DB 05FH
 DB 059H
 call cfa_DROP+00H
 DB 0C3H
AHEADER 0 ,'UPC',cfa_UPC

 call cfa_DUP+00H
 call cfa_XLIT+00H
 DD 05AH
 call cfa_Ugreat+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_UPC+02CH-$-4
 call cfa_XLIT+00H
 DD 0DFH
 call cfa_AND+00H
 DB 0C3H
AHEADER 0 ,'UPPER_SCR',cfa_UPPER_SCR

 call cfa__CREATEminusCODE+00H
 DD 00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
AHEADER 0 ,'ParseWord',cfa_ParseWord

 call cfa_CharAddr+00H
 call cfa_greatIN+00H
 call cfa_A_ld+00H
 call cfa_SkipWord+00H
 call cfa_greatIN+00H
 call cfa_A_ld+00H
 call cfa_minus+00H
 call cfa_NEGATE+00H
 DB 0C3H
AHEADER 0 ,'SkipUpTo',cfa_SkipUpTo

 DB 090H
 DB 090H
 DB 090H
 call cfa_DUP+00H
 call cfa_GetChar+00H
 call cfa_greatR+00H
 call cfa_lessgreat+00H
 call cfa_Rgreat+00H
 call cfa_AND+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_SkipUpTo+038H-$-4
 call cfa_greatIN+00H
 call cfa__1plussave+00H
 DB 0EBH,0CBH
 call cfa_DROP+00H
 DB 0C3H
AHEADER 0 ,'SkipWord',cfa_SkipWord

 DB 090H
 call cfa_OnNotDelimiter+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_SkipWord+01DH-$-4
 call cfa_greatIN+00H
 call cfa__1plussave+00H
 DB 0EBH,0E4H
 DB 0C3H
AHEADER 0 ,'OnNotDelimiter',cfa_OnNotDelimiter

 call cfa_GetChar+00H
 call cfa_SWAP+00H
 call cfa_IsDelimiter+00H
 call cfa__0_equ+00H
 call cfa_AND+00H
 DB 0C3H
AHEADER 0 ,'SkipDelimiters',cfa_SkipDelimiters

 DB 090H
 DB 090H
 call cfa_OnDelimiter+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_SkipDelimiters+01EH-$-4
 call cfa_greatIN+00H
 call cfa__1plussave+00H
 DB 0EBH,0E4H
 call cfa_greatIN+00H
 call cfa_A_ld+00H
 call cfa_greatIN_WORD+00H
 call cfa_Lsave+00H
 DB 0C3H
AHEADER 0 ,'OnDelimiter',cfa_OnDelimiter

 call cfa_GetChar+00H
 call cfa_SWAP+00H
 call cfa_IsDelimiter+00H
 call cfa_AND+00H
 DB 0C3H
AHEADER 0 ,'GetChar',cfa_GetChar

 call cfa_EndOfChunk+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_GetChar+023H-$-4
 call cfa_XLIT+00H
 DD 00H
 call cfa_FALSE+00H
 DB 0E9H
 DD cfa_GetChar+02DH-$-4
 call cfa_PeekChar+00H
 call cfa_TRUE+00H
 DB 0C3H
AHEADER 0 ,'IsDelimiter',cfa_IsDelimiter

 call cfa_BL+00H
 call cfa__1plus+00H
 call cfa_less+00H
 DB 0C3H
AHEADER 0 ,'PeekChar',cfa_PeekChar

 call cfa_CharAddr+00H
 call cfa_C_ld+00H
 DB 0C3H
AHEADER 0 ,'CharAddr',cfa_CharAddr

 call cfa_SOURCE+00H
 call cfa_DROP+00H
 call cfa_greatIN+00H
 call cfa_A_ld+00H
 call cfa_plus+00H
 DB 0C3H
AHEADER 0 ,'EndOfChunk',cfa_EndOfChunk

 call cfa_greatIN+00H
 call cfa_A_ld+00H
 call cfa_SOURCE+00H
 call cfa_NIP+00H
 call cfa_less+00H
 call cfa__0_equ+00H
 DB 0C3H
AHEADER 0 ,'SOURCE!',cfa_SOURCEsave

 call cfa_nTIB+00H
 call cfa_save+00H
 call cfa_TIB+09H
 call cfa_greatIN+00H
 call cfa__0save+00H
 DB 0C3H
AHEADER 0 ,'SOURCE',cfa_SOURCE

 call cfa_TIB+00H
 call cfa_nTIB+00H
 call cfa__ld+00H
 DB 0C3H
AHEADER 0 ,'C/L',cfa_C_divL

 call cfa__QVALUEminusCODE+00H
 DD 00H
 call cfa__QTOVALUEminusCODE+00H
 DD 0200H
 DD 00H
AHEADER 0 ,'ZZZZRR',cfa_ZZZZRR

 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_ZZZZRR+0BH-$-4
 DB 0C3H
AHEADER 1 ,'RECURSE',cfa_RECURSE

 call cfa_queCOMP+00H
 call cfa_LASTminusNON+00H
 call cfa_DUP+00H
 call cfa__0_equ+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_RECURSE+02EH-$-4
 call cfa_DROP+00H
 call cfa_LATEST+00H
 call cfa_NAMEgreat+00H
 call cfa__COMPILEcom+00H
 DB 0C3H
AHEADER 1 ,'AGAIN',cfa_AGAIN

 call cfa_queCOMP+00H
 call cfa_XLIT+00H
 DD 03H
 call cfa_lessgreat+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_AGAIN+02CH-$-4
 call cfa_XLIT+00H
 DD 0FFFFF82AH
 call cfa_THROW+00H
 call cfa_DUP+00H
 call cfa_DP+00H
 call cfa_A_ld+00H
 call cfa__2plus+00H
 call cfa_minus+00H
 call cfa_DUP+00H
 call cfa_SHORTque+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_AGAIN+077H-$-4
 call cfa_XLIT+00H
 DD 0EBH
 call cfa_Ccom+00H
 call cfa_Ccom+00H
 call cfa_DROP+00H
 DB 0E9H
 DD cfa_AGAIN+081H-$-4
 call cfa_DROP+00H
 call cfa_BRANCHcom+00H
 DB 0C3H
AHEADER 1 ,'REPEAT',cfa__REPEAT

 call cfa_queCOMP+00H
 call cfa_XLIT+00H
 DD 03H
 call cfa_lessgreat+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa__REPEAT+02CH-$-4
 call cfa_XLIT+00H
 DD 0FFFFF82BH
 call cfa_THROW+00H
 call cfa_DUP+00H
 call cfa_DP+00H
 call cfa_A_ld+00H
 call cfa__2plus+00H
 call cfa_minus+00H
 call cfa_DUP+00H
 call cfa_SHORTque+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa__REPEAT+077H-$-4
 call cfa_XLIT+00H
 DD 0EBH
 call cfa_Ccom+00H
 call cfa_Ccom+00H
 call cfa_DROP+00H
 DB 0E9H
 DD cfa__REPEAT+081H-$-4
 call cfa_DROP+00H
 call cfa_BRANCHcom+00H
 call cfa_greatORESOLVE+00H
 DB 0C3H
AHEADER 1 ,'WHILE',cfa__WHILE

 call cfa_queCOMP+00H
 call cfa__IF+00H
 call cfa__2SWAP+00H
 DB 0C3H
AHEADER 1 ,'UNTIL',cfa_UNTIL

 call cfa_queCOMP+00H
 call cfa_XLIT+00H
 DD 03H
 call cfa_lessgreat+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_UNTIL+02CH-$-4
 call cfa_XLIT+00H
 DD 0FFFFF82CH
 call cfa_THROW+00H
 call cfa_queBRANCHcom+00H
 call cfa_XLIT+00H
 DD 0FFFFFF80H
 call cfa_DP+00H
 call cfa_A_ld+00H
 call cfa_XLIT+00H
 DD 04H
 call cfa_minus+00H
 call cfa__ld+00H
 call cfa_Uless+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_UNTIL+0BDH-$-4
 call cfa_DP+00H
 call cfa_A_ld+00H
 call cfa_XLIT+00H
 DD 05H
 call cfa_minus+00H
 call cfa_W_ld+00H
 call cfa_XLIT+00H
 DD 03F0H
 call cfa_plus+00H
 call cfa_DP+00H
 call cfa_A_ld+00H
 call cfa_XLIT+00H
 DD 06H
 call cfa_minus+00H
 call cfa_Wsave+00H
 call cfa_XLIT+00H
 DD 0FFFFFFFCH
 call cfa_ALLOT+00H
 DB 0C3H
AHEADER 1 ,'BEGIN',cfa_BEGIN

 call cfa_queCOMP+00H
 call cfa_XLIT+00H
 DD 04H
 call cfa_ALIGNminusNOP+00H
 call cfa_lessMARK+00H
 call cfa_XLIT+00H
 DD 03H
 DB 0C3H
AHEADER 1 ,'BREAK',cfa__BREAK

 call cfa_EXIT+00H
 call cfa_THEN+00H
 DB 0C3H
AHEADER 1 ,'THEN',cfa_THEN

 call cfa_queCOMP+00H
 call cfa_greatORESOLVE+00H
 DB 0C3H
AHEADER 1 ,'ELSE',cfa__ELSE

 call cfa_queCOMP+00H
 call cfa_DP+00H
 call cfa_A_ld+00H
 call cfa_BRANCHcom+00H
 call cfa_greatORESOLVE+00H
 call cfa_greatMARK+00H
 call cfa_XLIT+00H
 DD 02H
 DB 0C3H
AHEADER 1 ,'IF',cfa__IF

 call cfa_queCOMP+00H
 call cfa_DP+00H
 call cfa_A_ld+00H
 call cfa_queBRANCHcom+00H
 call cfa_greatMARK+00H
 call cfa_XLIT+00H
 DD 01H
 DB 0C3H
AHEADER 0 ,'>RESOLVE',cfa_greatRESOLVE

 call cfa_DUP+00H
 call cfa_XLIT+00H
 DD 01H
 call cfa__equ+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_greatRESOLVE+02DH-$-4
 call cfa_DROP+00H
 call cfa_greatRESOLVE1+00H
 DB 0E9H
 DD cfa_greatRESOLVE+059H-$-4
 call cfa_XLIT+00H
 DD 02H
 call cfa_lessgreat+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_greatRESOLVE+054H-$-4
 call cfa_XLIT+00H
 DD 0FFFFF829H
 call cfa_THROW+00H
 call cfa_greatRESOLVE1+00H
 DB 0C3H
AHEADER 0 ,'>RESOLVE1',cfa_greatRESOLVE1

 call cfa_HERE+00H
 call cfa_OVER+00H
 call cfa_minus+00H
 call cfa_XLIT+00H
 DD 04H
 call cfa_minus+00H
 call cfa_SWAP+00H
 call cfa_Lsave+00H
 DB 0C3H
AHEADER 0 ,'>ORESOLVE',cfa_greatORESOLVE

 call cfa_DUP+00H
 call cfa_XLIT+00H
 DD 01H
 call cfa__equ+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_greatORESOLVE+02DH-$-4
 call cfa_DROP+00H
 call cfa_greatORESOLVE1+00H
 DB 0E9H
 DD cfa_greatORESOLVE+059H-$-4
 call cfa_XLIT+00H
 DD 02H
 call cfa_lessgreat+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_greatORESOLVE+054H-$-4
 call cfa_XLIT+00H
 DD 0FFFFF829H
 call cfa_THROW+00H
 call cfa_greatORESOLVE1+00H
 DB 0C3H
AHEADER 0 ,'>ORESOLVE1',cfa_greatORESOLVE1

 call cfa_DP+00H
 call cfa_A_ld+00H
 call cfa_OVER+00H
 call cfa_minus+00H
 call cfa_XLIT+00H
 DD 04H
 call cfa_minus+00H
 call cfa_SWAP+00H
 call cfa_Lsave+00H
 DB 0C3H
AHEADER 0 ,'<MARK',cfa_lessMARK

 call cfa_HERE+00H
 DB 0C3H
AHEADER 0 ,'>MARK',cfa_greatMARK

 call cfa_DP+00H
 call cfa_A_ld+00H
 call cfa_XLIT+00H
 DD 04H
 call cfa_minus+00H
 DB 0C3H
AHEADER 0 ,'?BRANCH,',cfa_queBRANCHcom

 call cfa_lessticgreat+00H
 call cfa_QBRANCH+00H
 call cfa__COMPILEcom+00H
 call cfa_XLIT+00H
 DD 084H
 call cfa_XLIT+00H
 DD 0FH
 call cfa_Ccom+00H
 call cfa_Ccom+00H
 call cfa_DUP+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_queBRANCHcom+058H-$-4
 call cfa_DP+00H
 call cfa_A_ld+00H
 call cfa_XLIT+00H
 DD 04H
 call cfa_plus+00H
 call cfa_minus+00H
 call cfa_Lcom+00H
 DB 0C3H
AHEADER 0 ,'CLIT,',cfa_CLITcom

 call cfa_COUNT+00H
 call cfa_CLITERALminusCODE+00H
 call cfa_COMPILEcom+00H
 call cfa_Sdticcom+00H
 call cfa_XLIT+00H
 DD 00H
 call cfa_Ccom+00H
 DB 0C3H
AHEADER 0 ,'SLIT,',cfa_SLITcom

 call cfa_SLITERALminusCODE+00H
 call cfa_COMPILEcom+00H
 call cfa_Sdticcom+00H
 call cfa_XLIT+00H
 DD 00H
 call cfa_Ccom+00H
 DB 0C3H
AHEADER 0 ,'ALIGNED',cfa_ALIGNED

 call cfa_ALIGNminusBYTES+00H
 call cfa__ld+00H
 call cfa_DUP+00H
 call cfa__0_equ+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_ALIGNED+033H-$-4
 call cfa__1plus+00H
 call cfa_DUP+00H
 call cfa_ALIGNminusBYTES+00H
 call cfa_save+00H
 call cfa__2DUP+00H
 call cfa_MOD+00H
 call cfa_DUP+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_ALIGNED+05CH-$-4
 call cfa_minus+00H
 call cfa_plus+00H
 DB 0E9H
 DD cfa_ALIGNED+061H-$-4
 call cfa__2DROP+00H
 DB 0C3H
AHEADER 0 ,'ALIGN-BYTES',cfa_ALIGNminusBYTES

 call cfa__USERminusCODE+00H
 DD reserve+0148H
AHEADER 0 ,'ALIGN',cfa_ALIGN

 call cfa_DP+00H
 call cfa_A_ld+00H
 call cfa_ALIGNED+00H
 call cfa_DP+00H
 call cfa_A_ld+00H
 call cfa_minus+00H
 call cfa_ALLOT+00H
 DB 0C3H
AHEADER 0 ,'",',cfa_dticcom

 call cfa_COUNT+00H
 call cfa_Sdticcom+00H
 DB 0C3H
AHEADER 0 ,'S",',cfa_Sdticcom

 call cfa_DUP+00H
 call cfa_Ccom+00H
 call cfa_Scom+00H
 DB 0C3H
AHEADER 0 ,'S,',cfa_Scom

 call cfa_DP+00H
 call cfa__ld+00H
 call cfa_SWAP+00H
 call cfa_DUP+00H
 call cfa_ALLOT+00H
 call cfa_CMOVE+00H
 DB 0C3H
AHEADER 0 ,'DLIT,',cfa_DLITcom

 call cfa_SWAP+00H
 call cfa_LITcom+00H
 call cfa_LITcom+00H
 DB 0C3H
AHEADER 0 ,'LIT,',cfa_LITcom

 call cfa_ticDUP_V+00H
 call cfa_COMPILEcom+00H
 call cfa_XLIT+00H
 DD 048H
 call cfa_Ccom+00H
 call cfa_XLIT+00H
 DD 0B8H
 call cfa_Ccom+00H
 call cfa_Qcom+00H
 DB 0C3H
AHEADER 0 ,'RET,',cfa_RETcom

 call cfa_XLIT+00H
 DD 0C3H
 call cfa_Ccom+00H
 DB 0C3H
AHEADER 0 ,'BRANCH,',cfa_BRANCHcom

 call cfa_XLIT+00H
 DD 0E9H
 call cfa_Ccom+00H
 call cfa_DUP+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_BRANCHcom+03BH-$-4
 call cfa_DP+00H
 call cfa_A_ld+00H
 call cfa_XLIT+00H
 DD 04H
 call cfa_plus+00H
 call cfa_minus+00H
 call cfa_Lcom+00H
 DB 0C3H
AHEADER 0 ,'COMPILE,',cfa_COMPILEcom

 call cfa__COMPILEcom+00H
 DB 0C3H
AHEADER 0 ,'_COMPILE,',cfa__COMPILEcom

 call cfa_XLIT+00H
 DD 0E8H
 call cfa_Ccom+00H
 call cfa_DP+00H
 call cfa_A_ld+00H
 call cfa_XLIT+00H
 DD 04H
 call cfa_plus+00H
 call cfa_minus+00H
 call cfa_Lcom+00H
 DB 0C3H
AHEADER 0 ,'HERE',cfa_HERE

 call cfa_DP+00H
 call cfa_A_ld+00H
 DB 0C3H
AHEADER 0 ,'WRITE-LINE',cfa_WRITEminusLINE

 call cfa_DUP+00H
 call cfa_greatR+00H
 call cfa_WRITEminusFILE+00H
 call cfa_queDUP+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_WRITEminusLINE+024H-$-4
 DB 048H
 DB 083H,0C4H,08H
 DB 0C3H
 call cfa_LT+00H
 call cfa_LTL+00H
 call cfa__ld+00H
 call cfa_Rgreat+00H
 call cfa_WRITEminusFILE+00H
 DB 0C3H
AHEADER 0 ,'READ-LINE',cfa_READminusLINE

 call cfa_DUP+00H
 call cfa_greatR+00H
 call cfa_FILEminusPOSITION+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_READminusLINE+031H-$-4
 call cfa__2DROP+00H
 call cfa_XLIT+00H
 DD 00H
 call cfa_XLIT+00H
 DD 00H
 call cfa__fp1+00H
 call cfa_save+00H
 call cfa__fp2+00H
 call cfa_save+00H
 call cfa__1plus+00H
 call cfa_OVER+00H
 call cfa__addr+00H
 call cfa_save+00H
 call cfa_R_ld+00H
 call cfa_READminusFILE+00H
 call cfa_queDUP+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_READminusLINE+094H-$-4
 call cfa_NIP+00H
 DB 048H
 DB 083H,0C4H,08H
 call cfa_XLIT+00H
 DD 00H
 call cfa_XLIT+00H
 DD 00H
 call cfa_ROT+00H
 DB 0C3H
 call cfa_DUP+00H
 call cfa_greatR+00H
 call cfa__0_equ+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_READminusLINE+0D2H-$-4
 DB 048H
 DB 083H,0C4H,08H
 DB 048H
 DB 083H,0C4H,08H
 call cfa_XLIT+00H
 DD 00H
 call cfa_XLIT+00H
 DD 00H
 call cfa_XLIT+00H
 DD 00H
 DB 0C3H
 call cfa__addr+00H
 call cfa__ld+00H
 call cfa_R_ld+00H
 call cfa_LT+00H
 call cfa__1plus+00H
 call cfa_XLIT+00H
 DD 01H
 call cfa_SEARCH+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_READminusLINE+01A4H-$-4
 call cfa_DROP+00H
 call cfa__addr+00H
 call cfa__ld+00H
 call cfa_minus+00H
 call cfa_DUP+00H
 call cfa__1plus+00H
 call cfa_SgreatD+00H
 call cfa__fp2+00H
 call cfa__ld+00H
 call cfa__fp1+00H
 call cfa__ld+00H
 call cfa_Dplus+00H
 DB 048H
 DB 083H,0C4H,08H
 call cfa_Rgreat+00H
 call cfa_REPOSITIONminusFILE+00H
 call cfa_DROP+00H
 call cfa_DUP+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_READminusLINE+019FH-$-4
 call cfa_DUP+00H
 call cfa__addr+00H
 call cfa__ld+00H
 call cfa_plus+00H
 call cfa__1minus+00H
 call cfa_C_ld+00H
 call cfa_XLIT+00H
 DD 0DH
 call cfa__equ+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_READminusLINE+019FH-$-4
 call cfa__1minus+00H
 DB 0E9H
 DD cfa_READminusLINE+01B2H-$-4
 call cfa__2DROP+00H
 call cfa_Rgreat+00H
 DB 048H
 DB 083H,0C4H,08H
 call cfa_TRUE+00H
 call cfa_XLIT+00H
 DD 00H
 DB 0C3H
AHEADER 0 ,'_addr',cfa__addr

 call cfa__USERminusCODE+00H
 DD reserve+0140H
AHEADER 0 ,'_fp2',cfa__fp2

 call cfa__USERminusCODE+00H
 DD reserve+0138H
AHEADER 0 ,'_fp1',cfa__fp1

 call cfa__USERminusCODE+00H
 DD reserve+0130H
AHEADER 0 ,'CREATE-FILE-SHARED',cfa_CREATEminusFILEminusSHARED

 call cfa_greatR+00H
 call cfa_FILEminusBUFF+00H
 call cfa_ASCIIminusZ+00H
 call cfa_Rgreat+00H
 call cfa_ZCREATEminusFILEminusSHARED+00H
 DB 0C3H
AHEADER 0 ,'CREATE-FILE',cfa_CREATEminusFILE

 call cfa_greatR+00H
 call cfa_FILEminusBUFF+00H
 call cfa_ASCIIminusZ+00H
 call cfa_Rgreat+00H
 call cfa_ZCREATEminusFILE+00H
 DB 0C3H
AHEADER 0 ,'OPEN-FILE-SHARED',cfa_OPENminusFILEminusSHARED

 call cfa_greatR+00H
 call cfa_FILEminusBUFF+00H
 call cfa_ASCIIminusZ+00H
 call cfa_Rgreat+00H
 call cfa_ZOPENminusFILEminusSHARED+00H
 DB 0C3H
AHEADER 0 ,'OPEN-FILE',cfa_OPENminusFILE

 call cfa_greatR+00H
 call cfa_FILEminusBUFF+00H
 call cfa_ASCIIminusZ+00H
 call cfa_Rgreat+00H
 call cfa_ZOPENminusFILE+00H
 DB 0C3H
AHEADER 0 ,'FILE-BUFF',cfa_FILEminusBUFF

 call cfa__USERminusCODE+00H
 DD reserve+028H
AHEADER 0 ,'FILE_ATTRIBUTE_ARCHIVE',cfa__FILE_ATTRIBUTE_ARCHIVE

 call cfa__CONSTANTminusCODE+00H
 DD 014H
AHEADER 0 ,'OPEN_EXISTING',cfa__OPEN_EXISTING

 call cfa__CONSTANTminusCODE+00H
 DD 03H
AHEADER 0 ,'CREATE_ALWAYS',cfa__CREATE_ALWAYS

 call cfa__CONSTANTminusCODE+00H
 DD 02H
AHEADER 0 ,'lpNumberOfBytesWritten',cfa_lpNumberOfBytesWritten

 call cfa__USERminusCODE+00H
 DD reserve+020H
AHEADER 0 ,'lpNumberOfBytesRead',cfa_lpNumberOfBytesRead

 call cfa__USERminusCODE+00H
 DD reserve+018H
AHEADER 0 ,'UNIX-LINES',cfa_UNIXminusLINES

 call cfa_XLIT+00H
 DD 0A0AH
 call cfa_LT+00H
 call cfa_save+00H
 call cfa_XLIT+00H
 DD 01H
 call cfa_LTL+00H
 call cfa_save+00H
 DB 0C3H
AHEADER 0 ,'DOS-LINES',cfa_DOSminusLINES

 call cfa_XLIT+00H
 DD 0A0DH
 call cfa_LT+00H
 call cfa_save+00H
 call cfa_XLIT+00H
 DD 02H
 call cfa_LTL+00H
 call cfa_save+00H
 DB 0C3H
AHEADER 0 ,'LTL',cfa_LTL

 call cfa__CREATEminusCODE+00H
 DD 02H,00H
AHEADER 0 ,'LT',cfa_LT

 call cfa__CREATEminusCODE+00H
 DD 0A0D0A0DH,0FC9AD8E8H
AHEADER 0 ,'KEY',cfa_KEY

 call cfa__VECTminusCODE+00H
 DD cfa_OS_KEY+00H
 call cfa__TOVALUEminusCODE+00H
AHEADER 0 ,'KEY?',cfa_KEYque

 call cfa__VECTminusCODE+00H
 DD cfa_EKEYque+00H
 call cfa__TOVALUEminusCODE+00H
AHEADER 0 ,'PENDING-CHAR',cfa_PENDINGminusCHAR

 call cfa__CREATEminusCODE+00H
 DD 00H,00H
AHEADER 0 ,'DO-KEY?',cfa_DOminusKEYque

 call cfa__VECTminusCODE+00H
 DD cfa_NOOP+00H
 call cfa__TOVALUEminusCODE+00H
AHEADER 0 ,'SPACES',cfa_SPACES

 call cfa_DUP+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_SPACES+021H-$-4
 call cfa_BL+00H
 call cfa_EMIT+00H
 call cfa__1minus+00H
 DB 0EBH,0DFH
 call cfa_DROP+00H
 DB 0C3H
AHEADER 0 ,'SPACE',cfa_SPACE

 call cfa_BL+00H
 call cfa_EMIT+00H
 DB 0C3H
AHEADER 0 ,'BL',cfa_BL

 call cfa__CONSTANTminusCODE+00H
 DD 020H
AHEADER 0 ,'KEY_EVENT',cfa__KEY_EVENT

 call cfa__CONSTANTminusCODE+00H
 DD 01H
AHEADER 0 ,'ControlKeysMask',cfa_ControlKeysMask

 call cfa_XLIT+00H
 DD (cfa_INPUT_RECORD+015H) and 0ffffffffh
 call cfa__ld+00H
 DB 0C3H
AHEADER 0 ,'INPUT_RECORD',cfa_INPUT_RECORD

 call cfa__CREATEminusCODE+00H
 DD 00H,00H
 DB 00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H
AHEADER 0 ,'B_CR',cfa_B_CR

 call cfa_XLIT+00H
 DD 0DH
 call cfa_EMIT+00H
 call cfa_XLIT+00H
 DD 0AH
 call cfa_EMIT+00H
 DB 0C3H
AHEADER 0 ,'CR',cfa_CR

 call cfa__VECTminusCODE+00H
 DD cfa_B_CR+00H
 call cfa__TOVALUEminusCODE+00H
AHEADER 0 ,'LAST_CUR',cfa_LAST_CUR

 call cfa__CREATEminusCODE+00H
 DD 00H,00H
 DB 00H,00H,00H
 DB 00H,00H,00H,00H,00H
AHEADER 0 ,'SWITCH_CHAR',cfa_SWITCH_CHAR

 call cfa_DUP+00H
 call cfa_XLIT+00H
 DD 061H
 call cfa_XLIT+00H
 DD 07AH
 call cfa__1plus+00H
 call cfa_WITHIN+00H
 call cfa_OVER+00H
 call cfa_XLIT+00H
 DD 041H
 call cfa_XLIT+00H
 DD 05AH
 call cfa__1plus+00H
 call cfa_WITHIN+00H
 call cfa_OR+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_SWITCH_CHAR+060H-$-4
 call cfa_XLIT+00H
 DD 020H
 call cfa_XOR+00H
 DB 0C3H
AHEADER 0 ,'_EMIT',cfa__EMIT

 DB 0C3H
AHEADER 0 ,'SCREEN-HEIGHT-S',cfa_SCREENminusHEIGHTminusS

 call cfa__QVALUEminusCODE+00H
 DD 00H
 call cfa__QTOVALUEminusCODE+00H
 DD 0150H
 DD 00H
AHEADER 0 ,'SCREEN-WIDTH-S',cfa_SCREENminusWIDTHminusS

 call cfa__QVALUEminusCODE+00H
 DD 00H
 call cfa__QTOVALUEminusCODE+00H
 DD 0200H
 DD 00H
AHEADER 0 ,'SCREEN-HEIGHT',cfa_SCREENminusHEIGHT

 call cfa__QVALUEminusCODE+00H
 DD 00H
 call cfa__QTOVALUEminusCODE+00H
 DD 0300H
 DD 00H
AHEADER 0 ,'SCREEN-WIDTH',cfa_SCREENminusWIDTH

 call cfa__QVALUEminusCODE+00H
 DD 00H
 call cfa__QTOVALUEminusCODE+00H
 DD 0400H
 DD 00H
AHEADER 0 ,'TYPE1',cfa_TYPE1

 call cfa_HminusSTDOUT+00H
 call cfa_WRITEminusFILE+00H
 call cfa_DROP+00H
 DB 0C3H
AHEADER 0 ,'TYPE_M',cfa_TYPE_M

 call cfa_XLIT+00H
 DD 00H
 call cfa_YQDO+00H
 DQ cfa_TYPE_M+02DH
 call cfa_COUNT+00H
 call cfa_EMIT+00H
 DB 049H
 DB 0FFH,0C6H
 DB 049H
 DB 0FFH,0C7H
;jno cfa_TYPE_M+016H
 DB 071H,0EEH
 DB 041H
 DB 05EH
 DB 041H
 DB 05FH
 DB 059H
 call cfa_DROP+00H
 DB 0C3H
AHEADER 0 ,'ACCEPT',cfa_ACCEPT

 call cfa__VECTminusCODE+00H
 DD cfa_ACCEPT1+00H
 call cfa__TOVALUEminusCODE+00H
AHEADER 0 ,'ACCEPT1',cfa_ACCEPT1

 call cfa_HminusSTDIN+00H
 call cfa_READminusFILE+00H
 call cfa_DROP+00H
 DB 0C3H
AHEADER 0 ,'ACCEPT0',cfa_ACCEPT0

 call cfa_OVER+00H
 call cfa_plus+00H
 call cfa__1minus+00H
 call cfa_OVER+00H
 call cfa_NMNM+00H
 call cfa_KEY+00H
 call cfa_DUP+00H
 call cfa_XLIT+00H
 DD 0AH
 call cfa__equ+00H
 call cfa_OVER+00H
 call cfa_XLIT+00H
 DD 0DH
 call cfa__equ+00H
 call cfa_OR+00H
 call cfa__0_equ+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_ACCEPT0+017DH-$-4
 call cfa_DUP+00H
 call cfa_XLIT+00H
 DD 01BH
 call cfa__equ+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_ACCEPT0+090H-$-4
 call cfa_DROP+00H
 call cfa_DUP+00H
 call cfa_C_ld+00H
 call cfa_EMIT+00H
 DB 0E9H
 DD cfa_ACCEPT0+0169H-$-4
 call cfa_DUP+00H
 call cfa_XLIT+00H
 DD 08H
 call cfa__equ+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_ACCEPT0+0D6H-$-4
 call cfa_EMIT+00H
 call cfa__2minus+00H
 call cfa_greatR+00H
 call cfa_OVER+00H
 call cfa__1minus+00H
 call cfa_Rgreat+00H
 call cfa_UMAX+00H
 DB 0E9H
 DD cfa_ACCEPT0+0169H-$-4
 call cfa_DUP+00H
 call cfa_XLIT+00H
 DD 09H
 call cfa__equ+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_ACCEPT0+0155H-$-4
 call cfa_DROP+00H
 call cfa_DUP+00H
 call cfa_XLIT+00H
 DD 08H
 call cfa_BLANK+00H
 call cfa_greatR+00H
 call cfa_OVER+00H
 call cfa_Rgreat+00H
 call cfa_SWAP+00H
 call cfa_OVER+00H
 call cfa_minus+00H
 call cfa_XLIT+00H
 DD 08H
 call cfa__div+00H
 call cfa__1plus+00H
 call cfa_XLIT+00H
 DD 08H
 call cfa__mul+00H
 call cfa_plus+00H
 DB 0E9H
 DD cfa_ACCEPT0+0169H-$-4
 call cfa_DUP+00H
 call cfa_EMIT+00H
 call cfa_OVER+00H
 call cfa_Csave+00H
 call cfa__1plus+00H
 call cfa_OVER+00H
 call cfa_UMIN+00H
 DB 0E9H
 DD cfa_ACCEPT0+019H-$-4
 call cfa_DROP+00H
 call cfa_NIP+00H
 call cfa_minus+00H
 call cfa_NEGATE+00H
 call cfa_CR+00H
 DB 0C3H
AHEADER 0 ,'NMNM',cfa_NMNM

 call cfa_XLIT+00H
 DD 00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_NMNM+014H-$-4
 DB 0C3H
AHEADER 0 ,'>NUMBER',cfa_greatNUMBER

 call cfa_DUP+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_greatNUMBER+099H-$-4
 call cfa_greatR+00H
 call cfa_DUP+00H
 call cfa_greatR+00H
 call cfa_C_ld+00H
 call cfa_BASE+00H
 call cfa__ld+00H
 call cfa_DIGIT+00H
 call cfa__0_equ+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_greatNUMBER+04EH-$-4
 call cfa_Rgreat+00H
 call cfa_Rgreat+00H
 DB 0C3H
 call cfa_SWAP+00H
 call cfa_BASE+00H
 call cfa__ld+00H
 call cfa_UM_mul+00H
 call cfa_DROP+00H
 call cfa_ROT+00H
 call cfa_BASE+00H
 call cfa__ld+00H
 call cfa_UM_mul+00H
 call cfa_Dplus+00H
 call cfa_Rgreat+00H
 call cfa__1plus+00H
 call cfa_Rgreat+00H
 call cfa__1minus+00H
 DB 0E9H
 DD cfa_greatNUMBER+00H-$-4
 call cfa_DBG+00H
 DB 0C3H
AHEADER 0 ,'DIGIT',cfa_DIGIT

 call cfa_greatR+00H
 call cfa_XLIT+00H
 DD 030H
 call cfa_minus+00H
 call cfa_XLIT+00H
 DD 0AH
 call cfa_OVER+00H
 call cfa_Uless+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_DIGIT+0E7H-$-4
 call cfa_DUP+00H
 call cfa_XLIT+00H
 DD 041H
 call cfa_XLIT+00H
 DD 030H
 call cfa_minus+00H
 call cfa_less+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_DIGIT+070H-$-4
 DB 048H
 DB 083H,0C4H,08H
 call cfa_DROP+00H
 call cfa_XLIT+00H
 DD 00H
 DB 0C3H
 call cfa_DUP+00H
 call cfa_XLIT+00H
 DD 061H
 call cfa_XLIT+00H
 DD 030H
 call cfa_minus+00H
 call cfa__1minus+00H
 call cfa_great+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_DIGIT+0BDH-$-4
 call cfa_XLIT+00H
 DD 061H
 call cfa_XLIT+00H
 DD 041H
 call cfa_minus+00H
 call cfa_minus+00H
 call cfa_XLIT+00H
 DD 041H
 call cfa_XLIT+00H
 DD 030H
 call cfa_minus+00H
 call cfa_XLIT+00H
 DD 0AH
 call cfa_minus+00H
 call cfa_minus+00H
 call cfa_Rgreat+00H
 call cfa_OVER+00H
 call cfa_Ugreat+00H
 call cfa_DUP+00H
 call cfa__0_equ+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_DIGIT+0110H-$-4
 call cfa_NIP+00H
 DB 0C3H
AHEADER 0 ,'(.")',cfa__cdotdticcend

 call cfa_COUNT+00H
 call cfa_TYPE+00H
 DB 0C3H
AHEADER 0 ,'DUMP',cfa_DUMP

 call cfa_DUP+00H
 call cfa__0_equ+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_DUMP+01BH-$-4
 call cfa__2DROP+00H
 DB 0C3H
 call cfa_BASE+00H
 call cfa_A_ld+00H
 call cfa_greatR+00H
 call cfa_HEX+00H
 call cfa_XLIT+00H
 DD 0FH
 call cfa_plus+00H
 call cfa_XLIT+00H
 DD 010H
 call cfa_U_div+00H
 call cfa_XLIT+00H
 DD 00H
 call cfa_YDO+00H
 DQ cfa_DUMP+0125H
 call cfa_CR+00H
 call cfa_DUP+00H
 call cfa_XLIT+00H
 DD 04H
 call cfa_dot0+00H
 call cfa_SPACE+00H
 call cfa_SPACE+00H
 call cfa_DUP+00H
 call cfa_XLIT+00H
 DD 010H
 call cfa_XLIT+00H
 DD 00H
 call cfa_YDO+00H
 DQ cfa_DUMP+0101H
 call cfa_DUP+00H
 DB 04CH
 DB 089H,0F0H
 call cfa_XLIT+00H
 DD 03H
 call cfa_AND+00H
 call cfa__0_equ+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_DUMP+0D2H-$-4
 call cfa_SPACE+00H
 call cfa_DUP+00H
 call cfa_C_ld+00H
 call cfa_XLIT+00H
 DD 02H
 call cfa_dot0+00H
 call cfa_SPACE+00H
 call cfa__1plus+00H
 DB 049H
 DB 0FFH,0C6H
 DB 049H
 DB 0FFH,0C7H
;jno cfa_DUMP+0A7H
 DB 071H,0ABH
 DB 041H
 DB 05EH
 DB 041H
 DB 05FH
 DB 059H
 call cfa_SWAP+00H
 call cfa_XLIT+00H
 DD 010H
 call cfa_PTYPE+00H
 DB 049H
 DB 0FFH,0C6H
 DB 049H
 DB 0FFH,0C7H
 DW 0810FH
 DD cfa_DUMP+061H-$-4
 DB 041H
 DB 05EH
 DB 041H
 DB 05FH
 DB 059H
 call cfa_DROP+00H
 call cfa_Rgreat+00H
 call cfa_BASE+00H
 call cfa_save+00H
 DB 0C3H
AHEADER 0 ,'PTYPE',cfa_PTYPE

 call cfa_DUP+00H
 call cfa__0great+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_PTYPE+035H-$-4
 call cfa__1minus+00H
 call cfa_SWAP+00H
 call cfa_COUNT+00H
 call cfa_greatPRT+00H
 call cfa_EMIT+00H
 call cfa_SWAP+00H
 DB 0EBH,0CBH
 call cfa__2DROP+00H
 DB 0C3H
AHEADER 0 ,'>PRT',cfa_greatPRT

 call cfa_DUP+00H
 call cfa_BL+00H
 call cfa_Uless+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_greatPRT+028H-$-4
 call cfa_DROP+00H
 call cfa_XLIT+00H
 DD 02EH
 DB 0C3H
AHEADER 0 ,'.0',cfa_dot0

 call cfa_greatR+00H
 call cfa_XLIT+00H
 DD 00H
 call cfa_lessn+00H
 call cfa_nS+00H
 call cfa_ngreat+00H
 call cfa_Rgreat+00H
 call cfa_OVER+00H
 call cfa_minus+00H
 call cfa_XLIT+00H
 DD 00H
 call cfa_MAX+00H
 call cfa_DUP+00H
 call cfa__0great+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_dot0+064H-$-4
 call cfa__1minus+00H
 call cfa_XLIT+00H
 DD 030H
 call cfa_EMIT+00H
 DB 0EBH,0D6H
 call cfa_DROP+00H
 call cfa_TYPE+00H
 DB 0C3H
AHEADER 0 ,'H.',cfa_Hdot

 call cfa_BASE+00H
 call cfa_A_ld+00H
 call cfa_SWAP+00H
 call cfa_HEX+00H
 call cfa_Udot+00H
 call cfa_BASE+00H
 call cfa_save+00H
 DB 0C3H
AHEADER 0 ,'U.',cfa_Udot

 call cfa_UgreatD+00H
 call cfa_Ddot+00H
 DB 0C3H
AHEADER 0 ,'U.R',cfa_UdotR

 call cfa_XLIT+00H
 DD 00H
 call cfa_SWAP+00H
 call cfa_DdotR+00H
 DB 0C3H
AHEADER 0 ,'.R',cfa_dotR

 call cfa_greatR+00H
 call cfa_SgreatD+00H
 call cfa_Rgreat+00H
 call cfa_DdotR+00H
 DB 0C3H
AHEADER 0 ,'D.R',cfa_DdotR

 call cfa_greatR+00H
 call cfa__cDdotcend+00H
 call cfa_Rgreat+00H
 call cfa_OVER+00H
 call cfa_minus+00H
 call cfa__0MAX+00H
 call cfa_SPACES+00H
 call cfa_TYPE+00H
 DB 0C3H
AHEADER 0 ,'.',cfa_dot

 call cfa_SgreatD+00H
 call cfa_Ddot+00H
 DB 0C3H
AHEADER 0 ,'D.',cfa_Ddot

 call cfa__cDdotcend+00H
 call cfa_TYPE+00H
 call cfa_SPACE+00H
 DB 0C3H
AHEADER 0 ,'(D.)',cfa__cDdotcend

 call cfa_DUP+00H
 call cfa_greatR+00H
 call cfa_DABS+00H
 call cfa_lessn+00H
 call cfa_nS+00H
 call cfa_Rgreat+00H
 call cfa_SIGN+00H
 call cfa_ngreat+00H
 DB 0C3H
AHEADER 0 ,'SIGN',cfa_SIGN

 call cfa__0less+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_SIGN+01EH-$-4
 call cfa_XLIT+00H
 DD 02DH
 call cfa_HOLD+00H
 DB 0C3H
AHEADER 0 ,'#>',cfa_ngreat

 call cfa__2DROP+00H
 call cfa_HLD+00H
 call cfa_A_ld+00H
 call cfa_PAD+00H
 call cfa_OVER+00H
 call cfa_minus+00H
 call cfa__1minus+00H
 DB 0C3H
AHEADER 0 ,'#S',cfa_nS

 call cfa_n+00H
 call cfa__2DUP+00H
 call cfa_D0_equ+00H
 call cfa_QBRANCH+00H
;je  cfa_nS+00H
je  cfa_nS+00H
 DB 0C3H
AHEADER 0 ,'#',cfa_n

 call cfa_XLIT+00H
 DD 00H
 call cfa_BASE+00H
 call cfa_A_ld+00H
 call cfa_UM_divMOD+00H
 call cfa_greatR+00H
 call cfa_BASE+00H
 call cfa_A_ld+00H
 call cfa_UM_divMOD+00H
 call cfa_SWAP+00H
 call cfa_DUP+00H
 call cfa_XLIT+00H
 DD 0AH
 call cfa_less+00H
 call cfa__0_equ+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_n+062H-$-4
 call cfa_XLIT+00H
 DD 07H
 call cfa_plus+00H
 call cfa_XLIT+00H
 DD 030H
 call cfa_plus+00H
 call cfa_HOLD+00H
 call cfa_Rgreat+00H
 DB 0C3H
AHEADER 0 ,'<#',cfa_lessn

 call cfa_PAD+00H
 call cfa__1minus+00H
 call cfa_HLD+00H
 call cfa_save+00H
 call cfa_XLIT+00H
 DD 00H
 call cfa_PAD+00H
 call cfa__1minus+00H
 call cfa_Csave+00H
 DB 0C3H
AHEADER 0 ,'HOLD',cfa_HOLD

 call cfa_HLD+00H
 call cfa_A_ld+00H
 call cfa__1minus+00H
 call cfa_DUP+00H
 call cfa_HLD+00H
 call cfa_save+00H
 call cfa_Csave+00H
 DB 0C3H
AHEADER 0 ,'DECIMAL',cfa_DECIMAL

 call cfa_XLIT+00H
 DD 0AH
 call cfa_BASE+00H
 call cfa_save+00H
 DB 0C3H
AHEADER 0 ,'HEX',cfa_HEX

 call cfa_XLIT+00H
 DD 010H
 call cfa_BASE+00H
 call cfa_save+00H
 DB 0C3H
AHEADER 0 ,'MH.',cfa_MHdot

 call cfa_DUP+00H
 call cfa_XLIT+00H
 DD 0FH
 call cfa_AND+00H
 call cfa_DUP+00H
 call cfa_XLIT+00H
 DD 0AH
 call cfa_less+00H
 call cfa__0_equ+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_MHdot+044H-$-4
 call cfa_XLIT+00H
 DD 07H
 call cfa_plus+00H
 call cfa_XLIT+00H
 DD 030H
 call cfa_plus+00H
 call cfa_greatR+00H
 call cfa_XLIT+00H
 DD 04H
 call cfa_RSHIFT+00H
 call cfa_DUP+00H
 call cfa_XLIT+00H
 DD 0FH
 call cfa_AND+00H
 call cfa_DUP+00H
 call cfa_XLIT+00H
 DD 0AH
 call cfa_less+00H
 call cfa__0_equ+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_MHdot+0A9H-$-4
 call cfa_XLIT+00H
 DD 07H
 call cfa_plus+00H
 call cfa_XLIT+00H
 DD 030H
 call cfa_plus+00H
 call cfa_greatR+00H
 call cfa_XLIT+00H
 DD 04H
 call cfa_RSHIFT+00H
 call cfa_DUP+00H
 call cfa_XLIT+00H
 DD 0FH
 call cfa_AND+00H
 call cfa_DUP+00H
 call cfa_XLIT+00H
 DD 0AH
 call cfa_less+00H
 call cfa__0_equ+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_MHdot+010EH-$-4
 call cfa_XLIT+00H
 DD 07H
 call cfa_plus+00H
 call cfa_XLIT+00H
 DD 030H
 call cfa_plus+00H
 call cfa_greatR+00H
 call cfa_XLIT+00H
 DD 04H
 call cfa_RSHIFT+00H
 call cfa_DUP+00H
 call cfa_XLIT+00H
 DD 0FH
 call cfa_AND+00H
 call cfa_DUP+00H
 call cfa_XLIT+00H
 DD 0AH
 call cfa_less+00H
 call cfa__0_equ+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_MHdot+0173H-$-4
 call cfa_XLIT+00H
 DD 07H
 call cfa_plus+00H
 call cfa_XLIT+00H
 DD 030H
 call cfa_plus+00H
 call cfa_greatR+00H
 call cfa_XLIT+00H
 DD 04H
 call cfa_RSHIFT+00H
 call cfa_DUP+00H
 call cfa_XLIT+00H
 DD 0FH
 call cfa_AND+00H
 call cfa_DUP+00H
 call cfa_XLIT+00H
 DD 0AH
 call cfa_less+00H
 call cfa__0_equ+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_MHdot+01D8H-$-4
 call cfa_XLIT+00H
 DD 07H
 call cfa_plus+00H
 call cfa_XLIT+00H
 DD 030H
 call cfa_plus+00H
 call cfa_greatR+00H
 call cfa_XLIT+00H
 DD 04H
 call cfa_RSHIFT+00H
 call cfa_DUP+00H
 call cfa_XLIT+00H
 DD 0FH
 call cfa_AND+00H
 call cfa_DUP+00H
 call cfa_XLIT+00H
 DD 0AH
 call cfa_less+00H
 call cfa__0_equ+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_MHdot+023DH-$-4
 call cfa_XLIT+00H
 DD 07H
 call cfa_plus+00H
 call cfa_XLIT+00H
 DD 030H
 call cfa_plus+00H
 call cfa_greatR+00H
 call cfa_XLIT+00H
 DD 04H
 call cfa_RSHIFT+00H
 call cfa_DUP+00H
 call cfa_XLIT+00H
 DD 0FH
 call cfa_AND+00H
 call cfa_DUP+00H
 call cfa_XLIT+00H
 DD 0AH
 call cfa_less+00H
 call cfa__0_equ+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_MHdot+02A2H-$-4
 call cfa_XLIT+00H
 DD 07H
 call cfa_plus+00H
 call cfa_XLIT+00H
 DD 030H
 call cfa_plus+00H
 call cfa_greatR+00H
 call cfa_XLIT+00H
 DD 04H
 call cfa_RSHIFT+00H
 call cfa_DUP+00H
 call cfa_XLIT+00H
 DD 0FH
 call cfa_AND+00H
 call cfa_DUP+00H
 call cfa_XLIT+00H
 DD 0AH
 call cfa_less+00H
 call cfa__0_equ+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_MHdot+0307H-$-4
 call cfa_XLIT+00H
 DD 07H
 call cfa_plus+00H
 call cfa_XLIT+00H
 DD 030H
 call cfa_plus+00H
 call cfa_greatR+00H
 call cfa_XLIT+00H
 DD 04H
 call cfa_RSHIFT+00H
 call cfa_DUP+00H
 call cfa_XLIT+00H
 DD 0FH
 call cfa_AND+00H
 call cfa_DUP+00H
 call cfa_XLIT+00H
 DD 0AH
 call cfa_less+00H
 call cfa__0_equ+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_MHdot+036CH-$-4
 call cfa_XLIT+00H
 DD 07H
 call cfa_plus+00H
 call cfa_XLIT+00H
 DD 030H
 call cfa_plus+00H
 call cfa_greatR+00H
 call cfa_XLIT+00H
 DD 04H
 call cfa_RSHIFT+00H
 call cfa_Rgreat+00H
 call cfa_EMIT+00H
 call cfa_Rgreat+00H
 call cfa_EMIT+00H
 call cfa_Rgreat+00H
 call cfa_EMIT+00H
 call cfa_Rgreat+00H
 call cfa_EMIT+00H
 call cfa_Rgreat+00H
 call cfa_EMIT+00H
 call cfa_Rgreat+00H
 call cfa_EMIT+00H
 call cfa_Rgreat+00H
 call cfa_EMIT+00H
 call cfa_Rgreat+00H
 call cfa_EMIT+00H
 call cfa_Rgreat+00H
 call cfa_EMIT+00H
 call cfa_DROP+00H
 DB 0C3H
AHEADER 0 ,'ABORT',cfa_ABORT

 call cfa_XLIT+00H
 DD 0FFFFFFFFH
 call cfa_THROW+00H
 DB 0C3H
AHEADER 0 ,'CATCH',cfa_CATCH

 call cfa_lessSETminusEXCminusHANDLERgreat+00H
 call cfa_SP_ld+00H
 call cfa_greatR+00H
 call cfa_HANDLER+00H
 call cfa__ld+00H
 call cfa_greatR+00H
 call cfa_RP_ld+00H
 call cfa_HANDLER+00H
 call cfa_save+00H
 call cfa_EXECUTE+00H
 call cfa_Rgreat+00H
 call cfa_HANDLER+00H
 call cfa_save+00H
 DB 048H
 DB 083H,0C4H,08H
 call cfa_XLIT+00H
 DD 00H
 DB 0C3H
AHEADER 0 ,'<SET-EXC-HANDLER>',cfa_lessSETminusEXCminusHANDLERgreat

 call cfa__VECTminusCODE+00H
 DD cfa_NOOP+00H
 call cfa__TOVALUEminusCODE+00H
AHEADER 0 ,'THROW',cfa_THROW

 call cfa_queDUP+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_THROW+066H-$-4
 call cfa_HANDLER+00H
 call cfa__ld+00H
 call cfa_queDUP+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_THROW+061H-$-4
 call cfa_RPsave+00H
 call cfa_Rgreat+00H
 call cfa_HANDLER+00H
 call cfa_save+00H
 call cfa_Rgreat+00H
 call cfa_SWAP+00H
 call cfa_greatR+00H
 call cfa_SPsave+00H
 call cfa_DROP+00H
 call cfa_Rgreat+00H
 DB 0E9H
 DD cfa_THROW+066H-$-4
 call cfa_FATALminusHANDLER+00H
 DB 0C3H
AHEADER 0 ,'FATAL-HANDLER',cfa_FATALminusHANDLER

 call cfa__VECTminusCODE+00H
 DD cfa_NOOP+00H
 call cfa__TOVALUEminusCODE+00H
AHEADER 0 ,'CFL',cfa_CFL

 call cfa__CONSTANTminusCODE+00H
 DD 05H
AHEADER 0 ,'GET-CURRENT',cfa_GETminusCURRENT

 call cfa_CURRENT+00H
 call cfa_A_ld+00H
 DB 0C3H
AHEADER 0 ,'SET-CURRENT',cfa_SETminusCURRENT

 call cfa_CURRENT+00H
 call cfa_save+00H
 DB 0C3H
AHEADER 1 ,'RDROP',cfa_RDROP

 call cfa_XLIT+00H
 DD 048H
 call cfa_Ccom+00H
 call cfa_XLIT+00H
 DD 083H
 call cfa_Ccom+00H
 call cfa_XLIT+00H
 DD 0C4H
 call cfa_Ccom+00H
 call cfa_XLIT+00H
 DD 08H
 call cfa_Ccom+00H
 DB 0C3H
AHEADER 0 ,'W,',cfa_Wcom

 call cfa_DP+00H
 call cfa_A_ld+00H
 call cfa_XLIT+00H
 DD 02H
 call cfa_ALLOT+00H
 call cfa_Wsave+00H
 DB 0C3H
AHEADER 0 ,'C,',cfa_Ccom

 call cfa_DP+00H
 call cfa_A_ld+00H
 call cfa_XLIT+00H
 DD 01H
 call cfa_CHARS+00H
 call cfa_ALLOT+00H
 call cfa_Csave+00H
 DB 0C3H
AHEADER 0 ,'L,',cfa_Lcom

 call cfa_DP+00H
 call cfa_A_ld+00H
 call cfa_XLIT+00H
 DD 04H
 call cfa_ALLOT+00H
 call cfa_Lsave+00H
 DB 0C3H
AHEADER 0 ,'ALLOT',cfa_ALLOT

 call cfa_DP+00H
 call cfa_plussave+00H
 DB 0C3H
AHEADER 0 ,'WORDS',cfa_WORDS

 call cfa__CONTEXT+00H
 call cfa_L_ld+00H
 call cfa_NLIST+00H
 DB 0C3H
AHEADER 0 ,'NLIST',cfa_NLIST

 call cfa_L_ld+00H
 call cfa_greatOUT+00H
 call cfa__0save+00H
 call cfa_CR+00H
 call cfa_WminusCNT+00H
 call cfa__0save+00H
 call cfa_XLIT+00H
 DD 06H
 call cfa_NNN+00H
 call cfa_Lsave+00H
 call cfa_queCRminusBREAK+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_NLIST+0AAH-$-4
 call cfa_WminusCNT+00H
 call cfa__1plussave+00H
 call cfa_DUP+00H
 call cfa_IDdot+00H
 call cfa_DUP+00H
 call cfa_C_ld+00H
 call cfa_greatOUT+00H
 call cfa_plussave+00H
 call cfa_XLIT+00H
 DD 08H
 call cfa_greatOUT+00H
 call cfa_A_ld+00H
 call cfa_XLIT+00H
 DD 08H
 call cfa_MOD+00H
 call cfa_minus+00H
 call cfa_DUP+00H
 call cfa_greatOUT+00H
 call cfa_plussave+00H
 call cfa_SPACES+00H
 call cfa_CDR+00H
 DB 0EBH,087H
 call cfa_CR+00H
 call cfa_CR+00H
 call cfa__SLITERALminusCODE+00H
 DB 07H
 DB 'Words: ',0
 call cfa_TYPE+00H
 call cfa_WminusCNT+00H
 call cfa_A_ld+00H
 call cfa_Udot+00H
 call cfa_CR+00H
 DB 0C3H
AHEADER 0 ,'?CR-BREAK',cfa_queCRminusBREAK

 call cfa_DUP+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_queCRminusBREAK+01CBH-$-4
 call cfa_DUP+00H
 call cfa_C_ld+00H
 call cfa_greatOUT+00H
 call cfa_A_ld+00H
 call cfa_plus+00H
 call cfa_XLIT+00H
 DD 040H
 call cfa_great+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_queCRminusBREAK+01C6H-$-4
 call cfa_greatOUT+00H
 call cfa__0save+00H
 call cfa_NNN+00H
 call cfa_A_ld+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_queCRminusBREAK+07EH-$-4
 call cfa_XLIT+00H
 DD 0FFFFFFFFH
 call cfa_NNN+00H
 call cfa_plussave+00H
 call cfa_TRUE+00H
 DB 0E9H
 DD cfa_queCRminusBREAK+01C1H-$-4
 call cfa__SLITERALminusCODE+00H
 DB 08H
 DB 'Q - quit',0
 call cfa_TYPE+00H
 call cfa_CR+00H
 call cfa_XLIT+00H
 DD 06H
 call cfa_NNN+00H
 call cfa_save+00H
 call cfa_CR+00H
 call cfa__SLITERALminusCODE+00H
 DB 01H
 DB '<',0
 call cfa_TYPE+00H
 call cfa_dotS+00H
 call cfa__SLITERALminusCODE+00H
 DB 01H
 DB '>',0
 call cfa_TYPE+00H
 call cfa_SP_ld+00H
 call cfa_Hdot+00H
 call cfa_KEY+00H
 call cfa_CR+00H
 call cfa__SLITERALminusCODE+00H
 DB 02H
 DB 'z<',0
 call cfa_TYPE+00H
 call cfa_dotS+00H
 call cfa__SLITERALminusCODE+00H
 DB 01H
 DB '>',0
 call cfa_TYPE+00H
 call cfa_XLIT+00H
 DD 020H
 call cfa_OR+00H
 call cfa_XLIT+00H
 DD 071H
 call cfa_CR+00H
 call cfa__SLITERALminusCODE+00H
 DB 02H
 DB 'a<',0
 call cfa_TYPE+00H
 call cfa_dotS+00H
 call cfa__SLITERALminusCODE+00H
 DB 01H
 DB '>',0
 call cfa_TYPE+00H
 call cfa_lessgreat+00H
 call cfa_CR+00H
 call cfa__SLITERALminusCODE+00H
 DB 02H
 DB 'W<',0
 call cfa_TYPE+00H
 call cfa_dotS+00H
 call cfa__SLITERALminusCODE+00H
 DB 01H
 DB '>',0
 call cfa_TYPE+00H
 call cfa_AND+00H
 call cfa_CR+00H
 call cfa__SLITERALminusCODE+00H
 DB 02H
 DB 'E<',0
 call cfa_TYPE+00H
 call cfa_dotS+00H
 call cfa__SLITERALminusCODE+00H
 DB 01H
 DB '>',0
 call cfa_TYPE+00H
 call cfa_queDUP+00H
 call cfa_CR+00H
 call cfa__SLITERALminusCODE+00H
 DB 02H
 DB 'Q<',0
 call cfa_TYPE+00H
 call cfa_dotS+00H
 call cfa__SLITERALminusCODE+00H
 DB 01H
 DB '>',0
 call cfa_TYPE+00H
 call cfa__0lessgreat+00H
 DB 0E9H
 DD cfa_queCRminusBREAK+01CBH-$-4
 call cfa_TRUE+00H
 DB 0C3H
AHEADER 0 ,'VOC-NAME.',cfa_VOCminusNAMEdot

 call cfa_DUP+00H
 call cfa_FORTHminusWORDLIST+00H
 call cfa__equ+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_VOCminusNAMEdot+031H-$-4
 call cfa_DROP+00H
 call cfa__SLITERALminusCODE+00H
 DB 05H
 DB 'FORTH',0
 call cfa_TYPE+00H
 DB 0C3H
 call cfa_DUP+00H
 call cfa_XLIT+00H
 DD 08H
 call cfa_plus+00H
 call cfa__ld+00H
 call cfa_DUP+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_VOCminusNAMEdot+068H-$-4
 call cfa_IDdot+00H
 call cfa_DROP+00H
 DB 0E9H
 DD cfa_VOCminusNAMEdot+087H-$-4
 call cfa_DROP+00H
 call cfa__SLITERALminusCODE+00H
 DB 09H
 DB '<NONAME>:',0
 call cfa_TYPE+00H
 call cfa_Udot+00H
 DB 0C3H
AHEADER 0 ,'PREVIOUS',cfa_PREVIOUS

 call cfa__CONTEXT+00H
 call cfa_XLIT+00H
 DD 04H
 call cfa_minus+00H
 call cfa_SminusO+00H
 call cfa_MAX+00H
 call cfa__CONTEXT+09H
 DB 0C3H
AHEADER 0 ,'ALSO',cfa_ALSO

 call cfa_GETminusORDER+00H
 call cfa__1plus+00H
 call cfa_OVER+00H
 call cfa_SWAP+00H
 call cfa_SETminusORDER+00H
 DB 0C3H
AHEADER 0 ,'SET-ORDER',cfa_SETminusORDER

 call cfa_DUP+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_SETminusORDER+0ADH-$-4
 call cfa_DUP+00H
 call cfa_XLIT+00H
 DD 0FFFFFFFFH
 call cfa__equ+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_SETminusORDER+039H-$-4
 call cfa_DROP+00H
 call cfa_ONLY+00H
 DB 0C3H
 call cfa_DUP+00H
 call cfa__1minus+00H
 call cfa_XLIT+00H
 DD 04H
 call cfa__mul+00H
 call cfa_SminusO+00H
 call cfa_plus+00H
 call cfa__CONTEXT+09H
 call cfa_XLIT+00H
 DD 00H
 call cfa_YDO+00H
 DQ cfa_SETminusORDER+0A8H
 call cfa__CONTEXT+00H
 call cfa_DUP+00H
 DB 04CH
 DB 089H,0F0H
 call cfa_XLIT+00H
 DD 04H
 call cfa__mul+00H
 call cfa_minus+00H
 call cfa_Lsave+00H
 DB 049H
 DB 0FFH,0C6H
 DB 049H
 DB 0FFH,0C7H
;jno cfa_SETminusORDER+076H
 DB 071H,0D3H
 DB 041H
 DB 05EH
 DB 041H
 DB 05FH
 DB 059H
 DB 0E9H
 DD cfa_SETminusORDER+0C6H-$-4
 call cfa_DROP+00H
 call cfa_SminusO+00H
 call cfa__CONTEXT+09H
 call cfa__CONTEXT+00H
 call cfa__0save+00H
 DB 0C3H
AHEADER 0 ,'ORDER',cfa_ORDER

 call cfa_GETminusORDER+00H
 call cfa__SLITERALminusCODE+00H
 DB 09H
 DB 'Context: ',0
 call cfa_TYPE+00H
 call cfa_XLIT+00H
 DD 00H
 call cfa_YQDO+00H
 DQ cfa_ORDER+047H
 call cfa_VOCminusNAMEdot+00H
 call cfa_SPACE+00H
 DB 049H
 DB 0FFH,0C6H
 DB 049H
 DB 0FFH,0C7H
;jno cfa_ORDER+030H
 DB 071H,0EEH
 DB 041H
 DB 05EH
 DB 041H
 DB 05FH
 DB 059H
 call cfa_CR+00H
 call cfa__SLITERALminusCODE+00H
 DB 09H
 DB 'Current: ',0
 call cfa_TYPE+00H
 call cfa_GETminusCURRENT+00H
 call cfa_VOCminusNAMEdot+00H
 call cfa_CR+00H
 DB 0C3H
AHEADER 0 ,'ONLY',cfa_ONLY

 call cfa_SminusO+00H
 call cfa__CONTEXT+09H
 call cfa_FORTH+00H
 DB 0C3H
AHEADER 0 ,'LATEST',cfa_LATEST

 call cfa_CURRENT+00H
 call cfa__ld+00H
 call cfa__ld+00H
 DB 0C3H
AHEADER 0 ,'FORTH',cfa_FORTH

 call cfa_FORTHminusWORDLIST+00H
 call cfa__CONTEXT+00H
 call cfa_save+00H
 DB 0C3H
AHEADER 0 ,'GET-ORDER',cfa_GETminusORDER

 call cfa__CONTEXT+00H
 call cfa__1plus+00H
 call cfa_SminusO+00H
 call cfa_YDO+00H
 DQ cfa_GETminusORDER+044H
 call cfa_DUP+00H
 DB 04CH
 DB 089H,0F0H
 call cfa_L_ld+00H
 call cfa_XLIT+00H
 DD 04H
 DB 049H
 DB 01H,0C6H
 DB 049H
 DB 01H,0C7H
 call cfa_DROP+00H
;jno cfa_GETminusORDER+01CH
 DB 071H,0DDH
 DB 041H
 DB 05EH
 DB 041H
 DB 05FH
 DB 059H
 call cfa__CONTEXT+00H
 call cfa_SminusO+00H
 call cfa_minus+00H
 call cfa_XLIT+00H
 DD 04H
 call cfa__div+00H
 call cfa__1plus+00H
 DB 0C3H
AHEADER 0 ,'DEFINITIONS',cfa_DEFINITIONS

 call cfa__CONTEXT+00H
 call cfa_L_ld+00H
 call cfa_SETminusCURRENT+00H
 DB 0C3H
AHEADER 0 ,'FIND1',cfa_FIND1

 call cfa_COUNT+00H
 call cfa_SFIND+00H
 call cfa_DUP+00H
 call cfa__0_equ+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_FIND1+032H-$-4
 call cfa__2DROP+00H
 call cfa__1minus+00H
 call cfa_XLIT+00H
 DD 00H
 DB 0C3H
AHEADER 0 ,'SFIND',cfa_SFIND

 call cfa_SminusO+00H
 call cfa__1minus+00H
 call cfa__CONTEXT+00H
 call cfa_YDO+00H
 DQ cfa_SFIND+096H
 call cfa__2DUP+00H
 call cfa_DUP+00H
 DB 04CH
 DB 089H,0F0H
 call cfa_L_ld+00H
 call cfa_SEARCHminusWORDLIST+00H
 call cfa_DUP+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_SFIND+053H-$-4
 call cfa__2SWAP+00H
 call cfa__2DROP+00H
 DB 048H
 DB 08DH,064H,024H,018H
 DB 0C3H
 call cfa_DROP+00H
 call cfa_DUP+00H
 DB 04CH
 DB 089H,0F0H
 call cfa_SminusO+00H
 call cfa__equ+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_SFIND+07BH-$-4
 DB 048H
 DB 08DH,064H,024H,010H
 DB 0C3H
 call cfa_XLIT+00H
 DD 0FFFFFFFCH
 DB 049H
 DB 01H,0C6H
 DB 049H
 DB 01H,0C7H
 call cfa_DROP+00H
;jno cfa_SFIND+01CH
 DB 071H,08BH
 DB 041H
 DB 05EH
 DB 041H
 DB 05FH
 DB 059H
 call cfa_XLIT+00H
 DD 00H
 DB 0C3H
AHEADER 0 ,'SEARCH-WORDLIST1',cfa_SEARCHminusWORDLIST1

 call cfa_L_ld+00H
 call cfa_DUP+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_SEARCHminusWORDLIST1+09BH-$-4
 call cfa_greatR+00H
 call cfa__2DUP+00H
 call cfa_R_ld+00H
 call cfa_COUNT+00H
 call cfa_COMPARE+00H
 call cfa__0_equ+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_SEARCHminusWORDLIST1+07EH-$-4
 call cfa__2DROP+00H
 call cfa_R_ld+00H
 call cfa_NAMEgreat+00H
 call cfa_Rgreat+00H
 call cfa_NAMEgreatF+00H
 call cfa_A_ld+00H
 call cfa_XLIT+00H
 DD 01H
 call cfa_AND+00H
 call cfa__1minus+00H
 call cfa_XLIT+00H
 DD 01H
 call cfa_OR+00H
 DB 0C3H
 call cfa_Rgreat+00H
 call cfa_XLIT+00H
 DD 08H
 call cfa_minus+00H
 call cfa_A_ld+00H
 DB 0E9H
 DD cfa_SEARCHminusWORDLIST1+05H-$-4
 call cfa__2DROP+00H
 call cfa_DROP+00H
 call cfa_XLIT+00H
 DD 00H
 DB 0C3H
AHEADER 0 ,'SEARCH-WORDLIST',cfa_SEARCHminusWORDLIST

 call cfa__VECTminusCODE+00H
 DD cfa_SEARCHminusWORDLIST1+00H
 call cfa__TOVALUEminusCODE+00H
AHEADER 0 ,'FIND',cfa_FIND

 call cfa__VECTminusCODE+00H
 DD cfa_FIND1+00H
 call cfa__TOVALUEminusCODE+00H
AHEADER 0 ,'WordByAddr',cfa_WordByAddr

 call cfa_DUP+00H
 call cfa_DP+00H
 call cfa_A_ld+00H
 call cfa_Ugreat+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_WordByAddr+03EH-$-4
 call cfa_DROP+00H
 call cfa__SLITERALminusCODE+00H
 DB 012H
 DB '<not in the image>',0
 DB 0C3H
 call cfa_NEAR_NFA+00H
 call cfa_DROP+00H
 call cfa_DUP+00H
 call cfa__0_equ+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_WordByAddr+075H-$-4
 call cfa_DROP+00H
 call cfa__SLITERALminusCODE+00H
 DB 0BH
 DB '<not found>',0
 DB 0C3H
 call cfa_COUNT+00H
 DB 0C3H
AHEADER 0 ,'NEAR_NFA',cfa_NEAR_NFA

 call cfa_XLIT+00H
 DD 00H
 call cfa_SWAP+00H
 call cfa_VOCminusLIST+00H
 call cfa__ld+00H
 call cfa_DUP+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_NEAR_NFA+04DH-$-4
 call cfa_DUP+00H
 call cfa_greatR+00H
 call cfa_WL_NEAR_NFA_M+00H
 call cfa_greatR+00H
 call cfa_N_UMAX+00H
 call cfa_Rgreat+00H
 call cfa_Rgreat+00H
 DB 0EBH,0C6H
 call cfa_DROP+00H
 DB 0C3H
AHEADER 0 ,'WL_NEAR_NFA_M',cfa_WL_NEAR_NFA_M

 call cfa_XLIT+00H
 DD 00H
 call cfa_minusROT+00H
 call cfa_XLIT+00H
 DD 08H
 call cfa_plus+00H
 call cfa__ld+00H
 call cfa_DUP+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_WL_NEAR_NFA_M+075H-$-4
 call cfa_WL_NEAR_NFA_N+00H
 call cfa_SWAP+00H
 call cfa_greatR+00H
 call cfa_DUP+00H
 call cfa_greatR+00H
 call cfa_N_UMAX+00H
 call cfa_Rgreat+00H
 call cfa_DUP+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_WL_NEAR_NFA_M+069H-$-4
 call cfa_CDR+00H
 call cfa_Rgreat+00H
 call cfa_SWAP+00H
 DB 0EBH,0ACH
 call cfa_DROP+00H
 DB 0C3H
AHEADER 0 ,'WL_NEAR_NFA_N',cfa_WL_NEAR_NFA_N

 call cfa__2DUP+00H
 call cfa_DUP+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_WL_NEAR_NFA_N+01AH-$-4
 call cfa_NAMEgreat+00H
 call cfa_Uless+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_WL_NEAR_NFA_N+031H-$-4
 call cfa_CDR+00H
 DB 0EBH,0CFH
 DB 0C3H
AHEADER 0 ,'WL_NEAR_NFA',cfa_WL_NEAR_NFA

 call cfa__ld+00H
 call cfa__2DUP+00H
 call cfa_DUP+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_WL_NEAR_NFA+01FH-$-4
 call cfa_NAMEgreat+00H
 call cfa_Uless+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_WL_NEAR_NFA+036H-$-4
 call cfa_CDR+00H
 DB 0EBH,0CFH
 DB 0C3H
AHEADER 0 ,'N_UMAX',cfa_N_UMAX

 call cfa_OVER+00H
 call cfa_DUP+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_N_UMAX+01AH-$-4
 call cfa_NAMEgreat+00H
 call cfa_OVER+00H
 call cfa_DUP+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_N_UMAX+034H-$-4
 call cfa_NAMEgreat+00H
 call cfa_Uless+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_N_UMAX+04AH-$-4
 call cfa_NIP+00H
 DB 0C3H
 call cfa_DROP+00H
 DB 0C3H
AHEADER 0 ,'?VOC',cfa_queVOC

 call cfa_NAMEgreatF+00H
 call cfa_C_ld+00H
 call cfa_and_VOC+00H
 call cfa_AND+00H
 DB 0C3H
AHEADER 0 ,'?IMMEDIATE',cfa_queIMMEDIATE

 call cfa_NAMEgreatF+00H
 call cfa_C_ld+00H
 call cfa_and_IMMEDIATE+00H
 call cfa_AND+00H
 DB 0C3H
AHEADER 0 ,'WORDLIST',cfa_WORDLIST

 call cfa_HERE+00H
 call cfa_VOCminusLIST+00H
 call cfa__ld+00H
 call cfa_Qcom+00H
 call cfa_VOCminusLIST+00H
 call cfa_save+00H
 call cfa_HERE+00H
 call cfa_XLIT+00H
 DD 00H
 call cfa_Qcom+00H
 call cfa_XLIT+00H
 DD 00H
 call cfa_Qcom+00H
 call cfa_XLIT+00H
 DD 00H
 call cfa_Qcom+00H
 call cfa_XLIT+00H
 DD 00H
 call cfa_Qcom+00H
 call cfa_XLIT+00H
 DD 00H
 call cfa_Qcom+00H
 DB 0C3H
AHEADER 0 ,'VOC',cfa_VOC

 call cfa_LAST+00H
 call cfa_A_ld+00H
 call cfa_NAMEgreatF+00H
 call cfa_DUP+00H
 call cfa_C_ld+00H
 call cfa_and_VOC+00H
 call cfa_OR+00H
 call cfa_SWAP+00H
 call cfa_Csave+00H
 DB 0C3H
AHEADER 0 ,'PAR@',cfa_PAR_ld

 call cfa_XLIT+00H
 DD 08H
 call cfa_plus+00H
 call cfa_XLIT+00H
 DD 08H
 call cfa_plus+00H
 call cfa__ld+00H
 DB 0C3H
AHEADER 0 ,'PAR!',cfa_PARsave

 call cfa_XLIT+00H
 DD 08H
 call cfa_plus+00H
 call cfa_XLIT+00H
 DD 08H
 call cfa_plus+00H
 call cfa_Lsave+00H
 DB 0C3H
AHEADER 0 ,'CLASS@',cfa_CLASS_ld

 call cfa_XLIT+00H
 DD 08H
 call cfa_plus+00H
 call cfa_XLIT+00H
 DD 08H
 call cfa_plus+00H
 call cfa_XLIT+00H
 DD 08H
 call cfa_plus+00H
 call cfa__ld+00H
 DB 0C3H
AHEADER 0 ,'CLASS!',cfa_CLASSsave

 call cfa_XLIT+00H
 DD 08H
 call cfa_plus+00H
 call cfa_XLIT+00H
 DD 08H
 call cfa_plus+00H
 call cfa_XLIT+00H
 DD 08H
 call cfa_plus+00H
 call cfa_Lsave+00H
 DB 0C3H
AHEADER 0 ,'IMMEDIATE',cfa_IMMEDIATE

 call cfa_LAST+00H
 call cfa_A_ld+00H
 call cfa_NAMEgreatF+00H
 call cfa_DUP+00H
 call cfa_C_ld+00H
 call cfa_and_IMMEDIATE+00H
 call cfa_OR+00H
 call cfa_SWAP+00H
 call cfa_Csave+00H
 DB 0C3H
AHEADER 0 ,'+SWORD',cfa_plusSWORD

 call cfa_DUP+00H
 call cfa__ld+00H
 call cfa_com+00H
 call cfa_HERE+00H
 call cfa_LAST+00H
 call cfa_save+00H
 call cfa_HERE+00H
 call cfa_SWAP+00H
 call cfa_save+00H
 call cfa_Sdticcom+00H
 DB 0C3H
AHEADER 0 ,'>BODY',cfa_greatBODY

 call cfa_XLIT+00H
 DD 05H
 call cfa_plus+00H
 DB 0C3H
AHEADER 0 ,'&VOC',cfa_and_VOC

 call cfa__CONSTANTminusCODE+00H
 DD 02H
AHEADER 0 ,'&IMMEDIATE',cfa_and_IMMEDIATE

 call cfa__CONSTANTminusCODE+00H
 DD 01H
AHEADER 0 ,'ID.',cfa_IDdot

 call cfa_COUNT+00H
 call cfa_TYPE+00H
 DB 0C3H
AHEADER 0 ,'?LITERAL2',cfa_queLITERAL2

 call cfa_COUNT+00H
 call cfa_queSLITERAL2+00H
 DB 0C3H
AHEADER 0 ,'?SLITERAL2',cfa_queSLITERAL2

 call cfa_DUP+00H
 call cfa_XLIT+00H
 DD 01H
 call cfa_great+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_queSLITERAL2+06EH-$-4
 call cfa_OVER+00H
 call cfa_W_ld+00H
 call cfa_XLIT+00H
 DD 07830H
 call cfa__equ+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_queSLITERAL2+06EH-$-4
 call cfa__2DUP+00H
 call cfa__2greatR+00H
 call cfa_HEXminusSLITERAL+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_queSLITERAL2+069H-$-4
 DB 048H
 DB 083H,0C4H,08H
 DB 048H
 DB 083H,0C4H,08H
 DB 0C3H
 DB 0E9H
 DD cfa_queSLITERAL2+06EH-$-4
 call cfa__2Rgreat+00H
 call cfa__2DUP+00H
 call cfa__2greatR+00H
 call cfa_lessticgreat+00H
 call cfa_queSLITERAL1+00H
 call cfa_CATCH+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_queSLITERAL2+015BH-$-4
 call cfa__2DROP+00H
 call cfa__2Rgreat+00H
 call cfa_OVER+00H
 call cfa_C_ld+00H
 call cfa_XLIT+00H
 DD 022H
 call cfa__equ+00H
 call cfa_OVER+00H
 call cfa_XLIT+00H
 DD 02H
 call cfa_great+00H
 call cfa_AND+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_queSLITERAL2+0F4H-$-4
 call cfa_XLIT+00H
 DD 02H
 call cfa_minus+00H
 call cfa_SWAP+00H
 call cfa__1plus+00H
 call cfa_SWAP+00H
 call cfa__2DUP+00H
 call cfa_plus+00H
 call cfa_XLIT+00H
 DD 00H
 call cfa_SWAP+00H
 call cfa_Csave+00H
 call cfa_lessticgreat+00H
 call cfa_INCLUDED+00H
 call cfa_CATCH+00H
 call cfa_DUP+00H
 call cfa_XLIT+00H
 DD 02H
 call cfa__equ+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_queSLITERAL2+0151H-$-4
 call cfa_XLIT+00H
 DD 0FFFFF82DH
 call cfa_THROW+00H
 DB 0E9H
 DD cfa_queSLITERAL2+0156H-$-4
 call cfa_THROW+00H
 DB 0E9H
 DD cfa_queSLITERAL2+0163H-$-4
 DB 048H
 DB 083H,0C4H,08H
 DB 048H
 DB 083H,0C4H,08H
 DB 0C3H
AHEADER 0 ,'HEX-SLITERAL',cfa_HEXminusSLITERAL

 call cfa_BASE+00H
 call cfa_A_ld+00H
 call cfa_greatR+00H
 call cfa_HEX+00H
 call cfa_XLIT+00H
 DD 00H
 call cfa_XLIT+00H
 DD 00H
 call cfa__2SWAP+00H
 call cfa__2minus+00H
 call cfa_SWAP+00H
 call cfa__2plus+00H
 call cfa_SWAP+00H
 call cfa_greatNUMBER+00H
 call cfa_queDUP+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_HEXminusSLITERAL+0AEH-$-4
 call cfa_XLIT+00H
 DD 01H
 call cfa__equ+00H
 call cfa_SWAP+00H
 call cfa_C_ld+00H
 call cfa_XLIT+00H
 DD 04CH
 call cfa__equ+00H
 call cfa_AND+00H
 call cfa__0_equ+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_HEXminusSLITERAL+0A9H-$-4
 call cfa__2DROP+00H
 call cfa_FALSE+00H
 call cfa_Rgreat+00H
 call cfa_BASE+00H
 call cfa_save+00H
 DB 0C3H
 DB 0E9H
 DD cfa_HEXminusSLITERAL+0B3H-$-4
 call cfa_DROP+00H
 call cfa_DgreatS+00H
 call cfa_LITERAL+00H
 call cfa_TRUE+00H
 call cfa_Rgreat+00H
 call cfa_BASE+00H
 call cfa_save+00H
 DB 0C3H
AHEADER 0 ,'?LITERAL1',cfa_queLITERAL1

 call cfa_COUNT+00H
 call cfa_queSLITERAL1+00H
 DB 0C3H
AHEADER 0 ,'?SLITERAL1',cfa_queSLITERAL1

 call cfa_XLIT+00H
 DD 00H
 call cfa_XLIT+00H
 DD 00H
 call cfa__2SWAP+00H
 call cfa_OVER+00H
 call cfa_C_ld+00H
 call cfa_XLIT+00H
 DD 02DH
 call cfa__equ+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_queSLITERAL1+058H-$-4
 call cfa__1minus+00H
 call cfa_SWAP+00H
 call cfa__1plus+00H
 call cfa_SWAP+00H
 call cfa_TRUE+00H
 DB 0E9H
 DD cfa_queSLITERAL1+05DH-$-4
 call cfa_FALSE+00H
 call cfa_greatR+00H
 call cfa_greatNUMBER+00H
 call cfa_DUP+00H
 call cfa_XLIT+00H
 DD 01H
 call cfa_great+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_queSLITERAL1+093H-$-4
 call cfa_XLIT+00H
 DD 0FFFFF82FH
 call cfa_THROW+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_queSLITERAL1+0E9H-$-4
 call cfa_C_ld+00H
 call cfa_XLIT+00H
 DD 02EH
 call cfa_lessgreat+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_queSLITERAL1+0CAH-$-4
 call cfa_XLIT+00H
 DD 0FFFFF82EH
 call cfa_THROW+00H
 call cfa_Rgreat+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_queSLITERAL1+0DFH-$-4
 call cfa_DNEGATE+00H
 call cfa__2LITERAL+00H
 DB 0E9H
 DD cfa_queSLITERAL1+010DH-$-4
 call cfa_DROP+00H
 call cfa_DgreatS+00H
 call cfa_Rgreat+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_queSLITERAL1+0108H-$-4
 call cfa_NEGATE+00H
 call cfa_LITERAL+00H
 DB 0C3H
AHEADER 0 ,'--',cfa_minusminus

 call cfa_FIELD+00H
 DB 0C3H
AHEADER 0 ,'FIELD',cfa_FIELD

 call cfa_dcoma+00H
 call cfa_OVER+00H
 call cfa_DUP+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_FIELD+033H-$-4
 call cfa_DUP+00H
 call cfa_LITcom+00H
 call cfa_lessticgreat+00H
 call cfa_plus+00H
 call cfa_COMPILEcom+00H
 call cfa_DROP+00H
 call cfa__end+00H
 call cfa_plus+00H
 DB 0C3H
AHEADER 0 ,'\EOF',cfa_slEOF

 call cfa_REFILL+00H
 call cfa__0_equ+00H
 call cfa_QBRANCH+00H
;je  cfa_slEOF+00H
je  cfa_slEOF+00H
 call cfa_sl+00H
 DB 0C3H
AHEADER 1 ,'EXIT',cfa_EXIT

 call cfa_RETcom+00H
 DB 0C3H
AHEADER 1 ,';',cfa__end

 call cfa_RETcom+00H
 call cfa__x+00H
 call cfa_SMUDGE+00H
 call cfa_XLIT+00H
 DD 00H
 call cfa_LASTminusNON+09H
 DB 0C3H
AHEADER 1 ,'[COMPILE]',cfa__xCOMPILE_y

 call cfa_queCOMP+00H
 call cfa_tic+00H
 call cfa_COMPILEcom+00H
 DB 0C3H
AHEADER 1 ,'(',cfa__c

 call cfa_XLIT+00H
 DD 029H
 call cfa_DUP+00H
 call cfa_PARSE+00H
 call cfa_plus+00H
 call cfa_C_ld+00H
 call cfa__equ+00H
 call cfa__0_equ+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa__c+04AH-$-4
 call cfa_REFILL+00H
 call cfa__0_equ+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa__c+048H-$-4
 DB 0C3H
 DB 0EBH,0B6H
 DB 0C3H
AHEADER 1 ,'.(',cfa_dot_c

 call cfa_XLIT+00H
 DD 029H
 call cfa_PARSE+00H
 call cfa_TYPE+00H
 DB 0C3H
AHEADER 1 ,'\-',cfa_slminus

 call cfa__xDEFINED_y+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_slminus+015H-$-4
 call cfa_sl+00H
 DB 0C3H
AHEADER 1 ,'\+',cfa_slplus

 call cfa__xDEFINED_y+00H
 call cfa__0_equ+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_slplus+01AH-$-4
 call cfa_sl+00H
 DB 0C3H
AHEADER 1 ,'[DEFINED]',cfa__xDEFINED_y

 call cfa_PARSEminusNAME+00H
 call cfa_SFIND+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa__xDEFINED_y+024H-$-4
 call cfa_DROP+00H
 call cfa_TRUE+00H
 DB 0E9H
 DD cfa__xDEFINED_y+02EH-$-4
 call cfa__2DROP+00H
 call cfa_FALSE+00H
 DB 0C3H
AHEADER 1 ,'\',cfa_sl

 call cfa_XLIT+00H
 DD 01H
 call cfa_PARSE+00H
 call cfa__2DROP+00H
 DB 0C3H
AHEADER 1 ,'POSTPONE',cfa_POSTPONE

 call cfa_queCOMP+00H
 call cfa_PARSEminusWORD+00H
 call cfa_SFIND+00H
 call cfa_DUP+00H
 call cfa__0_equ+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_POSTPONE+032H-$-4
 call cfa_XLIT+00H
 DD 0FFFFFEBFH
 call cfa_THROW+00H
 call cfa_XLIT+00H
 DD 01H
 call cfa__equ+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_POSTPONE+055H-$-4
 call cfa_COMPILEcom+00H
 DB 0E9H
 DD cfa_POSTPONE+069H-$-4
 call cfa_LITcom+00H
 call cfa_lessticgreat+00H
 call cfa_COMPILEcom+00H
 call cfa_COMPILEcom+00H
 DB 0C3H
AHEADER 0 ,'DEFER@',cfa_DEFER_ld

 call cfa_greatBODY+00H
 call cfa_L_ld+00H
 DB 0C3H
AHEADER 1 ,'TO',cfa_TO

 call cfa_tic+00H
 call cfa_DBG+00H
 call cfa_DUP+00H
 call cfa__1plus+00H
 call cfa_REL_ld+00H
 call cfa_XLIT+00H
 DD 04H
 call cfa_plus+00H
 call cfa_W_ld+00H
 call cfa_XLIT+00H
 DD 0DB88H
 call cfa__equ+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_TO+07EH-$-4
 call cfa_greatBODY+00H
 call cfa_STATE+00H
 call cfa__ld+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_TO+078H-$-4
 call cfa_SWAP+00H
 call cfa_LITcom+00H
 call cfa_LITcom+00H
 call cfa_save+00H
 DB 0E9H
 DD cfa_TO+07DH-$-4
 call cfa_save+00H
 DB 0C3H
 call cfa_greatBODY+00H
 call cfa_XLIT+00H
 DD 04H
 call cfa_plus+00H
 call cfa_STATE+00H
 call cfa__ld+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_TO+0B0H-$-4
 call cfa_COMPILEcom+00H
 DB 0E9H
 DD cfa_TO+0B5H-$-4
 call cfa_EXECUTE+00H
 DB 0C3H
AHEADER 0 ,'REQUIRE',cfa_REQUIRE

 call cfa_PARSEminusWORD+00H
 call cfa_PARSEminusWORD+00H
 call cfa__2DUP+00H
 call cfa_plus+00H
 call cfa_XLIT+00H
 DD 00H
 call cfa_SWAP+00H
 call cfa_Csave+00H
 call cfa_REQUIRED+00H
 DB 0C3H
AHEADER 0 ,'REQUIRED',cfa_REQUIRED

 call cfa__2SWAP+00H
 call cfa_SFIND+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_REQUIRED+025H-$-4
 call cfa_DROP+00H
 call cfa__2DROP+00H
 DB 0C3H
 DB 0E9H
 DD cfa_REQUIRED+030H-$-4
 call cfa__2DROP+00H
 call cfa_INCLUDED+00H
 DB 0C3H
 DB 0C3H
AHEADER 0 ,'INCLUDED_',cfa_INCLUDED_

 call cfa_CURFILE+00H
 call cfa_A_ld+00H
 call cfa_greatR+00H
 call cfa__2DUP+00H
 call cfa_HEAPminusCOPY+00H
 call cfa_CURFILE+00H
 call cfa_Asave+00H
 call cfa_lessticgreat+00H
 call cfa_INCLUDED_1+00H
 call cfa_CATCH+00H
 call cfa_CURFILE+00H
 call cfa_A_ld+00H
 call cfa_FREE+00H
 call cfa_THROW+00H
 call cfa_Rgreat+00H
 call cfa_CURFILE+00H
 call cfa_Asave+00H
 call cfa_THROW+00H
 DB 0C3H
AHEADER 0 ,'INCLUDED_1',cfa_INCLUDED_1

 call cfa_R_divO+00H
 call cfa_OPENminusFILE+00H
 call cfa_queDUP+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_INCLUDED_1+024H-$-4
 call cfa_NIP+00H
 call cfa_THROW+00H
 call cfa_DUP+00H
 call cfa_greatR+00H
 call cfa_lessticgreat+00H
 call cfa_INCLUDEminusFILE+00H
 call cfa_CATCH+00H
 call cfa_SAVEERR+00H
 call cfa_queDUP+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_INCLUDED_1+06BH-$-4
 call cfa_Rgreat+00H
 call cfa_CLOSEminusFILE+00H
 call cfa_DROP+00H
 call cfa_THROW+00H
 DB 0E9H
 DD cfa_INCLUDED_1+06FH-$-4
 DB 048H
 DB 083H,0C4H,08H
 DB 0C3H
AHEADER 0 ,'INCLUDE-FILE',cfa_INCLUDEminusFILE

 call cfa_TIB+00H
 call cfa_greatR+00H
 call cfa_greatIN+00H
 call cfa__ld+00H
 call cfa_greatR+00H
 call cfa_nTIB+00H
 call cfa_A_ld+00H
 call cfa_greatR+00H
 call cfa_SOURCEminusID+00H
 call cfa_greatR+00H
 call cfa_CURSTR+00H
 call cfa_A_ld+00H
 call cfa_greatR+00H
 call cfa_C_divL+00H
 call cfa_XLIT+00H
 DD 02H
 call cfa_plus+00H
 call cfa_ALLOCATE+00H
 call cfa_THROW+00H
 call cfa_TIB+09H
 call cfa_SOURCEminusID+09H
 call cfa_CURSTR+00H
 call cfa__0save+00H
 call cfa_REFILL+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_INCLUDEminusFILE+089H-$-4
 call cfa_INTERPRET+00H
 DB 0EBH,0E9H
 call cfa_TIB+00H
 call cfa_FREE+00H
 call cfa_THROW+00H
 call cfa_SOURCEminusID+00H
 call cfa_CLOSEminusFILE+00H
 call cfa_THROW+00H
 call cfa_Rgreat+00H
 call cfa_CURSTR+00H
 call cfa_save+00H
 call cfa_Rgreat+00H
 call cfa_SOURCEminusID+09H
 call cfa_Rgreat+00H
 call cfa_nTIB+00H
 call cfa_save+00H
 call cfa_Rgreat+00H
 call cfa_greatIN+00H
 call cfa_save+00H
 call cfa_Rgreat+00H
 call cfa_TIB+09H
 DB 0C3H
AHEADER 0 ,'HEAP-COPY',cfa_HEAPminusCOPY

 call cfa_DUP+00H
 call cfa__0less+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_HEAPminusCOPY+023H-$-4
 call cfa_XLIT+00H
 DD 08H
 call cfa_THROW+00H
 call cfa_DUP+00H
 call cfa_CHARplus+00H
 call cfa_ALLOCATE+00H
 call cfa_THROW+00H
 call cfa_DUP+00H
 call cfa_greatR+00H
 call cfa_SWAP+00H
 call cfa_DUP+00H
 call cfa_greatR+00H
 call cfa_CHARS+00H
 call cfa_MOVE+00H
 call cfa_XLIT+00H
 DD 00H
 call cfa_Rgreat+00H
 call cfa_R_ld+00H
 call cfa_plus+00H
 call cfa_Csave+00H
 call cfa_Rgreat+00H
 DB 0C3H
AHEADER 0 ,'EVALUATE',cfa_EVALUATE

 call cfa_SOURCEminusID+00H
 call cfa_greatR+00H
 call cfa_TIB+00H
 call cfa_greatR+00H
 call cfa_nTIB+00H
 call cfa_A_ld+00H
 call cfa_greatR+00H
 call cfa_greatIN+00H
 call cfa_A_ld+00H
 call cfa_greatR+00H
 call cfa_XLIT+00H
 DD 0FFFFFFFFH
 call cfa_SOURCEminusID+09H
 call cfa_nTIB+00H
 call cfa_save+00H
 call cfa_TIB+09H
 call cfa_greatIN+00H
 call cfa__0save+00H
 call cfa_lessticgreat+00H
 call cfa_INTERPRET+00H
 call cfa_CATCH+00H
 call cfa_Rgreat+00H
 call cfa_greatIN+00H
 call cfa_save+00H
 call cfa_Rgreat+00H
 call cfa_nTIB+00H
 call cfa_save+00H
 call cfa_Rgreat+00H
 call cfa_TIB+09H
 call cfa_Rgreat+00H
 call cfa_SOURCEminusID+09H
 call cfa_THROW+00H
 DB 0C3H
AHEADER 0 ,'RESTORE-SOURCE',cfa_RESTOREminusSOURCE

 call cfa_XLIT+00H
 DD 06H
 call cfa_lessgreat+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_RESTOREminusSOURCE+01EH-$-4
 call cfa_ABORT+00H
 call cfa_CURSTR+00H
 call cfa_save+00H
 call cfa_SOURCEsave+00H
 call cfa_greatIN+00H
 call cfa_save+00H
 call cfa_SOURCEminusID+09H
 call cfa_SOURCEminusIDminusXT+09H
 DB 0C3H
AHEADER 0 ,'SAVE-SOURCE',cfa_SAVEminusSOURCE

 call cfa_SOURCEminusIDminusXT+00H
 call cfa_SOURCEminusID+00H
 call cfa_greatIN+00H
 call cfa_A_ld+00H
 call cfa_SOURCE+00H
 call cfa_CURSTR+00H
 call cfa_A_ld+00H
 call cfa_XLIT+00H
 DD 06H
 DB 0C3H
AHEADER 0 ,'FMAIN',cfa_FMAIN

 call cfa_REFILL+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_FMAIN+017H-$-4
 call cfa_INTERPRET+00H
 DB 0EBH,0E9H
 DB 0C3H
AHEADER 0 ,'MAIN1',cfa_MAIN1

 call cfa_REFILL+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_MAIN1+01CH-$-4
 call cfa_INTERPRET+00H
 call cfa_OKdot+00H
 DB 0EBH,0E4H
 call cfa_BYE+00H
 DB 0C3H
AHEADER 0 ,'QUIT',cfa_QUIT

 call cfa_CONSOLEminusHANDLES+00H
 call cfa_XLIT+00H
 DD 00H
 call cfa_SOURCEminusID+09H
 call cfa__x+00H
 call cfa_lessMAINgreat+00H
 DB 0C3H
AHEADER 0 ,']',cfa__y

 call cfa_TRUE+00H
 call cfa_STATE+00H
 call cfa_save+00H
 DB 0C3H
AHEADER 1 ,'[',cfa__x

 call cfa_STATE+00H
 call cfa__0save+00H
 DB 0C3H
AHEADER 0 ,'OK1',cfa_OK1

 call cfa_STATE+00H
 call cfa_A_ld+00H
 call cfa__0_equ+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_OK1+072H-$-4
 call cfa__SLITERALminusCODE+00H
 DB 03H
 DB ' Ok',0
 call cfa_TYPE+00H
 call cfa_DEPTH+00H
 call cfa_XLIT+00H
 DD 046H
 call cfa_UMIN+00H
 call cfa_XLIT+00H
 DD 00H
 call cfa_YQDO+00H
 DQ cfa_OK1+06DH
 call cfa_XLIT+00H
 DD 02EH
 call cfa_EMIT+00H
 DB 049H
 DB 0FFH,0C6H
 DB 049H
 DB 0FFH,0C7H
;jno cfa_OK1+052H
 DB 071H,0EAH
 DB 041H
 DB 05EH
 DB 041H
 DB 05FH
 DB 059H
 call cfa_CR+00H
 DB 0C3H
AHEADER 0 ,'TYPE_BUFF+',cfa_TYPE_BUFFplus

 call cfa_TYPE_BUFF+00H
 call cfa_dolplussave+00H
 DB 0C3H
AHEADER 0 ,'TYPE_BUFF',cfa_TYPE_BUFF

 call cfa__CREATEminusCODE+00H
 DD 00H,00H
 DB 00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H
AHEADER 0 ,'.S',cfa_dotS

 call cfa_DEPTH+00H
 call cfa_dotSN+00H
 DB 0C3H
AHEADER 0 ,'.SN',cfa_dotSN

 call cfa_greatR+00H
 call cfa_R_ld+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_dotSN+0CFH-$-4
 call cfa_SP_ld+00H
 call cfa_R_ld+00H
 call cfa__1minus+00H
 call cfa_CELLS+00H
 call cfa_plus+00H
 call cfa__ld+00H
 call cfa_DUP+00H
 call cfa__0less+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_dotSN+0B6H-$-4
 call cfa_DUP+00H
 call cfa_UgreatD+00H
 call cfa_lessn+00H
 call cfa_nS+00H
 call cfa_ngreat+00H
 call cfa_TYPE+00H
 call cfa__SLITERALminusCODE+00H
 DB 01H
 DB '(',0
 call cfa_TYPE+00H
 call cfa_ABS+00H
 call cfa_XLIT+00H
 DD 00H
 call cfa_lessn+00H
 call cfa_nS+00H
 call cfa_XLIT+00H
 DD 02DH
 call cfa_HOLD+00H
 call cfa_ngreat+00H
 call cfa_TYPE+00H
 call cfa__SLITERALminusCODE+00H
 DB 02H
 DB ') ',0
 call cfa_TYPE+00H
 DB 0E9H
 DD cfa_dotSN+0BBH-$-4
 call cfa_dot+00H
 call cfa_Rgreat+00H
 call cfa__1minus+00H
 call cfa_greatR+00H
 DB 0E9H
 DD cfa_dotSN+05H-$-4
 DB 048H
 DB 083H,0C4H,08H
 DB 0C3H
AHEADER 0 ,'INTERPRET',cfa_INTERPRET

 call cfa_and_INTERPRET+00H
 call cfa__ld+00H
 call cfa_EXECUTE+00H
 DB 0C3H
AHEADER 0 ,'&INTERPRET',cfa_and_INTERPRET

 call cfa__CREATEminusCODE+00H
 DQ (cfa_INTERPRET_+00H) and 0ffffffffh
 DB 00H,00H,00H
 DB 00H
AHEADER 0 ,'INTERPRET_',cfa_INTERPRET_

 call cfa_SAVEERRque+00H
 call cfa_ON+00H
 call cfa_PARSEminusWORD+00H
 call cfa_DUP+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_INTERPRET_+073H-$-4
 call cfa_SFIND+00H
 call cfa_queDUP+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_INTERPRET_+067H-$-4
 call cfa_DBG+00H
 call cfa_STATE+00H
 call cfa__ld+00H
 call cfa__equ+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_INTERPRET_+05DH-$-4
 call cfa_COMPILEcom+00H
 DB 0E9H
 DD cfa_INTERPRET_+062H-$-4
 call cfa_EXECUTE+00H
 DB 0E9H
 DD cfa_INTERPRET_+06CH-$-4
 call cfa_queSLITERAL+00H
 call cfa_queSTACK+00H
 DB 0EBH,097H
 call cfa__2DROP+00H
 DB 0C3H
AHEADER 0 ,'CHAR',cfa__CHAR

 call cfa_PARSEminusWORD+00H
 call cfa_DROP+00H
 call cfa_C_ld+00H
 DB 0C3H
AHEADER 0 ,'''',cfa_tic

 call cfa_PARSEminusWORD+00H
 call cfa_SFIND+00H
 call cfa__0_equ+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_tic+028H-$-4
 call cfa_XLIT+00H
 DD 0FFFFFEBFH
 call cfa_THROW+00H
 DB 0C3H
AHEADER 0 ,'WORD',cfa__WORD

 call cfa_DUP+00H
 call cfa_PSKIP+00H
 call cfa_PARSE+00H
 call cfa_DUP+00H
 call cfa_HERE+00H
 call cfa_XLIT+00H
 DD 0220H
 call cfa_plus+00H
 call cfa_Csave+00H
 call cfa_HERE+00H
 call cfa_XLIT+00H
 DD 0221H
 call cfa_plus+00H
 call cfa_SWAP+00H
 call cfa_CMOVE+00H
 call cfa_BL+00H
 call cfa_HERE+00H
 call cfa_XLIT+00H
 DD 0220H
 call cfa_plus+00H
 call cfa_COUNT+00H
 call cfa_plus+00H
 call cfa_Lsave+00H
 call cfa_HERE+00H
 call cfa_XLIT+00H
 DD 0220H
 call cfa_plus+00H
 DB 0C3H
AHEADER 0 ,'?COMP',cfa_queCOMP

 call cfa_STATE+00H
 call cfa_A_ld+00H
 call cfa__0_equ+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_queCOMP+028H-$-4
 call cfa_XLIT+00H
 DD 0FFFFFEC8H
 call cfa_THROW+00H
 DB 0C3H
AHEADER 0 ,'?STACK',cfa_queSTACK

 call cfa_SP_ld+00H
 call cfa_S0+00H
 call cfa_A_ld+00H
 call cfa_SWAP+00H
 call cfa_Uless+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_queSTACK+041H-$-4
 call cfa_S0+00H
 call cfa_A_ld+00H
 call cfa_SPsave+00H
 call cfa_XLIT+00H
 DD 0FFFFFFFCH
 call cfa_THROW+00H
 DB 0C3H
AHEADER 0 ,'DEPTH',cfa_DEPTH

 call cfa_SP_ld+00H
 call cfa_S0+00H
 call cfa_A_ld+00H
 call cfa_minus+00H
 call cfa_NEGATE+00H
 call cfa_XLIT+00H
 DD 08H
 call cfa_U_div+00H
 DB 0C3H
AHEADER 0 ,'PROCESS-ERR',cfa_PROCESSminusERR

 call cfa__VECTminusCODE+00H
 DD cfa_NOOP+00H
 call cfa__TOVALUEminusCODE+00H
AHEADER 0 ,'SOURCE-ID-XT',cfa_SOURCEminusIDminusXT

 call cfa__USERminusVALUEminusCODE+00H
 DD reserve+010H
 call cfa__TOUSERminusVALUEminusCODE+00H
AHEADER 0 ,'?SLITERAL',cfa_queSLITERAL

 call cfa__VECTminusCODE+00H
 DD cfa_NOOP+00H
 call cfa__TOVALUEminusCODE+00H
AHEADER 0 ,'?LITERAL',cfa_queLITERAL

 call cfa__VECTminusCODE+00H
 DD cfa_NOOP+00H
 call cfa__TOVALUEminusCODE+00H
AHEADER 0 ,'<MAIN>',cfa_lessMAINgreat

 call cfa__VECTminusCODE+00H
 DD cfa_MAIN1+00H
 call cfa__TOVALUEminusCODE+00H
AHEADER 0 ,'OK.',cfa_OKdot

 call cfa__VECTminusCODE+00H
 DD cfa_OK1+00H
 call cfa__TOVALUEminusCODE+00H
AHEADER 0 ,'ERROR_DO',cfa_ERROR_DO

 call cfa_HminusSTDOUT+00H
 call cfa_greatR+00H
 call cfa_HminusSTDERR+00H
 call cfa_lessticgreat+00H
 call cfa_HminusSTDOUT+00H
 call cfa_XLIT+00H
 DD 0EH
 call cfa_plus+00H
 call cfa_save+00H
 call cfa_CR+00H
 call cfa_ERRFILE+00H
 call cfa_COUNT+00H
 call cfa_TYPE+00H
 call cfa__SLITERALminusCODE+00H
 DB 01H
 DB ':',0
 call cfa_TYPE+00H
 call cfa_ERCURSTR+00H
 call cfa__ld+00H
 call cfa_dot+00H
 call cfa_DUP+00H
 call cfa_XLIT+00H
 DD 0FFFFFFFEH
 call cfa__equ+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_ERROR_DO+0A3H-$-4
 call cfa_DROP+00H
 call cfa_ERRminusTYPE+00H
 call cfa_ERminusA+00H
 call cfa_A_ld+00H
 call cfa_ERminusU+00H
 call cfa_A_ld+00H
 call cfa_TYPE+00H
 call cfa_CR+00H
 DB 0C3H
 call cfa_ERRminusTYPE+00H
 call cfa_DECIMAL+00H
 call cfa__x+00H
 call cfa__SLITERALminusCODE+00H
 DB 07H
 DB 'SPF.ERR',0
 call cfa_R_divO+00H
 call cfa_OPENminusFILE+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_ERROR_DO+011AH-$-4
 call cfa_DROP+00H
 call cfa__SLITERALminusCODE+00H
 DB 07H
 DB 'ERROR #',0
 call cfa_TYPE+00H
 call cfa_dot+00H
 call cfa_CR+00H
 call cfa_Rgreat+00H
 call cfa_lessticgreat+00H
 call cfa_HminusSTDOUT+00H
 call cfa_XLIT+00H
 DD 0EH
 call cfa_plus+00H
 call cfa_save+00H
 DB 0C3H
 call cfa_REFILL+00H
 call cfa__0_equ+00H
 call cfa_nTIB+00H
 call cfa_A_ld+00H
 call cfa__0_equ+00H
 call cfa_OR+00H
 call cfa_PARSEminusWORD+00H
 call cfa_lessticgreat+00H
 call cfa_queSLITERAL+00H
 call cfa_CATCH+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_ERROR_DO+0179H-$-4
 call cfa__2DROP+00H
 call cfa_DROP+00H
 call cfa_XLIT+00H
 DD 0FFFFFFFFH
 call cfa_R_ld+00H
 call cfa_dot+00H
 DB 0E9H
 DD cfa_ERROR_DO+0183H-$-4
 call cfa_R_ld+00H
 call cfa__equ+00H
 call cfa_OR+00H
 call cfa_QBRANCH+00H
;je  cfa_ERROR_DO+011AH
 DB 074H,08BH
 call cfa_greatIN+00H
 call cfa__0save+00H
 call cfa_XLIT+00H
 DD 05CH
 call cfa_PARSE+00H
 call cfa_TYPE+00H
 DB 048H
 DB 083H,0C4H,08H
 call cfa_SOURCEminusID+00H
 call cfa_CLOSEminusFILE+00H
 call cfa_THROW+00H
 call cfa_CR+00H
 call cfa_Rgreat+00H
 call cfa_lessticgreat+00H
 call cfa_HminusSTDOUT+00H
 call cfa_XLIT+00H
 DD 0EH
 call cfa_plus+00H
 call cfa_save+00H
 DB 0C3H
AHEADER 0 ,'ERR-TYPE',cfa_ERRminusTYPE

 call cfa_CR+00H
 call cfa_ERRTIB+00H
 call cfa_COUNT+00H
 call cfa_TYPE+00H
 call cfa_CR+00H
 call cfa_ERRTIB+00H
 call cfa__1plus+00H
 call cfa_ERgreatIN+00H
 call cfa__ld+00H
 call cfa_XLIT+00H
 DD 046H
 call cfa_UMIN+00H
 call cfa_XLIT+00H
 DD 00H
 call cfa_YQDO+00H
 DQ cfa_ERRminusTYPE+094H
 call cfa_COUNT+00H
 call cfa_XLIT+00H
 DD 09H
 call cfa__equ+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_ERRminusTYPE+082H-$-4
 call cfa_XLIT+00H
 DD 09H
 call cfa_EMIT+00H
 DB 0E9H
 DD cfa_ERRminusTYPE+087H-$-4
 call cfa_SPACE+00H
 DB 049H
 DB 0FFH,0C6H
 DB 049H
 DB 0FFH,0C7H
;jno cfa_ERRminusTYPE+051H
 DB 071H,0C2H
 DB 041H
 DB 05EH
 DB 041H
 DB 05FH
 DB 059H
 call cfa__SLITERALminusCODE+00H
 DB 01H
 DB '^',0
 call cfa_TYPE+00H
 call cfa_DROP+00H
 DB 0C3H
AHEADER 0 ,'(ABORT1")',cfa__cABORT1dticcend

 call cfa_ROT+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa__cABORT1dticcend+037H-$-4
 call cfa_ERminusU+00H
 call cfa_save+00H
 call cfa_ERminusA+00H
 call cfa_save+00H
 call cfa_XLIT+00H
 DD 0FFFFFFFEH
 call cfa_THROW+00H
 DB 0E9H
 DD cfa__cABORT1dticcend+03CH-$-4
 call cfa__2DROP+00H
 DB 0C3H
AHEADER 0 ,'?ERROR',cfa_queERROR

 call cfa_SWAP+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_queERROR+01AH-$-4
 call cfa_THROW+00H
 DB 0E9H
 DD cfa_queERROR+01FH-$-4
 call cfa_DROP+00H
 DB 0C3H
AHEADER 0 ,'_ERROR_DO',cfa__ERROR_DO

 call cfa_SAVEERR+00H
 call cfa_CR+00H
 call cfa_ERRFILE+00H
 call cfa_COUNT+00H
 call cfa_TYPE+00H
 call cfa__SLITERALminusCODE+00H
 DB 01H
 DB ':',0
 call cfa_TYPE+00H
 call cfa_ERCURSTR+00H
 call cfa__ld+00H
 call cfa_dot+00H
 call cfa_CR+00H
 call cfa_ERRTIB+00H
 call cfa_COUNT+00H
 call cfa_TYPE+00H
 call cfa_CR+00H
 call cfa_ERRTIB+00H
 call cfa__1plus+00H
 call cfa_ERgreatIN+00H
 call cfa__ld+00H
 call cfa_XLIT+00H
 DD 046H
 call cfa_UMIN+00H
 call cfa_XLIT+00H
 DD 00H
 call cfa_YQDO+00H
 DQ cfa__ERROR_DO+0C9H
 call cfa_COUNT+00H
 call cfa_XLIT+00H
 DD 09H
 call cfa__equ+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa__ERROR_DO+0B7H-$-4
 call cfa_XLIT+00H
 DD 09H
 call cfa_EMIT+00H
 DB 0E9H
 DD cfa__ERROR_DO+0BCH-$-4
 call cfa_SPACE+00H
 DB 049H
 DB 0FFH,0C6H
 DB 049H
 DB 0FFH,0C7H
;jno cfa__ERROR_DO+086H
 DB 071H,0C2H
 DB 041H
 DB 05EH
 DB 041H
 DB 05FH
 DB 059H
 call cfa__SLITERALminusCODE+00H
 DB 01H
 DB '^',0
 call cfa_TYPE+00H
 call cfa_DROP+00H
 call cfa_CR+00H
 call cfa__SLITERALminusCODE+00H
 DB 04H
 DB 'ERR=',0
 call cfa_TYPE+00H
 call cfa_dot+00H
 call cfa_CR+00H
 call cfa_S0+00H
 call cfa_A_ld+00H
 call cfa_SPsave+00H
 call cfa_STATE+00H
 call cfa__0save+00H
 DB 0C3H
AHEADER 0 ,'SAVEERR',cfa_SAVEERR

 call cfa_DUP+00H
 call cfa_SAVEERRque+00H
 call cfa__ld+00H
 call cfa_AND+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_SAVEERR+0A6H-$-4
 call cfa_DBG+00H
 call cfa_SOURCE+00H
 call cfa_ERRTIB+00H
 call cfa_dolsave+00H
 call cfa_greatIN_WORD+00H
 call cfa__ld+00H
 call cfa_ERgreatIN+00H
 call cfa_save+00H
 call cfa_SAVEERRque+00H
 call cfa_OFF+00H
 call cfa_SOURCEminusID+00H
 call cfa_XLIT+00H
 DD 00H
 call cfa_lessgreat+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_SAVEERR+0A6H-$-4
 call cfa_CURFILE+00H
 call cfa_A_ld+00H
 call cfa_ASCIIZgreat+00H
 call cfa_C_divL+00H
 call cfa_UMIN+00H
 call cfa_ERRFILE+00H
 call cfa_dolsave+00H
 call cfa_CURSTR+00H
 call cfa_A_ld+00H
 call cfa_ERCURSTR+00H
 call cfa_Asave+00H
 DB 0C3H
AHEADER 0 ,'ERRFILE',cfa_ERRFILE

 call cfa__CREATEminusCODE+00H
 DD 00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H
AHEADER 0 ,'ERRTIB',cfa_ERRTIB

 call cfa__CREATEminusCODE+00H
 DD 00H,00H
 DB 00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H,00H,00H,00H,00H,00H
 DB 00H,00H,00H
AHEADER 0 ,'(ABORT")',cfa__cABORTdticcend

 call cfa__VECTminusCODE+00H
 DD cfa__cABORT1dticcend+00H
 call cfa__TOVALUEminusCODE+00H
AHEADER 0 ,'ERROR',cfa_ERROR

 call cfa__VECTminusCODE+00H
 DD cfa_ERROR_DO+00H
 call cfa__TOVALUEminusCODE+00H
AHEADER 0 ,'ER>IN',cfa_ERgreatIN

 call cfa__CREATEminusCODE+00H
 DD 00H,00H
AHEADER 0 ,'ERCURSTR',cfa_ERCURSTR

 call cfa__CREATEminusCODE+00H
 DD 00H,00H
AHEADER 0 ,'>IN_WORD',cfa_greatIN_WORD

 call cfa__CREATEminusCODE+00H
 DD 00H,00H
AHEADER 0 ,'SAVEERR?',cfa_SAVEERRque

 call cfa__CREATEminusCODE+00H
 DD 00H,00H
AHEADER 1 ,'I',cfa_I

 call cfa_lessticgreat+00H
 call cfa_DUP+00H
 call cfa__COMPILEcom+00H
 call cfa_XLIT+00H
 DD 04CH
 call cfa_Ccom+00H
 call cfa_XLIT+00H
 DD 0F089H
 call cfa_Wcom+00H
 DB 0C3H
AHEADER 1 ,'+LOOP',cfa_plusLOOP

 call cfa_XLIT+00H
 DD 03H
 call cfa_quePAIRS+00H
 call cfa_XLIT+00H
 DD 049H
 call cfa_Ccom+00H
 call cfa_XLIT+00H
 DD 0C601H
 call cfa_Wcom+00H
 call cfa_XLIT+00H
 DD 049H
 call cfa_Ccom+00H
 call cfa_XLIT+00H
 DD 0C701H
 call cfa_Wcom+00H
 call cfa_lessticgreat+00H
 call cfa_DROP+00H
 call cfa__COMPILEcom+00H
 call cfa_HERE+00H
 call cfa__2plus+00H
 call cfa_minus+00H
 call cfa_DUP+00H
 call cfa_SHORTque+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_plusLOOP+091H-$-4
 call cfa_XLIT+00H
 DD 071H
 call cfa_Ccom+00H
 call cfa_Ccom+00H
 DB 0E9H
 DD cfa_plusLOOP+0C0H-$-4
 call cfa_XLIT+00H
 DD 04H
 call cfa_minus+00H
 call cfa_XLIT+00H
 DD 0FH
 call cfa_Ccom+00H
 call cfa_XLIT+00H
 DD 081H
 call cfa_Ccom+00H
 call cfa_Lcom+00H
 call cfa_XLIT+00H
 DD 05E41H
 call cfa_Wcom+00H
 call cfa_XLIT+00H
 DD 05F41H
 call cfa_Wcom+00H
 call cfa_XLIT+00H
 DD 059H
 call cfa_Ccom+00H
 call cfa_HERE+00H
 call cfa_SWAP+00H
 call cfa_save+00H
 DB 0C3H
AHEADER 1 ,'LOOP',cfa_LOOP

 call cfa_XLIT+00H
 DD 03H
 call cfa_quePAIRS+00H
 call cfa_XLIT+00H
 DD 049H
 call cfa_Ccom+00H
 call cfa_XLIT+00H
 DD 0C6FFH
 call cfa_Wcom+00H
 call cfa_XLIT+00H
 DD 049H
 call cfa_Ccom+00H
 call cfa_XLIT+00H
 DD 0C7FFH
 call cfa_Wcom+00H
 call cfa_HERE+00H
 call cfa__2plus+00H
 call cfa_minus+00H
 call cfa_DUP+00H
 call cfa_SHORTque+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_LOOP+082H-$-4
 call cfa_XLIT+00H
 DD 071H
 call cfa_Ccom+00H
 call cfa_Ccom+00H
 DB 0E9H
 DD cfa_LOOP+0B1H-$-4
 call cfa_XLIT+00H
 DD 04H
 call cfa_minus+00H
 call cfa_XLIT+00H
 DD 0FH
 call cfa_Ccom+00H
 call cfa_XLIT+00H
 DD 081H
 call cfa_Ccom+00H
 call cfa_Lcom+00H
 call cfa_XLIT+00H
 DD 05E41H
 call cfa_Wcom+00H
 call cfa_XLIT+00H
 DD 05F41H
 call cfa_Wcom+00H
 call cfa_XLIT+00H
 DD 059H
 call cfa_Ccom+00H
 call cfa_HERE+00H
 call cfa_SWAP+00H
 call cfa_save+00H
 DB 0C3H
AHEADER 1 ,'?DO',cfa_queDO

 call cfa_lessticgreat+00H
 call cfa_YQDO+00H
 call cfa__COMPILEcom+00H
 call cfa_HERE+00H
 call cfa_XLIT+00H
 DD 00H
 call cfa_Qcom+00H
 call cfa_HERE+00H
 call cfa_XLIT+00H
 DD 03H
 DB 0C3H
AHEADER 1 ,'DO',cfa_DO

 call cfa_lessticgreat+00H
 call cfa_YDO+00H
 call cfa__COMPILEcom+00H
 call cfa_HERE+00H
 call cfa_XLIT+00H
 DD 00H
 call cfa_Qcom+00H
 call cfa_HERE+00H
 call cfa_XLIT+00H
 DD 03H
 DB 0C3H
AHEADER 0 ,'USER',cfa_USER

 call cfa_USERminusCREATE+00H
 call cfa_XLIT+00H
 DD 08H
 call cfa_USERminusALLOT+00H
 DB 0C3H
AHEADER 0 ,'USER-CREATE',cfa_USERminusCREATE

 call cfa_HEADER+00H
 call cfa_HERE+00H
 call cfa_DOESgreatA+00H
 call cfa_save+00H
 call cfa_USERminusCODE+00H
 call cfa_COMPILEcom+00H
 call cfa_USERminusALIGNED+00H
 call cfa_USERminusALLOT+00H
 call cfa_Lcom+00H
 DB 0C3H
AHEADER 0 ,'USER-ALIGNED',cfa_USERminusALIGNED

 call cfa_USERminusHERE+00H
 call cfa_XLIT+00H
 DD 07H
 call cfa_plus+00H
 call cfa_XLIT+00H
 DD 0FFFFFFF8H
 call cfa_AND+00H
 call cfa_DUP+00H
 call cfa_USERminusHERE+00H
 call cfa_minus+00H
 DB 0C3H
AHEADER 0 ,'USER-HERE',cfa_USERminusHERE

 call cfa_USERminusOFFS+00H
 call cfa__ld+00H
 DB 0C3H
AHEADER 0 ,'USER-ALLOT',cfa_USERminusALLOT

 call cfa_USERminusOFFS+00H
 call cfa_plussave+00H
 DB 0C3H
AHEADER 0 ,'VOCABULARY',cfa_VOCABULARY

 call cfa_WORDLIST+00H
 call cfa_DUP+00H
 call cfa_CREATE+00H
 call cfa_Lcom+00H
 call cfa_LATEST+00H
 call cfa_OVER+00H
 call cfa_XLIT+00H
 DD 08H
 call cfa_plus+00H
 call cfa_Lsave+00H
 call cfa_GETminusCURRENT+00H
 call cfa_SWAP+00H
 call cfa_PARsave+00H
 call cfa_VOC+00H
 call cfa__cDOES1cend+00H
 call cfa_Rgreat+00H
 call cfa__ld+00H
 call cfa__CONTEXT+00H
 call cfa_Lsave+00H
 DB 0C3H
AHEADER 0 ,':',cfa_dcoma

 call cfa_HEADER+00H
 call cfa__y+00H
 call cfa_HIDE+00H
 DB 0C3H
AHEADER 0 ,'->VARIABLE',cfa_minusgreatVARIABLE

 call cfa_HEADER+00H
 call cfa_CREATEminusCODE+00H
 call cfa_COMPILEcom+00H
 call cfa_Lcom+00H
 DB 0C3H
AHEADER 0 ,'VALUE',cfa_VALUE

 call cfa_HEADER+00H
 call cfa_QVALUEminusCODE+00H
 call cfa_COMPILEcom+00H
 call cfa_XLIT+00H
 DD 00H
 call cfa_Lcom+00H
 call cfa_QTOVALUEminusCODE+00H
 call cfa_COMPILEcom+00H
 call cfa_Qcom+00H
 DB 0C3H
AHEADER 0 ,'VARIABLE',cfa_VARIABLE

 call cfa_CREATE+00H
 call cfa_XLIT+00H
 DD 00H
 call cfa_Lcom+00H
 call cfa_XLIT+00H
 DD 00H
 call cfa_Lcom+00H
 DB 0C3H
AHEADER 0 ,'(DOES1)',cfa__cDOES1cend

 call cfa_Rgreat+00H
 call cfa_DOESgreatA+00H
 call cfa_A_ld+00H
 call cfa_CFL+00H
 call cfa_plus+00H
 call cfa_minus+00H
 call cfa_DOESgreatA+00H
 call cfa_A_ld+00H
 call cfa__1plus+00H
 call cfa_Lsave+00H
 DB 0C3H
AHEADER 1 ,'DOES>',cfa_DOESgreat

 call cfa_lessticgreat+00H
 call cfa__cDOES1cend+00H
 call cfa_COMPILEcom+00H
 call cfa_lessticgreat+00H
 call cfa_Rgreat+00H
 call cfa_COMPILEcom+00H
 DB 0C3H
AHEADER 0 ,'CREATE',cfa_CREATE

 call cfa_PARSEminusWORD+00H
 call cfa_CREATED+00H
 DB 0C3H
AHEADER 0 ,'CREATED',cfa_CREATED

 call cfa_SHEADER+00H
 call cfa_HERE+00H
 call cfa_DOESgreatA+00H
 call cfa_save+00H
 call cfa_CREATEminusCODE+00H
 call cfa_COMPILEcom+00H
 DB 0C3H
AHEADER 0 ,'HEADER',cfa_HEADER

 call cfa_PARSEminusWORD+00H
 call cfa_SHEADER+00H
 DB 0C3H
AHEADER 0 ,'YSHEADER',cfa_YSHEADER

 call cfa_queYDPgreatlessDP+00H
 call cfa_DBG_CURFILE+00H
 call cfa_com+00H
 call cfa_HERE+00H
 call cfa_XLIT+00H
 DD 00H
 call cfa_com+00H
 call cfa_DUP+00H
 call cfa_LASTminusCFA+00H
 call cfa_save+00H
 call cfa_XLIT+00H
 DD 00H
 call cfa_Lcom+00H
 call cfa_CURSTR+00H
 call cfa_A_ld+00H
 call cfa_Lcom+00H
 call cfa_minusROT+00H
 call cfa_WARNING+00H
 call cfa__ld+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_YSHEADER+0AFH-$-4
 call cfa__2DUP+00H
 call cfa_GETminusCURRENT+00H
 call cfa_SEARCHminusWORDLIST+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_YSHEADER+0AFH-$-4
 call cfa_DROP+00H
 call cfa__2DUP+00H
 call cfa_TYPE+00H
 call cfa__SLITERALminusCODE+00H
 DB 0DH
 DB ' isn''t unique',0
 call cfa_TYPE+00H
 call cfa_CR+00H
 call cfa_CURRENT+00H
 call cfa__ld+00H
 call cfa_plusSWORD+00H
 call cfa_queYDPgreatlessDP+00H
 call cfa_CFA_ALIGN+00H
 call cfa_HERE+00H
 call cfa_SWAP+00H
 call cfa_save+00H
 DB 0C3H
AHEADER 0 ,'CFA_ALIGN',cfa_CFA_ALIGN

 call cfa__VECTminusCODE+00H
 DD cfa_NOOP+00H
 call cfa__TOVALUEminusCODE+00H
AHEADER 0 ,'?YDP><DP',cfa_queYDPgreatlessDP

 call cfa_YDP_FL+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_queYDPgreatlessDP+038H-$-4
 call cfa_YDP+00H
 call cfa__ld+00H
 call cfa_DP+00H
 call cfa__ld+00H
 call cfa_YDP+00H
 call cfa_save+00H
 call cfa_DP+00H
 call cfa_save+00H
 DB 0C3H
AHEADER 0 ,'YDP><DP',cfa_YDPgreatlessDP

 call cfa_YDP+00H
 call cfa__ld+00H
 call cfa_DP+00H
 call cfa__ld+00H
 call cfa_YDP+00H
 call cfa_save+00H
 call cfa_DP+00H
 call cfa_save+00H
 DB 0C3H
AHEADER 0 ,'YDP_FL',cfa_YDP_FL

 call cfa__QVALUEminusCODE+00H
 DD 00H
 call cfa__QTOVALUEminusCODE+00H
 DD 00H
 DD 00H
AHEADER 0 ,'YDP0',cfa_YDP0

 call cfa__CREATEminusCODE+00H
 DD 00H,0FF63D2E8H
AHEADER 0 ,'YDP',cfa_YDP

 call cfa__CREATEminusCODE+00H
 DD 00H,0FCD5C0E8H
AHEADER 0 ,'LAST-NON',cfa_LASTminusNON

 call cfa__USERminusVALUEminusCODE+00H
 DD reserve+08H
 call cfa__TOUSERminusVALUEminusCODE+00H
AHEADER 0 ,'LAST-CFA',cfa_LASTminusCFA

 call cfa__USERminusCODE+00H
 DD reserve+00H
AHEADER 1 ,'ABORT"',cfa_ABORTdtic

 call cfa_queCOMP+00H
 call cfa_Sdtic+00H
 call cfa_tic_cABORTdticcend+00H
 call cfa_COMPILEcom+00H
 DB 0C3H
AHEADER 1 ,'[CHAR]',cfa__xCHAR_y

 call cfa_queCOMP+00H
 call cfa_PARSEminusWORD+00H
 call cfa_DROP+00H
 call cfa_C_ld+00H
 call cfa_LITERAL+00H
 DB 0C3H
AHEADER 1 ,'."',cfa_dotdtic

 call cfa_queCOMP+00H
 call cfa_Sdtic+00H
 call cfa_ticTYPE+00H
 call cfa_COMPILEcom+00H
 DB 0C3H
AHEADER 1 ,'C"',cfa_Cdtic

 call cfa_XLIT+00H
 DD 022H
 call cfa__WORD+00H
 call cfa_CLITERAL+00H
 DB 0C3H
AHEADER 1 ,'S"',cfa_Sdtic

 call cfa_XLIT+00H
 DD 022H
 call cfa_PARSE+00H
 call cfa_SLITERAL+00H
 DB 0C3H
AHEADER 1 ,'CLITERAL',cfa_CLITERAL

 call cfa_STATE+00H
 call cfa_A_ld+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_CLITERAL+01AH-$-4
 call cfa_CLITcom+00H
 DB 0C3H
AHEADER 1 ,'SLITERAL',cfa_SLITERAL

 call cfa_STATE+00H
 call cfa_A_ld+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_SLITERAL+01FH-$-4
 call cfa_SLITcom+00H
 DB 0E9H
 DD cfa_SLITERAL+03CH-$-4
 call cfa__2DUP+00H
 call cfa_plus+00H
 call cfa_XLIT+00H
 DD 00H
 call cfa_SWAP+00H
 call cfa_Csave+00H
 DB 0C3H
AHEADER 1 ,'2LITERAL',cfa__2LITERAL

 call cfa_STATE+00H
 call cfa_A_ld+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa__2LITERAL+01AH-$-4
 call cfa_DLITcom+00H
 DB 0C3H
AHEADER 1 ,'LITERAL',cfa_LITERAL

 call cfa_STATE+00H
 call cfa_A_ld+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_LITERAL+01AH-$-4
 call cfa_LITcom+00H
 DB 0C3H
AHEADER 1 ,'['']',cfa__xtic_y

 call cfa_queCOMP+00H
 call cfa_tic+00H
 call cfa_LITcom+00H
 DB 0C3H
AHEADER 0 ,'R/W',cfa_R_divW

 call cfa__CONSTANTminusCODE+00H
 DD 0C0000000H
AHEADER 0 ,'W/O',cfa_W_divO

 call cfa__CONSTANTminusCODE+00H
 DD 040000000H
AHEADER 0 ,'R/O',cfa_R_divO

 call cfa__CONSTANTminusCODE+00H
 DD 080000000H
AHEADER 0 ,'*/',cfa__mul_div

 call cfa__mul_divMOD+00H
 call cfa_NIP+00H
 DB 0C3H
AHEADER 0 ,'CHARS',cfa_CHARS

 DB 0C3H
AHEADER 0 ,',',cfa_com

 call cfa_HERE+00H
 call cfa_save+00H
 call cfa_CELL+00H
 call cfa_ALLOT+00H
 DB 0C3H
AHEADER 0 ,'<''>',cfa_lessticgreat

 call cfa_Rgreat+00H
 call cfa__1plus+00H
 call cfa_DUP+00H
 call cfa_XLIT+00H
 DD 04H
 call cfa_plus+00H
 call cfa_greatR+00H
 call cfa_REL_ld+00H
 call cfa_XLIT+00H
 DD 04H
 call cfa_plus+00H
 DB 0C3H
AHEADER 0 ,'REL@',cfa_REL_ld

 call cfa_DUP+00H
 call cfa_SL_ld+00H
 call cfa_plus+00H
 DB 0C3H
AHEADER 0 ,'SHORT?',cfa_SHORTque

 call cfa_XLIT+00H
 DD 080H
 call cfa_plus+00H
 call cfa_XLIT+00H
 DD 0100H
 call cfa_Uless+00H
 DB 0C3H
AHEADER 0 ,'ASCII-Z',cfa_ASCIIminusZ

 call cfa_DUP+00H
 call cfa_greatR+00H
 call cfa_dolsave+00H
 call cfa_Rgreat+00H
 call cfa_COUNT+00H
 call cfa_OVER+00H
 call cfa_plus+00H
 call cfa_XLIT+00H
 DD 00H
 call cfa_SWAP+00H
 call cfa_Csave+00H
 DB 0C3H
AHEADER 0 ,'$+!',cfa_dolplussave

 call cfa_plusPLACE+00H
 DB 0C3H
AHEADER 0 ,'$!',cfa_dolsave

 call cfa_PLACE+00H
 DB 0C3H
AHEADER 0 ,'TOUSER-VALUE-CODE',cfa_TOUSERminusVALUEminusCODE

 call cfa__QVALUEminusCODE+00H
 DD 00H
 call cfa__QTOVALUEminusCODE+00H
 DD 056204EH
 DD 00H
AHEADER 0 ,'USER-VALUE-CODE',cfa_USERminusVALUEminusCODE

 call cfa__QVALUEminusCODE+00H
 DD 00H
 call cfa__QTOVALUEminusCODE+00H
 DD 0562028H
 DD 00H
AHEADER 0 ,'DOES-CODE',cfa_DOESminusCODE

 call cfa__QVALUEminusCODE+00H
 DD 00H
 call cfa__QTOVALUEminusCODE+00H
 DD 00H
 DD 00H
AHEADER 0 ,'C+PLACE',cfa_CplusPLACE

 call cfa_DUP+00H
 call cfa__1plussave+00H
 call cfa_COUNT+00H
 call cfa_plus+00H
 call cfa__1minus+00H
 call cfa_Csave+00H
 DB 0C3H
AHEADER 0 ,'+PLACE',cfa_plusPLACE

 call cfa_greatR+00H
 call cfa_dticCLIPdtic+00H
 call cfa_MAXCOUNTED+00H
 call cfa_R_ld+00H
 call cfa_C_ld+00H
 call cfa_minus+00H
 call cfa_MIN+00H
 call cfa_Rgreat+00H
 call cfa__2DUP+00H
 call cfa__2greatR+00H
 call cfa_COUNT+00H
 call cfa_plus+00H
 call cfa_SWAP+00H
 call cfa_MOVE+00H
 call cfa__2Rgreat+00H
 call cfa_plussave+00H
 DB 0C3H
AHEADER 0 ,'PLACE',cfa_PLACE

 call cfa_SWAP+00H
 call cfa_dticCLIPdtic+00H
 call cfa_SWAP+00H
 call cfa__2DUP+00H
 call cfa__2greatR+00H
 call cfa_CHARplus+00H
 call cfa_SWAP+00H
 call cfa_MOVE+00H
 call cfa__2Rgreat+00H
 call cfa_Csave+00H
 DB 0C3H
AHEADER 0 ,'"CLIP"',cfa_dticCLIPdtic

 call cfa_MAXCOUNTED+00H
 call cfa_MIN+00H
 call cfa_XLIT+00H
 DD 00H
 call cfa_MAX+00H
 DB 0C3H
AHEADER 0 ,'MAXCOUNTED',cfa_MAXCOUNTED

 call cfa__CONSTANTminusCODE+00H
 DD 0FFH
AHEADER 0 ,'MOVE',cfa_MOVE

 call cfa_greatR+00H
 call cfa__2DUP+00H
 call cfa_SWAP+00H
 call cfa_R_ld+00H
 call cfa_plus+00H
 call cfa_Uless+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_MOVE+05CH-$-4
 call cfa__2DUP+00H
 call cfa_Uless+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_MOVE+04DH-$-4
 call cfa_Rgreat+00H
 call cfa_CMOVEgreat+00H
 DB 0E9H
 DD cfa_MOVE+057H-$-4
 call cfa_Rgreat+00H
 call cfa_CMOVE+00H
 DB 0E9H
 DD cfa_MOVE+066H-$-4
 call cfa_Rgreat+00H
 call cfa_CMOVE+00H
 DB 0C3H
AHEADER 0 ,'ON',cfa_ON

 call cfa_XLIT+00H
 DD 0FFFFFFFFH
 call cfa_SWAP+00H
 call cfa_save+00H
 DB 0C3H
AHEADER 0 ,'OFF',cfa_OFF

 call cfa_XLIT+00H
 DD 00H
 call cfa_SWAP+00H
 call cfa_save+00H
 DB 0C3H
AHEADER 0 ,'xSEARCH',cfa_xSEARCH

 call cfa__2greatR+00H
 call cfa__2DUP+00H
 call cfa_DUP+00H
 call cfa__1plus+00H
 call cfa_R_ld+00H
 call cfa_great+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_xSEARCH+077H-$-4
 call cfa_OVER+00H
 call cfa__2R_ld+00H
 call cfa_TUCK+00H
 call cfa_xCOMPARE+00H
 call cfa__0_equ+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_xSEARCH+061H-$-4
 DB 048H
 DB 083H,0C4H,010H
 call cfa__2SWAP+00H
 call cfa__2DROP+00H
 call cfa_TRUE+00H
 DB 0C3H
 call cfa__1minus+00H
 call cfa_SWAP+00H
 call cfa__1plus+00H
 call cfa_SWAP+00H
 DB 0EBH,093H
 DB 048H
 DB 083H,0C4H,010H
 call cfa__2DROP+00H
 call cfa_XLIT+00H
 DD 00H
 DB 0C3H
AHEADER 0 ,'xCOMPARE',cfa_xCOMPARE

 call cfa_ROT+00H
 call cfa__2DUP+00H
 call cfa_minus+00H
 call cfa_greatR+00H
 call cfa_MIN+00H
 call cfa_DUP+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_xCOMPARE+0A9H-$-4
 call cfa_greatR+00H
 call cfa_OVER+00H
 call cfa_C_ld+00H
 call cfa_OVER+00H
 call cfa_C_ld+00H
 call cfa_minus+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_xCOMPARE+070H-$-4
 call cfa_SWAP+00H
 call cfa_C_ld+00H
 call cfa_SWAP+00H
 call cfa_C_ld+00H
 call cfa_minus+00H
 DB 048H
 DB 083H,0C4H,010H
 DB 0C3H
 call cfa__1plus+00H
 call cfa_SWAP+00H
 call cfa__1plus+00H
 call cfa_SWAP+00H
 call cfa_Rgreat+00H
 call cfa__1minus+00H
 call cfa_DUP+00H
 call cfa_greatR+00H
 call cfa__0_equ+00H
 call cfa_QBRANCH+00H
;je  cfa_xCOMPARE+02EH
 DB 074H,08AH
 call cfa_Rgreat+00H
 call cfa_DROP+00H
 call cfa_DROP+00H
 call cfa_DROP+00H
 call cfa_Rgreat+00H
 call cfa_NEGATE+00H
 DB 0C3H
AHEADER 0 ,'SEARCH',cfa_SEARCH

 call cfa__2greatR+00H
 call cfa__2DUP+00H
 call cfa_DUP+00H
 call cfa__1plus+00H
 call cfa_R_ld+00H
 call cfa_great+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_SEARCH+077H-$-4
 call cfa_OVER+00H
 call cfa__2R_ld+00H
 call cfa_TUCK+00H
 call cfa_COMPARE+00H
 call cfa__0_equ+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_SEARCH+061H-$-4
 DB 048H
 DB 083H,0C4H,010H
 call cfa__2SWAP+00H
 call cfa__2DROP+00H
 call cfa_TRUE+00H
 DB 0C3H
 call cfa__1minus+00H
 call cfa_SWAP+00H
 call cfa__1plus+00H
 call cfa_SWAP+00H
 DB 0EBH,093H
 DB 048H
 DB 083H,0C4H,010H
 call cfa__2DROP+00H
 call cfa_XLIT+00H
 DD 00H
 DB 0C3H
AHEADER 0 ,'COMPARE',cfa_COMPARE

 call cfa_ROT+00H
 call cfa__2DUP+00H
 call cfa_minus+00H
 call cfa_greatR+00H
 call cfa_MIN+00H
 call cfa_DUP+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_COMPARE+0A9H-$-4
 call cfa_greatR+00H
 call cfa_OVER+00H
 call cfa_C_ld+00H
 call cfa_OVER+00H
 call cfa_C_ld+00H
 call cfa_minus+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_COMPARE+070H-$-4
 call cfa_SWAP+00H
 call cfa_C_ld+00H
 call cfa_SWAP+00H
 call cfa_C_ld+00H
 call cfa_minus+00H
 DB 048H
 DB 083H,0C4H,010H
 DB 0C3H
 call cfa__1plus+00H
 call cfa_SWAP+00H
 call cfa__1plus+00H
 call cfa_SWAP+00H
 call cfa_Rgreat+00H
 call cfa__1minus+00H
 call cfa_DUP+00H
 call cfa_greatR+00H
 call cfa__0_equ+00H
 call cfa_QBRANCH+00H
;je  cfa_COMPARE+02EH
 DB 074H,08AH
 call cfa_Rgreat+00H
 call cfa_DROP+00H
 call cfa_DROP+00H
 call cfa_DROP+00H
 call cfa_Rgreat+00H
 call cfa_NEGATE+00H
 DB 0C3H
AHEADER 0 ,'AASAVE0',cfa_AASAVE0

 call cfa__CREATEminusCODE+00H
 DD 00H,0FCDD8FE8H
AHEADER 0 ,'AASAVE',cfa_AASAVE

 call cfa__CREATEminusCODE+00H
 DD 00H,0FCDC05E8H
AHEADER 0 ,'U<=',cfa_Uless_equ

 call cfa_Ugreat+00H
 call cfa__0_equ+00H
 DB 0C3H
AHEADER 0 ,'BLANK',cfa_BLANK

 call cfa_BL+00H
 call cfa_FILL+00H
 DB 0C3H
AHEADER 0 ,'ERASE',cfa_ERASE

 call cfa_XLIT+00H
 DD 00H
 call cfa_FILL+00H
 DB 0C3H
AHEADER 0 ,'0MAX',cfa__0MAX

 call cfa_XLIT+00H
 DD 00H
 call cfa_MAX+00H
 DB 0C3H
AHEADER 0 ,'DABS',cfa_DABS

 call cfa_DUP+00H
 call cfa__0less+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_DABS+01AH-$-4
 call cfa_DNEGATE+00H
 DB 0C3H
AHEADER 0 ,'?PAIRS',cfa_quePAIRS

 call cfa_XOR+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa_quePAIRS+01EH-$-4
 call cfa_XLIT+00H
 DD 0FFFFFFEAH
 call cfa_THROW+00H
 DB 0C3H
AHEADER 0 ,'DBG1',cfa_DBG1

 DB 0C3H
AHEADER 0 ,'DBG',cfa_DBG

 DB 0C3H
AHEADER 0 ,'FALSE',cfa_FALSE

 call cfa__CONSTANTminusCODE+00H
 DD 00H
AHEADER 0 ,'TRUE',cfa_TRUE

 call cfa__CONSTANTminusCODE+00H
 DD 0FFFFFFFFH
AHEADER 0 ,'CELL',cfa_CELL

 call cfa__CONSTANTminusCODE+00H
 DD 08H
AHEADER 1 ,'[THEN]',cfa__xTHEN_y

 DB 0C3H
AHEADER 1 ,'[IF]',cfa__xIF_y

 call cfa__0_equ+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa__xIF_y+015H-$-4
 call cfa__xELSE_y+00H
 DB 0C3H
AHEADER 1 ,'[ELSE]',cfa__xELSE_y

 call cfa_XLIT+00H
 DD 01H
 call cfa_PARSEminusNAME+00H
 call cfa__2DUP+00H
 call cfa_V_UPPER+00H
 call cfa_DUP+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa__xELSE_y+0E0H-$-4
 call cfa__2DUP+00H
 call cfa_XLIT+00H
 DD 03H
 call cfa_UMIN+00H
 call cfa__SLITERALminusCODE+00H
 DB 03H
 DB '[IF',0
 call cfa_COMPARE+00H
 call cfa__0_equ+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa__xELSE_y+069H-$-4
 call cfa__2DROP+00H
 call cfa__1plus+00H
 DB 0E9H
 DD cfa__xELSE_y+0DBH-$-4
 call cfa__2DUP+00H
 call cfa__SLITERALminusCODE+00H
 DB 06H
 DB '[ELSE]',0
 call cfa_COMPARE+00H
 call cfa__0_equ+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa__xELSE_y+0B4H-$-4
 call cfa__2DROP+00H
 call cfa__1minus+00H
 call cfa_DUP+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa__xELSE_y+0AFH-$-4
 call cfa__1plus+00H
 DB 0E9H
 DD cfa__xELSE_y+0DBH-$-4
 call cfa__SLITERALminusCODE+00H
 DB 06H
 DB '[THEN]',0
 call cfa_COMPARE+00H
 call cfa__0_equ+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa__xELSE_y+0DBH-$-4
 call cfa__1minus+00H
 DB 0E9H
 DD cfa__xELSE_y+0EFH-$-4
 call cfa__2DROP+00H
 call cfa_REFILL+00H
 call cfa_AND+00H
 call cfa_DUP+00H
 call cfa__0_equ+00H
 call cfa_QBRANCH+00H
 DW 0840FH
 DD cfa__xELSE_y+09H-$-4
 call cfa_DROP+00H
 DB 0C3H
AHEADER 0 ,'V_UPPER',cfa_V_UPPER

 call cfa__VECTminusCODE+00H
 DD cfa__2DROP+00H
 call cfa__TOVALUEminusCODE+00H
