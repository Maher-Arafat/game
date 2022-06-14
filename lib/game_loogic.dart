import 'dart:math';

class Plyr {
  static List<int> plyrX = [];
  static List<int> plyrO = [];
}

extension ContainsAll on List {
  bool containsAll(int x, int y, [z]) {
    if (z == null)
      return (contains(x) && contains(y));
    else
      return (contains(x) && contains(y) && contains(z));
  }
}

class Game {
  void plyGame(int idx, String actvPlyr) {
    if (actvPlyr == 'X')
      Plyr.plyrX.add(idx); 
    else
      Plyr.plyrO.add(idx);
  }

  String checkWinner() {
    String winr = '';
    if (Plyr.plyrX.containsAll(0, 1, 2) ||
        Plyr.plyrX.containsAll(3, 4, 5) ||
        Plyr.plyrX.containsAll(6, 7, 8) ||
        Plyr.plyrX.containsAll(0, 3, 6) ||
        Plyr.plyrX.containsAll(1, 4, 7) ||
        Plyr.plyrX.containsAll(2, 5, 8) ||
        Plyr.plyrX.containsAll(0, 1, 2) ||
        Plyr.plyrX.containsAll(0, 4, 8) ||
        Plyr.plyrX.containsAll(2, 4, 6))
      winr = 'X';
    else if (Plyr.plyrO.containsAll(0, 1, 2) ||
        Plyr.plyrO.containsAll(3, 4, 5) ||
        Plyr.plyrO.containsAll(6, 7, 8) ||
        Plyr.plyrO.containsAll(0, 3, 6) ||
        Plyr.plyrO.containsAll(1, 4, 7) ||
        Plyr.plyrO.containsAll(2, 5, 8) ||
        Plyr.plyrO.containsAll(0, 4, 8) ||
        Plyr.plyrO.containsAll(2, 4, 6))
      winr = 'O';
    else
      winr = '';
    return winr;
  }

  Future<void> autoPly(actvPlyr) async {
    int idx = 0;
    List<int> emptyCell = [];
    for (int i = 0; i < 9; i++) {
      if (!(Plyr.plyrX.contains(i) || Plyr.plyrO.contains(i))) emptyCell.add(i);
    }
    if (Plyr.plyrX.containsAll(0, 1) && emptyCell.contains(2))
      idx = 2;
    else if (Plyr.plyrX.containsAll(3, 4) && emptyCell.contains(5))
      idx = 5;
    else if (Plyr.plyrX.containsAll(6, 7) && emptyCell.contains(8))
      idx = 8;
    else if (Plyr.plyrX.containsAll(0, 3) && emptyCell.contains(6))
      idx = 6;
    else if (Plyr.plyrX.containsAll(1, 4) && emptyCell.contains(7))
      idx = 7;
    else if (Plyr.plyrX.containsAll(2, 5) && emptyCell.contains(8))
      idx = 8;
    else if (Plyr.plyrX.containsAll(0, 4) && emptyCell.contains(8))
      idx = 8;
    else if (Plyr.plyrX.containsAll(2, 4) && emptyCell.contains(6))
      idx = 6;
//====================
    else if (Plyr.plyrX.containsAll(0, 2) && emptyCell.contains(1))
      idx = 1;
    else if (Plyr.plyrX.containsAll(3, 5) && emptyCell.contains(4))
      idx = 4;
    else if (Plyr.plyrX.containsAll(6, 8) && emptyCell.contains(7))
      idx = 7;
    else if (Plyr.plyrX.containsAll(0, 6) && emptyCell.contains(3))
      idx = 3;
    else if (Plyr.plyrX.containsAll(1, 7) && emptyCell.contains(4))
      idx = 4;
    else if (Plyr.plyrX.containsAll(2, 8) && emptyCell.contains(5))
      idx = 5;
    else if (Plyr.plyrX.containsAll(0, 8) && emptyCell.contains(4))
      idx = 4;
    else if (Plyr.plyrX.containsAll(2, 6) && emptyCell.contains(4))
      idx = 4;
//====================
    else if (Plyr.plyrX.containsAll(1, 2) && emptyCell.contains(0))
      idx = 0;
    else if (Plyr.plyrX.containsAll(4, 5) && emptyCell.contains(3))
      idx = 3;
    else if (Plyr.plyrX.containsAll(7, 8) && emptyCell.contains(6))
      idx = 6;
    else if (Plyr.plyrX.containsAll(3, 6) && emptyCell.contains(0))
      idx = 0;
    else if (Plyr.plyrX.containsAll(4, 7) && emptyCell.contains(1))
      idx = 1;
    else if (Plyr.plyrX.containsAll(5, 8) && emptyCell.contains(2))
      idx = 2;
    else if (Plyr.plyrX.containsAll(4, 8) && emptyCell.contains(0))
      idx = 0;
    else if (Plyr.plyrX.containsAll(4, 6) && emptyCell.contains(2))
      idx = 2;
    else {
      Random rndm = Random();
      int rndmIdx = rndm.nextInt(emptyCell.length);
      idx = emptyCell[rndmIdx];
    }
    plyGame(idx, actvPlyr);
  }
}
