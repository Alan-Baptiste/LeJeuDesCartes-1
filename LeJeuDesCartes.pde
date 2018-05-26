
//LeJeuDesCartes 
//v3.0 Omega
//By Alan & Baptiste



void setup() {
  String portName = Serial.list()[1]; // mettre 0 quand joue sans arduino
  myPort = new Serial(this, portName, 9600);

  size(1280, 720);
  frameRate(60);
  textSize(25);

  for (int i = 0; i < 5; i++) {
    Composant temp = new Composant(i);
    compo.add(compo.size(), temp);
  }
}


void draw() {
  display();



  if (defense != -1 && priseCompo != -1) {
    defense = -1;
    priseCompo = -1;
    println("Tu ne peux pas faire deux choses en même temps");
  }

  for (int i = 0; i < deckJ1.size(); i++) {
    if (deckJ1.get(i).def < 1) {
      if (deckJ1.get(i).capture != -1) {
        compo.get(deckJ1.get(i).capture).capture = -1;
        compo.get(deckJ1.get(i).capture).campCapture = null;
        compo.get(deckJ1.get(i).capture).time = 0;
      }
      deckJ1.remove(i);
      replaceCard();
      break;
    }
    deckJ1.get(i).update();
    deckJ1.get(i).link();
    deckJ1.get(i).display(i, 1);
    //deckJ1.get(i).debug();
  }
  for (int i = 0; i < deckJ2.size(); i++) {
    if (deckJ2.get(i).def < 1) {
      if (deckJ2.get(i).capture != -1) {
        compo.get(deckJ2.get(i).capture).capture = -1;
        compo.get(deckJ2.get(i).capture).campCapture = null;
        compo.get(deckJ2.get(i).capture).time = 0;
      }
      deckJ2.remove(i);
      replaceCard();
      break;
    }
    deckJ2.get(i).update();
    deckJ2.get(i).link();
    deckJ2.get(i).display(i, 0);
    //deckJ2.get(i).debug();
  }


  if (attack != -1 && defense != -1) {
    attackConfirmed();
  }

  if (attack != -1 && priseCompo != -1) {
    compoConfirmed();
  }

  for (int i = 0; i < compo.size(); i++) {
    compo.get(i).display(i);
  }

  if ( myPort.available() > 0) {  
    val = myPort.readStringUntil('\n');
  } 
  
  if (val != null && val.charAt(0) == '1') {
    ajout();
  } else if (val != null && val.charAt(0) == '0') {
    suppression();
  }
  
  val = "non";

  /*println(scoreJ1);
   println(scoreJ2);
   println();*/
}
