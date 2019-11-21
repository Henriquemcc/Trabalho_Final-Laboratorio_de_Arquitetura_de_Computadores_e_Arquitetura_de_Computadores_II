# MPLAB IDE generated this makefile for use with GNU make.
# Project: ProjetoFinal.mcp
# Date: Thu Nov 21 16:09:58 2019

AS = MPASMWIN.exe
CC = 
LD = mplink.exe
AR = mplib.exe
RM = rm

ProjetoFinal.cof : Final.o
	$(CC) /p16F628A "Final.o" /u_DEBUG /z__MPLAB_BUILD=1 /z__MPLAB_DEBUG=1 /o"ProjetoFinal.cof" /M"ProjetoFinal.map" /W

Final.o : Final.asm ../../../../../../Program\ Files\ (x86)/Microchip/MPASM\ Suite/P16F628A.INC
	$(AS) /q /p16F628A "Final.asm" /l"Final.lst" /e"Final.err" /o"Final.o" /d__DEBUG=1

clean : 
	$(CC) "Final.o" "Final.err" "Final.lst" "ProjetoFinal.cof" "ProjetoFinal.hex"

