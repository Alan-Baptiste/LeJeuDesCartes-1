void keyPressed() {
  if (keyCode == '1') {
    ajout();
  } else if (keyCode == '2') {
    suppression();
  } else if (keyCode == ENTER) {
    turn++;
    resetAttack();
    attack = -1;
    defense = -1;
    priseCompo = -1;
    manaJ1 = manaJ2 = 3;
    timer();
  }else if( keyCode == 97 ){
    if (turn%2 == 1 && manaJ1 >=1 ) manaJ1 -= 1;
    else if (turn%2 == 0 && manaJ2 >=1) manaJ2 -=1;
  }else if( keyCode == 98 ){
    if (turn%2 == 1 && manaJ1 >=2 ) manaJ1 -= 2;
    else if (turn%2 == 0 && manaJ2 >=2) manaJ2 -=2;
  }
  else if( keyCode == 99 ){
    if (turn%2 == 1 && manaJ1 >=3 ) manaJ1 -= 3;
    else if (turn%2 == 0 && manaJ2 >=3) manaJ2 -=3;
  }
}
