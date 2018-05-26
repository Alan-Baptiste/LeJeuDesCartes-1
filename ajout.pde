void ajout() {
  if (turn%2 == 1 && deckJ1.size() < maxCard) {
    Card temp = new Card(positionDraw[0][0], positionDraw[0][1]);
    deckJ1.add(deckJ1.size(), temp);
  } else if (turn%2 == 0 && deckJ2.size() < maxCard) {
    Card temp = new Card(positionDraw[1][0], positionDraw[1][1]);
    deckJ2.add(deckJ2.size(), temp);
  }
  replaceCard();
}
