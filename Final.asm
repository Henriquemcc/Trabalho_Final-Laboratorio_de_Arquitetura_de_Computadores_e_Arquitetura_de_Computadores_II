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
	ENDC ;FIM DO BLOCO DE MEMORIA
	#DEFINE BTN  PORTA,2  ;PORTA DO BOT�O ;0=>PRESSIONADO
										  ;1=>LIBERADO
	#DEFINE VER1 PORTB,0
	#DEFINE VER2 PORTB,3
	#DEFINE AMA1 PORTB,1
	#DEFINE AMA2 PORTB,4
	#DEFINE VED1 PORTB,2
	#DEFINE VED2 PORTB,5			
	
	ORG	0x00		;ENDERE�O INICIAL DE PROCESSAMENTO
	GOTO	INICIO
		
INICIO
	CLRF PORTA;LIMPA O PORTA
	CLRF PORTB;LIMPA O PORTB
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
	
	CALL ATRASO       ;Vai para ATRASO
	GOTO REPETE       ;Volta para inicio 
ATRASO
	MOVLW 255			;PRA CADA 1 +3US
	MOVWF CONTADOR1
	MOVLW 40
	MOVWF CONTADOR2			
ATRASO1
	DECFSZ	CONTADOR1
	GOTO	ATRASO1
	DECFSZ  CONTADOR2
	GOTO    ATRASO1
	BTFSS   BTN
	CALL    BTN_PRESS
	CALL    ATRASO2
	CALL    ATRASO2
	RETURN
ATRASO2
	MOVLW 150			;PRA CADA 1 +3US
	MOVWF CONTADOR1
	MOVLW 146
	MOVWF CONTADOR2
ATRASO3
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
	DECFSZ	CONTADOR1
	GOTO	ATRASO3
	DECFSZ  CONTADOR2
	GOTO    ATRASO3
	RETURN
	
BTN_PRESS
	BTFSC   VER1
	GOTO FIMCLEAR
	BTFSC   VER2
	GOTO FIMCLEAR
	RETURN
FIMCLEAR
	 
END
