int pinoSensor = 7;

void setup() {
  pinMode(pinoSensor, INPUT);
  Serial.begin(9600);
}

void loop() {
  if(digitalRead(pinoSensor) == LOW){
  Serial.println("Detectado");
  }
  else {
  Serial.println("Ausente");
  }
  delay(1000);
}