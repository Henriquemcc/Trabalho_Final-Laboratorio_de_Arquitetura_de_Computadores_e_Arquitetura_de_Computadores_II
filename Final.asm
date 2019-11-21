;Projeto Final
LIST   P=PIC16F628A
RADIX DEC	
#INCLUDE <P16F628A.INC>
	__CONFIG _INTRC_OSC_NOCLKOUT & _WDT_OFF & _PWRTE_ON & _BODEN_OFF & _LVP_OFF & _CP_OFF & _MCLRE_OFF & _DATA_CP_OFF 
	;ou __CONFIG H'3F10'
	#DEFINE BANK0 BCF STATUS,RP0;SETA BANK 0 DE MEM�RIA
	#DEFINE BANK1 BSF STATUS,RP0;SETA BANK 1 DE MAM�RIA
	CBLOCK	0x20	;ENDERE�O INICIAL DA MEMORIA DE
					;USU��RIO
	CONTADOR1
	CONTADOR2
	CONTADOR3
	CONTADOR4
	CONTADOR5
	ENDC ;FIM DO BLOCO DE MEMORIA
	#DEFINE BTN  PORTA,2  ;PORTA DO BOT�O ;0=>PRESSIONADO
										  ;1=>LIBERADO
	#DEFINE VERMELHO1 PORTB,0 
	#DEFINE VERMELHO2 PORTB,3
	#DEFINE AMARELO1 PORTB,1
	#DEFINE AMARELO2 PORTB,4
	#DEFINE VERDE1 PORTB,2
	#DEFINE VERDE2 PORTB,5			
	
	ORG	0x00		;ENDERE�O INICIAL DE PROCESSAMENTO
	GOTO	INICIO
		
INICIO
	BANK1;ALTERA PARA O BANCO 1
	MOVLW B'00000100'
	MOVWF TRISA;DEFINE RA1 COMO ENTRADA E DEMAIS COMO SA�DAS
	MOVLW B'00000000'
	MOVWF TRISB;DEFINE TODO O PORTB COMO SA�DA
	MOVLW B'00000000'
	MOVWF INTCON;TODAS AS INTERRUP��ES DESLIGADAS
	BANK0;RETORNA PARA O BANCO 0
	MOVLW B'00000111'
	MOVWF CMCON;
REPETE
	CLRF PORTA;LIMPA O PORTA
	CLRF PORTB;LIMPA O PORTB
	BSF  VERDE2
	CALL ATRASO       ;Vai para ATRASO
	BCF  VERDE2
	
	BSF  VERDE1
	CALL ATRASO       ;Vai para ATRASO
	BCF  VERDE1

	BSF  VERDE1
	CALL ATRASO       ;Vai para ATRASO
	BCF  VERDE1

	BSF  VERMELHO2
	CALL ATRASO       ;Vai para ATRASO
	BCF  VERMELHO2

	BSF  VERDE2
	CALL ATRASO       ;Vai para ATRASO
	BCF  VERDE2

	BSF  VERMELHO1
	CALL ATRASO       ;Vai para ATRASO
	BCF  VERMELHO1

	BSF  AMARELO1
	CALL ATRASO       ;Vai para ATRASO
	BCF  AMARELO1

	BSF  VERMELHO2
	CALL ATRASO       ;Vai para ATRASO
	BCF  VERMELHO2

	BSF  AMARELO2
	CALL ATRASO       ;Vai para ATRASO
	BCF  AMARELO2

 	BSF  VERDE2
	CALL ATRASO       ;Vai para ATRASO
	BCF  VERDE2

	BSF  VERDE1
	CALL ATRASO       ;Vai para ATRASO
	BCF  VERDE1

	BSF  VERMELHO1
	CALL ATRASO       ;Vai para ATRASO
	BCF  VERMELHO1

	BSF  AMARELO1
	CALL ATRASO       ;Vai para ATRASO
	BCF  AMARELO1

	BSF  VERDE1
	CALL ATRASO       ;Vai para ATRASO
	BCF  VERDE1

	BSF  VERMELHO2
	CALL ATRASO       ;Vai para ATRASO
	BCF  VERMELHO2

	BSF  AMARELO1
	CALL ATRASO       ;Vai para ATRASO
	BCF  AMARELO1

 	BSF  VERDE2
	CALL ATRASO       ;Vai para ATRASO
	BCF  VERDE2

	GOTO REPETE       ;Volta para inicio 			
ATRASO
	MOVLW 32
	MOVWF CONTADOR1
ATRASO1
	CALL BTN_ATR ;GERA O ATRASO DE VERIFICA��O DO BOT�O
	BTFSS  BTN
	CALL   BTN_PRESS
	DECFSZ CONTADOR1
	GOTO   ATRASO1
	RETURN

BTN_ATR
	MOVLW 255			
	MOVWF CONTADOR4
	MOVLW 40
	MOVWF CONTADOR5
BTN_ATR_1
	DECFSZ CONTADOR4
	GOTO   BTN_ATR_1
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	DECFSZ CONTADOR5
	GOTO   BTN_ATR_1
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	RETURN
	
BTN_PRESS
	BTFSC   VERMELHO1
	GOTO    FIMCLEAR
	BTFSC   VERMELHO2
	GOTO    FIMCLEAR
	RETURN
FIMCLEAR
	BSF  VERMELHO1
	BSF  VERMELHO2
	BSF  AMARELO1
	BSF  AMARELO2
	BSF  VERDE1
	BSF  VERDE2
	CALL FIMCLEAR_ATRASO
	RETURN
FIMCLEAR_ATRASO
	MOVLW 255
	MOVWF CONTADOR2
FIMCLEAR_ATRASO_1
	NOP
	DECFSZ CONTADOR2
	GOTO FIMCLEAR_ATRASO_1
	RETURN
END
