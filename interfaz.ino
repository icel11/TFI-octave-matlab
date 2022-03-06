#include <Servo.h>  //Usamos la Libreria Servo para el control del ESC
Servo esc; //Creamos una clase Servo con nombre esc

int out = 0;
byte in = 0;
byte pinOut = 10;

void setup() {
  // inicializar puerto serie
  Serial.begin(9600);
  
  esc.attach(10); //Especificamos el Pin de Arduino al cual se conectara la señal esc, D8
  esc.writeMicroseconds(1000); //Inicializamos la señal a 1000
  //pinMode(pinOut, OUTPUT);// preparar output

  

}

void loop() {
  int val;

  // leer del pin A0 como
  out = analogRead(A0);

  // escalar para obtener formato uint8
  out = map(out, 0, 1023, 0, 255);

  // enviar en base 10 en ASCII
  Serial.write(out);

  // leer del serie si hay datos
  if (Serial.available()) {
    in = Serial.read();
    
    val = map(in, 0, 255, 1000, 2000);
    esc.writeMicroseconds(val); //Usamos val como la señal para esc
    //analogWrite(pinOut, in);// escribir en el pin 10
  }

  
    
  // esperar para estabilizar el conversor
  delay(10);
}
