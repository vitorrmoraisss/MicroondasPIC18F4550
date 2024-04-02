// Lcd pinout settings
sbit LCD_RS at RE2_bit;
sbit LCD_EN at RE1_bit;
sbit LCD_D7 at RD7_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D4 at RD4_bit;

// Pin direction
sbit LCD_RS_Direction at TRISE2_bit;
sbit LCD_EN_Direction at TRISE1_bit;
sbit LCD_D7_Direction at TRISD7_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD4_bit;

void main() {
int end=0,control=1,seg=0,min=0,p=0,aux,aux2,i,j,disp2,disp3,disp4,number[10] = {63,6,91,79,102,109,125,7,127,111};
float tmp, poten;
char t1[6],t2[6],t3[6];
TRISA = 0b00000101;
TRISD = 0;
TRISC = 0;
//Configura o lcd
Lcd_Init();
Lcd_Cmd(_LCD_CURSOR_OFF);

ADCON1 = 0b00001100;
Pwm1_init(5000);
//Configura o timer
tmr0l = 0xf7;
tmr0h = 0xc2;
t0con = 0b10000100;
intcon.tmr0if = 0;
PORTD = 0;

while(1){
  TRISB = 0b00111100;
  tmp = ADC_Read(2)/2;
  poten = (ADC_Read(0)/10.23); //100-(ADC_Read(0)/10.23);
  WordToStr(tmp, t1);
  WordToStr(p, t2);
  WordToStr(poten, t3);
  Pwm1_Start();   //Liga o cooler
  Lcd_Out(1,1,"Temp: ");
  Lcd_Out(1,7,t1);
  Lcd_Out(2,1, "Porta: ");
  Lcd_Out(2,7, t2);
  Lcd_Out(3,-(3), "Poten: ");
  Lcd_Out(3,3, t3);

  if(seg==0){
    PORTA = 0b00111000;
    PORTD = number[seg];
  }
  else{
  //Mostra no display o tempo antes de iniciar
    while(control==1){
      PORTA = 0b00010000;
      PORTD = number[seg];
      Delay_ms(1);
      PORTA = 0b00100000;
      PORTD = 63;
      Delay_ms(1);
      PORTA = 0b00001000;
      PORTD = number[min];
      Delay_ms(1);
      if(Button(&PORTB,3,1,0)){
        if(!(min==9&&seg==5)){
          seg++;
          if(seg==6){
            seg = 0;
            min++;
          }
        }
        Delay_ms(100);
      }
      if(Button(&PORTB,5,1,0)){
        control=0;
      }
  }
  }
  //Botão para adcionar tempo
  if(Button(&PORTB,3,1,0)){
    seg++;
    Delay_ms(100);
  }
  //Botão para abrit/fechar a porta
  if(Button(&PORTB,4,1,0)&&p==0){
    Delay_ms(100);
    p=1;
  }
  if(Button(&PORTB,4,1,0)&&p==1){
    Delay_ms(100);
    p=0;
  }
  //Botão para iniciar, tem que ter informado o tempo antes e a porta está fechada.
  if(Button(&PORTB,5,1,0)){
    if((!(seg==0)||!(min==0))&& p==0){
      control=1;
      disp4=0;
      disp3=seg;
      disp2=min;
      aux = disp3*10;
      aux2 = min+1;
      Pwm1_Set_Duty(poten*2.55);
      PORTC = 0b00100000;
      while(!(aux2==0)){
        TRISB = 0;
        while(!(aux==0)){
          disp3--;
          disp4=9;
          for(j=10;j>0;j--){
            tmp = (ADC_Read(2)/2);
            WordToStr(tmp, t1);
            Lcd_Out(1,7,t1);
            for(i=230;i>0;i--){
              PORTA = 0b00100000;
              PORTD = number[disp4];
              Delay_ms(1);
              PORTA = 0b00010000;
              PORTD = number[disp3];
              Delay_ms(1);
              PORTA = 0b00001000;
              PORTD = number[disp2];
              Delay_ms(1);
            }
            disp4--;
            aux--;
          }
        }
        if(!(aux2==0)){
          disp3 = 6;
          aux = disp3*10;
          disp2--;
          aux2--;
          Delay_ms(1);
        }
      }
    Pwm1_Set_Duty(0);
    Pwm1_Stop();  //Desliga o cooler
    end = 1;
    PORTC = 0;  //Desliga o heater
    intcon.tmr0if = 0;
    }
    seg=0,control=1,min=0;
    /*else{
      TRISB = 255;
      PORTB = 255;
      Delay_ms(1000);
      PORTB = 0;
      TRISB = 0;
    }*/
  }
  //Liga o buzzer quando termina o tempo por 1s
  if(intcon.tmr0if == 1){
    intcon.tmr0if = 0;
    if(end==1){
      end=0;
      PORTC.F1 = 1;
    }
    else{
      PORTC.F1 = 0;
    }
  }
}
}