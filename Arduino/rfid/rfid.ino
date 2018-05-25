#include <SPI.h>
#include <MFRC522.h>
 
#define RST_PIN   9
#define SS_PIN    10

String UID;

//initialisation des pins du capteur
MFRC522 mfrc522(SS_PIN, RST_PIN);

void setup() {
  //initialisation du module
  Serial.begin(9600);
  SPI.begin();
  mfrc522.PCD_Init();
}
 
void loop() {
  //si une carte est présente et qu'on la lit
  if (mfrc522.PICC_IsNewCardPresent() && mfrc522.PICC_ReadCardSerial() ) {
    Serial.print("UID: ");

    //pour chaque caractère du TAG
    for (byte i = 0; i < mfrc522.uid.size; i++) {
      //ajoute le caractère convertie en hexadécimal
      UID += String(mfrc522.uid.uidByte[i], HEX);
    } 
    Serial.println(UID); 
    UID = "";
 
    delay(1000);
  }
}
