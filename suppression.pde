void suppression() {
  if (turn%2 == 1 && deckJ1.size() > 0) {
    deckJ1.remove(deckJ1.size()-1);
  } else if (turn%2 == 0 && deckJ2.size() > 0) {
    deckJ2.remove(deckJ2.size()-1);
  }
  replaceCard();
}
