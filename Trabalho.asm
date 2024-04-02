
_main:

;Trabalho.c,17 :: 		void main() {
;Trabalho.c,18 :: 		int end=0,control=1,seg=0,min=0,p=0,aux,aux2,i,j,disp2,disp3,disp4,number[10] = {63,6,91,79,102,109,125,7,127,111};
	MOVLW       ?ICSmain_end_L0+0
	MOVWF       TBLPTRL+0 
	MOVLW       hi_addr(?ICSmain_end_L0+0)
	MOVWF       TBLPTRL+1 
	MOVLW       higher_addr(?ICSmain_end_L0+0)
	MOVWF       TBLPTRL+2 
	MOVLW       main_end_L0+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(main_end_L0+0)
	MOVWF       FSR1L+1 
	MOVLW       30
	MOVWF       R0 
	MOVLW       1
	MOVWF       R1 
	CALL        ___CC2DW+0, 0
;Trabalho.c,21 :: 		TRISA = 0b00000101;
	MOVLW       5
	MOVWF       TRISA+0 
;Trabalho.c,22 :: 		TRISD = 0;
	CLRF        TRISD+0 
;Trabalho.c,23 :: 		TRISC = 0;
	CLRF        TRISC+0 
;Trabalho.c,25 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;Trabalho.c,26 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Trabalho.c,28 :: 		ADCON1 = 0b00001100;
	MOVLW       12
	MOVWF       ADCON1+0 
;Trabalho.c,29 :: 		Pwm1_init(5000);
	BSF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       99
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;Trabalho.c,31 :: 		tmr0l = 0xf7;
	MOVLW       247
	MOVWF       TMR0L+0 
;Trabalho.c,32 :: 		tmr0h = 0xc2;
	MOVLW       194
	MOVWF       TMR0H+0 
;Trabalho.c,33 :: 		t0con = 0b10000100;
	MOVLW       132
	MOVWF       T0CON+0 
;Trabalho.c,34 :: 		intcon.tmr0if = 0;
	BCF         INTCON+0, 2 
;Trabalho.c,35 :: 		PORTD = 0;
	CLRF        PORTD+0 
;Trabalho.c,37 :: 		while(1){
L_main0:
;Trabalho.c,38 :: 		TRISB = 0b00111100;
	MOVLW       60
	MOVWF       TRISB+0 
;Trabalho.c,39 :: 		tmp = ADC_Read(2)/2;
	MOVLW       2
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	RRCF        R5, 1 
	RRCF        R4, 1 
	BCF         R5, 7 
	MOVF        R4, 0 
	MOVWF       R0 
	MOVF        R5, 0 
	MOVWF       R1 
	CALL        _word2double+0, 0
	MOVF        R0, 0 
	MOVWF       main_tmp_L0+0 
	MOVF        R1, 0 
	MOVWF       main_tmp_L0+1 
	MOVF        R2, 0 
	MOVWF       main_tmp_L0+2 
	MOVF        R3, 0 
	MOVWF       main_tmp_L0+3 
;Trabalho.c,40 :: 		poten = (ADC_Read(0)/10.23); //100-(ADC_Read(0)/10.23);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	CALL        _word2double+0, 0
	MOVLW       20
	MOVWF       R4 
	MOVLW       174
	MOVWF       R5 
	MOVLW       35
	MOVWF       R6 
	MOVLW       130
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       main_poten_L0+0 
	MOVF        R1, 0 
	MOVWF       main_poten_L0+1 
	MOVF        R2, 0 
	MOVWF       main_poten_L0+2 
	MOVF        R3, 0 
	MOVWF       main_poten_L0+3 
;Trabalho.c,41 :: 		WordToStr(tmp, t1);
	MOVF        main_tmp_L0+0, 0 
	MOVWF       R0 
	MOVF        main_tmp_L0+1, 0 
	MOVWF       R1 
	MOVF        main_tmp_L0+2, 0 
	MOVWF       R2 
	MOVF        main_tmp_L0+3, 0 
	MOVWF       R3 
	CALL        _double2word+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       main_t1_L0+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(main_t1_L0+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;Trabalho.c,42 :: 		WordToStr(p, t2);
	MOVF        main_p_L0+0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        main_p_L0+1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       main_t2_L0+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(main_t2_L0+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;Trabalho.c,43 :: 		WordToStr(poten, t3);
	MOVF        main_poten_L0+0, 0 
	MOVWF       R0 
	MOVF        main_poten_L0+1, 0 
	MOVWF       R1 
	MOVF        main_poten_L0+2, 0 
	MOVWF       R2 
	MOVF        main_poten_L0+3, 0 
	MOVWF       R3 
	CALL        _double2word+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       main_t3_L0+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(main_t3_L0+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;Trabalho.c,44 :: 		Pwm1_Start();   //Liga o cooler
	CALL        _PWM1_Start+0, 0
;Trabalho.c,45 :: 		Lcd_Out(1,1,"Temp: ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_Trabalho+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_Trabalho+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Trabalho.c,46 :: 		Lcd_Out(1,7,t1);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       7
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_t1_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_t1_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Trabalho.c,47 :: 		Lcd_Out(2,1, "Porta: ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_Trabalho+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_Trabalho+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Trabalho.c,48 :: 		Lcd_Out(2,7, t2);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       7
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_t2_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_t2_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Trabalho.c,49 :: 		Lcd_Out(3,-(3), "Poten: ");
	MOVLW       3
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       253
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_Trabalho+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_Trabalho+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Trabalho.c,50 :: 		Lcd_Out(3,3, t3);
	MOVLW       3
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       3
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_t3_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_t3_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Trabalho.c,52 :: 		if(seg==0){
	MOVLW       0
	XORWF       main_seg_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main55
	MOVLW       0
	XORWF       main_seg_L0+0, 0 
L__main55:
	BTFSS       STATUS+0, 2 
	GOTO        L_main2
;Trabalho.c,53 :: 		PORTA = 0b00111000;
	MOVLW       56
	MOVWF       PORTA+0 
;Trabalho.c,54 :: 		PORTD = number[seg];
	MOVF        main_seg_L0+0, 0 
	MOVWF       R0 
	MOVF        main_seg_L0+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       main_number_L0+0
	ADDWF       R0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(main_number_L0+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTD+0 
;Trabalho.c,55 :: 		}
	GOTO        L_main3
L_main2:
;Trabalho.c,58 :: 		while(control==1){
L_main4:
	MOVLW       0
	XORWF       main_control_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main56
	MOVLW       1
	XORWF       main_control_L0+0, 0 
L__main56:
	BTFSS       STATUS+0, 2 
	GOTO        L_main5
;Trabalho.c,59 :: 		PORTA = 0b00010000;
	MOVLW       16
	MOVWF       PORTA+0 
;Trabalho.c,60 :: 		PORTD = number[seg];
	MOVF        main_seg_L0+0, 0 
	MOVWF       R0 
	MOVF        main_seg_L0+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       main_number_L0+0
	ADDWF       R0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(main_number_L0+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTD+0 
;Trabalho.c,61 :: 		Delay_ms(1);
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       151
	MOVWF       R13, 0
L_main6:
	DECFSZ      R13, 1, 1
	BRA         L_main6
	DECFSZ      R12, 1, 1
	BRA         L_main6
	NOP
	NOP
;Trabalho.c,62 :: 		PORTA = 0b00100000;
	MOVLW       32
	MOVWF       PORTA+0 
;Trabalho.c,63 :: 		PORTD = 63;
	MOVLW       63
	MOVWF       PORTD+0 
;Trabalho.c,64 :: 		Delay_ms(1);
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       151
	MOVWF       R13, 0
L_main7:
	DECFSZ      R13, 1, 1
	BRA         L_main7
	DECFSZ      R12, 1, 1
	BRA         L_main7
	NOP
	NOP
;Trabalho.c,65 :: 		PORTA = 0b00001000;
	MOVLW       8
	MOVWF       PORTA+0 
;Trabalho.c,66 :: 		PORTD = number[min];
	MOVF        main_min_L0+0, 0 
	MOVWF       R0 
	MOVF        main_min_L0+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       main_number_L0+0
	ADDWF       R0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(main_number_L0+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTD+0 
;Trabalho.c,67 :: 		Delay_ms(1);
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       151
	MOVWF       R13, 0
L_main8:
	DECFSZ      R13, 1, 1
	BRA         L_main8
	DECFSZ      R12, 1, 1
	BRA         L_main8
	NOP
	NOP
;Trabalho.c,68 :: 		if(Button(&PORTB,3,1,0)){
	MOVLW       PORTB+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       3
	MOVWF       FARG_Button_pin+0 
	MOVLW       1
	MOVWF       FARG_Button_time_ms+0 
	CLRF        FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main9
;Trabalho.c,69 :: 		if(!(min==9&&seg==5)){
	MOVLW       0
	XORWF       main_min_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main57
	MOVLW       9
	XORWF       main_min_L0+0, 0 
L__main57:
	BTFSS       STATUS+0, 2 
	GOTO        L_main11
	MOVLW       0
	XORWF       main_seg_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main58
	MOVLW       5
	XORWF       main_seg_L0+0, 0 
L__main58:
	BTFSS       STATUS+0, 2 
	GOTO        L_main11
	MOVLW       1
	MOVWF       R0 
	GOTO        L_main10
L_main11:
	CLRF        R0 
L_main10:
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main12
;Trabalho.c,70 :: 		seg++;
	INFSNZ      main_seg_L0+0, 1 
	INCF        main_seg_L0+1, 1 
;Trabalho.c,71 :: 		if(seg==6){
	MOVLW       0
	XORWF       main_seg_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main59
	MOVLW       6
	XORWF       main_seg_L0+0, 0 
L__main59:
	BTFSS       STATUS+0, 2 
	GOTO        L_main13
;Trabalho.c,72 :: 		seg = 0;
	CLRF        main_seg_L0+0 
	CLRF        main_seg_L0+1 
;Trabalho.c,73 :: 		min++;
	INFSNZ      main_min_L0+0, 1 
	INCF        main_min_L0+1, 1 
;Trabalho.c,74 :: 		}
L_main13:
;Trabalho.c,75 :: 		}
L_main12:
;Trabalho.c,76 :: 		Delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main14:
	DECFSZ      R13, 1, 1
	BRA         L_main14
	DECFSZ      R12, 1, 1
	BRA         L_main14
	DECFSZ      R11, 1, 1
	BRA         L_main14
	NOP
;Trabalho.c,77 :: 		}
L_main9:
;Trabalho.c,78 :: 		if(Button(&PORTB,5,1,0)){
	MOVLW       PORTB+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       5
	MOVWF       FARG_Button_pin+0 
	MOVLW       1
	MOVWF       FARG_Button_time_ms+0 
	CLRF        FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main15
;Trabalho.c,79 :: 		control=0;
	CLRF        main_control_L0+0 
	CLRF        main_control_L0+1 
;Trabalho.c,80 :: 		}
L_main15:
;Trabalho.c,81 :: 		}
	GOTO        L_main4
L_main5:
;Trabalho.c,82 :: 		}
L_main3:
;Trabalho.c,84 :: 		if(Button(&PORTB,3,1,0)){
	MOVLW       PORTB+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       3
	MOVWF       FARG_Button_pin+0 
	MOVLW       1
	MOVWF       FARG_Button_time_ms+0 
	CLRF        FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main16
;Trabalho.c,85 :: 		seg++;
	INFSNZ      main_seg_L0+0, 1 
	INCF        main_seg_L0+1, 1 
;Trabalho.c,86 :: 		Delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main17:
	DECFSZ      R13, 1, 1
	BRA         L_main17
	DECFSZ      R12, 1, 1
	BRA         L_main17
	DECFSZ      R11, 1, 1
	BRA         L_main17
	NOP
;Trabalho.c,87 :: 		}
L_main16:
;Trabalho.c,89 :: 		if(Button(&PORTB,4,1,0)&&p==0){
	MOVLW       PORTB+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       4
	MOVWF       FARG_Button_pin+0 
	MOVLW       1
	MOVWF       FARG_Button_time_ms+0 
	CLRF        FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main20
	MOVLW       0
	XORWF       main_p_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main60
	MOVLW       0
	XORWF       main_p_L0+0, 0 
L__main60:
	BTFSS       STATUS+0, 2 
	GOTO        L_main20
L__main53:
;Trabalho.c,90 :: 		Delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main21:
	DECFSZ      R13, 1, 1
	BRA         L_main21
	DECFSZ      R12, 1, 1
	BRA         L_main21
	DECFSZ      R11, 1, 1
	BRA         L_main21
	NOP
;Trabalho.c,91 :: 		p=1;
	MOVLW       1
	MOVWF       main_p_L0+0 
	MOVLW       0
	MOVWF       main_p_L0+1 
;Trabalho.c,92 :: 		}
L_main20:
;Trabalho.c,93 :: 		if(Button(&PORTB,4,1,0)&&p==1){
	MOVLW       PORTB+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       4
	MOVWF       FARG_Button_pin+0 
	MOVLW       1
	MOVWF       FARG_Button_time_ms+0 
	CLRF        FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main24
	MOVLW       0
	XORWF       main_p_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main61
	MOVLW       1
	XORWF       main_p_L0+0, 0 
L__main61:
	BTFSS       STATUS+0, 2 
	GOTO        L_main24
L__main52:
;Trabalho.c,94 :: 		Delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main25:
	DECFSZ      R13, 1, 1
	BRA         L_main25
	DECFSZ      R12, 1, 1
	BRA         L_main25
	DECFSZ      R11, 1, 1
	BRA         L_main25
	NOP
;Trabalho.c,95 :: 		p=0;
	CLRF        main_p_L0+0 
	CLRF        main_p_L0+1 
;Trabalho.c,96 :: 		}
L_main24:
;Trabalho.c,98 :: 		if(Button(&PORTB,5,1,0)){
	MOVLW       PORTB+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       5
	MOVWF       FARG_Button_pin+0 
	MOVLW       1
	MOVWF       FARG_Button_time_ms+0 
	CLRF        FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main26
;Trabalho.c,99 :: 		if((!(seg==0)||!(min==0))&& p==0){
	MOVLW       0
	XORWF       main_seg_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main62
	MOVLW       0
	XORWF       main_seg_L0+0, 0 
L__main62:
	BTFSS       STATUS+0, 2 
	GOTO        L__main51
	MOVLW       0
	XORWF       main_min_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main63
	MOVLW       0
	XORWF       main_min_L0+0, 0 
L__main63:
	BTFSS       STATUS+0, 2 
	GOTO        L__main51
	GOTO        L_main31
L__main51:
	MOVLW       0
	XORWF       main_p_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main64
	MOVLW       0
	XORWF       main_p_L0+0, 0 
L__main64:
	BTFSS       STATUS+0, 2 
	GOTO        L_main31
L__main50:
;Trabalho.c,100 :: 		control=1;
	MOVLW       1
	MOVWF       main_control_L0+0 
	MOVLW       0
	MOVWF       main_control_L0+1 
;Trabalho.c,101 :: 		disp4=0;
	CLRF        main_disp4_L0+0 
	CLRF        main_disp4_L0+1 
;Trabalho.c,102 :: 		disp3=seg;
	MOVF        main_seg_L0+0, 0 
	MOVWF       main_disp3_L0+0 
	MOVF        main_seg_L0+1, 0 
	MOVWF       main_disp3_L0+1 
;Trabalho.c,103 :: 		disp2=min;
	MOVF        main_min_L0+0, 0 
	MOVWF       main_disp2_L0+0 
	MOVF        main_min_L0+1, 0 
	MOVWF       main_disp2_L0+1 
;Trabalho.c,104 :: 		aux = disp3*10;
	MOVF        main_seg_L0+0, 0 
	MOVWF       R0 
	MOVF        main_seg_L0+1, 0 
	MOVWF       R1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVF        R0, 0 
	MOVWF       main_aux_L0+0 
	MOVF        R1, 0 
	MOVWF       main_aux_L0+1 
;Trabalho.c,105 :: 		aux2 = min+1;
	MOVLW       1
	ADDWF       main_min_L0+0, 0 
	MOVWF       main_aux2_L0+0 
	MOVLW       0
	ADDWFC      main_min_L0+1, 0 
	MOVWF       main_aux2_L0+1 
;Trabalho.c,106 :: 		Pwm1_Set_Duty(poten*2.55);
	MOVF        main_poten_L0+0, 0 
	MOVWF       R0 
	MOVF        main_poten_L0+1, 0 
	MOVWF       R1 
	MOVF        main_poten_L0+2, 0 
	MOVWF       R2 
	MOVF        main_poten_L0+3, 0 
	MOVWF       R3 
	MOVLW       51
	MOVWF       R4 
	MOVLW       51
	MOVWF       R5 
	MOVLW       35
	MOVWF       R6 
	MOVLW       128
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	CALL        _double2byte+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Trabalho.c,107 :: 		PORTC = 0b00100000;
	MOVLW       32
	MOVWF       PORTC+0 
;Trabalho.c,108 :: 		while(!(aux2==0)){
L_main32:
	MOVLW       0
	XORWF       main_aux2_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main65
	MOVLW       0
	XORWF       main_aux2_L0+0, 0 
L__main65:
	BTFSC       STATUS+0, 2 
	GOTO        L_main33
;Trabalho.c,109 :: 		TRISB = 0;
	CLRF        TRISB+0 
;Trabalho.c,110 :: 		while(!(aux==0)){
L_main34:
	MOVLW       0
	XORWF       main_aux_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main66
	MOVLW       0
	XORWF       main_aux_L0+0, 0 
L__main66:
	BTFSC       STATUS+0, 2 
	GOTO        L_main35
;Trabalho.c,111 :: 		disp3--;
	MOVLW       1
	SUBWF       main_disp3_L0+0, 1 
	MOVLW       0
	SUBWFB      main_disp3_L0+1, 1 
;Trabalho.c,112 :: 		disp4=9;
	MOVLW       9
	MOVWF       main_disp4_L0+0 
	MOVLW       0
	MOVWF       main_disp4_L0+1 
;Trabalho.c,113 :: 		for(j=10;j>0;j--){
	MOVLW       10
	MOVWF       main_j_L0+0 
	MOVLW       0
	MOVWF       main_j_L0+1 
L_main36:
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       main_j_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main67
	MOVF        main_j_L0+0, 0 
	SUBLW       0
L__main67:
	BTFSC       STATUS+0, 0 
	GOTO        L_main37
;Trabalho.c,114 :: 		tmp = (ADC_Read(2)/2);
	MOVLW       2
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	RRCF        R5, 1 
	RRCF        R4, 1 
	BCF         R5, 7 
	MOVF        R4, 0 
	MOVWF       R0 
	MOVF        R5, 0 
	MOVWF       R1 
	CALL        _word2double+0, 0
	MOVF        R0, 0 
	MOVWF       main_tmp_L0+0 
	MOVF        R1, 0 
	MOVWF       main_tmp_L0+1 
	MOVF        R2, 0 
	MOVWF       main_tmp_L0+2 
	MOVF        R3, 0 
	MOVWF       main_tmp_L0+3 
;Trabalho.c,115 :: 		WordToStr(tmp, t1);
	CALL        _double2word+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       main_t1_L0+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(main_t1_L0+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;Trabalho.c,116 :: 		Lcd_Out(1,7,t1);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       7
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_t1_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_t1_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Trabalho.c,117 :: 		for(i=230;i>0;i--){
	MOVLW       230
	MOVWF       main_i_L0+0 
	MOVLW       0
	MOVWF       main_i_L0+1 
L_main39:
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       main_i_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main68
	MOVF        main_i_L0+0, 0 
	SUBLW       0
L__main68:
	BTFSC       STATUS+0, 0 
	GOTO        L_main40
;Trabalho.c,118 :: 		PORTA = 0b00100000;
	MOVLW       32
	MOVWF       PORTA+0 
;Trabalho.c,119 :: 		PORTD = number[disp4];
	MOVF        main_disp4_L0+0, 0 
	MOVWF       R0 
	MOVF        main_disp4_L0+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       main_number_L0+0
	ADDWF       R0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(main_number_L0+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTD+0 
;Trabalho.c,120 :: 		Delay_ms(1);
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       151
	MOVWF       R13, 0
L_main42:
	DECFSZ      R13, 1, 1
	BRA         L_main42
	DECFSZ      R12, 1, 1
	BRA         L_main42
	NOP
	NOP
;Trabalho.c,121 :: 		PORTA = 0b00010000;
	MOVLW       16
	MOVWF       PORTA+0 
;Trabalho.c,122 :: 		PORTD = number[disp3];
	MOVF        main_disp3_L0+0, 0 
	MOVWF       R0 
	MOVF        main_disp3_L0+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       main_number_L0+0
	ADDWF       R0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(main_number_L0+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTD+0 
;Trabalho.c,123 :: 		Delay_ms(1);
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       151
	MOVWF       R13, 0
L_main43:
	DECFSZ      R13, 1, 1
	BRA         L_main43
	DECFSZ      R12, 1, 1
	BRA         L_main43
	NOP
	NOP
;Trabalho.c,124 :: 		PORTA = 0b00001000;
	MOVLW       8
	MOVWF       PORTA+0 
;Trabalho.c,125 :: 		PORTD = number[disp2];
	MOVF        main_disp2_L0+0, 0 
	MOVWF       R0 
	MOVF        main_disp2_L0+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       main_number_L0+0
	ADDWF       R0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(main_number_L0+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTD+0 
;Trabalho.c,126 :: 		Delay_ms(1);
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       151
	MOVWF       R13, 0
L_main44:
	DECFSZ      R13, 1, 1
	BRA         L_main44
	DECFSZ      R12, 1, 1
	BRA         L_main44
	NOP
	NOP
;Trabalho.c,117 :: 		for(i=230;i>0;i--){
	MOVLW       1
	SUBWF       main_i_L0+0, 1 
	MOVLW       0
	SUBWFB      main_i_L0+1, 1 
;Trabalho.c,127 :: 		}
	GOTO        L_main39
L_main40:
;Trabalho.c,128 :: 		disp4--;
	MOVLW       1
	SUBWF       main_disp4_L0+0, 1 
	MOVLW       0
	SUBWFB      main_disp4_L0+1, 1 
;Trabalho.c,129 :: 		aux--;
	MOVLW       1
	SUBWF       main_aux_L0+0, 1 
	MOVLW       0
	SUBWFB      main_aux_L0+1, 1 
;Trabalho.c,113 :: 		for(j=10;j>0;j--){
	MOVLW       1
	SUBWF       main_j_L0+0, 1 
	MOVLW       0
	SUBWFB      main_j_L0+1, 1 
;Trabalho.c,130 :: 		}
	GOTO        L_main36
L_main37:
;Trabalho.c,131 :: 		}
	GOTO        L_main34
L_main35:
;Trabalho.c,132 :: 		if(!(aux2==0)){
	MOVLW       0
	XORWF       main_aux2_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main69
	MOVLW       0
	XORWF       main_aux2_L0+0, 0 
L__main69:
	BTFSC       STATUS+0, 2 
	GOTO        L_main45
;Trabalho.c,133 :: 		disp3 = 6;
	MOVLW       6
	MOVWF       main_disp3_L0+0 
	MOVLW       0
	MOVWF       main_disp3_L0+1 
;Trabalho.c,134 :: 		aux = disp3*10;
	MOVLW       60
	MOVWF       main_aux_L0+0 
	MOVLW       0
	MOVWF       main_aux_L0+1 
;Trabalho.c,135 :: 		disp2--;
	MOVLW       1
	SUBWF       main_disp2_L0+0, 1 
	MOVLW       0
	SUBWFB      main_disp2_L0+1, 1 
;Trabalho.c,136 :: 		aux2--;
	MOVLW       1
	SUBWF       main_aux2_L0+0, 1 
	MOVLW       0
	SUBWFB      main_aux2_L0+1, 1 
;Trabalho.c,137 :: 		Delay_ms(1);
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       151
	MOVWF       R13, 0
L_main46:
	DECFSZ      R13, 1, 1
	BRA         L_main46
	DECFSZ      R12, 1, 1
	BRA         L_main46
	NOP
	NOP
;Trabalho.c,138 :: 		}
L_main45:
;Trabalho.c,139 :: 		}
	GOTO        L_main32
L_main33:
;Trabalho.c,140 :: 		Pwm1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Trabalho.c,141 :: 		Pwm1_Stop();  //Desliga o cooler
	CALL        _PWM1_Stop+0, 0
;Trabalho.c,142 :: 		end = 1;
	MOVLW       1
	MOVWF       main_end_L0+0 
	MOVLW       0
	MOVWF       main_end_L0+1 
;Trabalho.c,143 :: 		PORTC = 0;  //Desliga o heater
	CLRF        PORTC+0 
;Trabalho.c,144 :: 		intcon.tmr0if = 0;
	BCF         INTCON+0, 2 
;Trabalho.c,145 :: 		}
L_main31:
;Trabalho.c,146 :: 		seg=0,control=1,min=0;
	CLRF        main_seg_L0+0 
	CLRF        main_seg_L0+1 
	MOVLW       1
	MOVWF       main_control_L0+0 
	MOVLW       0
	MOVWF       main_control_L0+1 
	CLRF        main_min_L0+0 
	CLRF        main_min_L0+1 
;Trabalho.c,154 :: 		}
L_main26:
;Trabalho.c,156 :: 		if(intcon.tmr0if == 1){
	BTFSS       INTCON+0, 2 
	GOTO        L_main47
;Trabalho.c,157 :: 		intcon.tmr0if = 0;
	BCF         INTCON+0, 2 
;Trabalho.c,158 :: 		if(end==1){
	MOVLW       0
	XORWF       main_end_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main70
	MOVLW       1
	XORWF       main_end_L0+0, 0 
L__main70:
	BTFSS       STATUS+0, 2 
	GOTO        L_main48
;Trabalho.c,159 :: 		end=0;
	CLRF        main_end_L0+0 
	CLRF        main_end_L0+1 
;Trabalho.c,160 :: 		PORTC.F1 = 1;
	BSF         PORTC+0, 1 
;Trabalho.c,161 :: 		}
	GOTO        L_main49
L_main48:
;Trabalho.c,163 :: 		PORTC.F1 = 0;
	BCF         PORTC+0, 1 
;Trabalho.c,164 :: 		}
L_main49:
;Trabalho.c,165 :: 		}
L_main47:
;Trabalho.c,166 :: 		}
	GOTO        L_main0
;Trabalho.c,167 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
