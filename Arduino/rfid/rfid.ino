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

    //pour chaque caractère du TAG
    for (byte i = 0; i < mfrc522.uid.size; i++) {
      //ajoute le caractère convertie en hexadécimal
      UID += String(mfrc522.uid.uidByte[i], HEX);
    } 
    if (UID == "b0131da4") {
      Serial.println('1'); 
    } else if (UID == "103c7da6") {
      Serial.println('0');
    }

    UID = "";

    

    
    
    UID = "";
 
    delay(1000);
  }
}
