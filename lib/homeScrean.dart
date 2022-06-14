// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:game/game_loogic.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String actvPlyr = 'X';
  bool gmOver = false;
  int turns = 0;
  String rslt = '';
  bool sSwtch = false;
  Game game = Game();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: MediaQuery.of(context).orientation == Orientation.portrait
            ? Column(
                children: [
                  ...topBlock(),
                  buildExpanded(context),
                  ...bottomBlock(),
                  const SizedBox(height: 15),
                ],
              )
            : Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...topBlock(),
                        const SizedBox(height: 15),
                        ...bottomBlock(),
                      ],
                    ),
                  ),
                  buildExpanded(context),
                ],
              ),
      ),
    );
  }

  List<Widget> topBlock() {
    return [
      SwitchListTile.adaptive(
        activeColor: Theme.of(context).splashColor,
        title: const Text(
          'Turn on/off two player',
          style: TextStyle(color: Colors.white, fontSize: 28),
          textAlign: TextAlign.center,
        ),
        value: sSwtch,
        onChanged: (bool nval) {
          setState(() {
            sSwtch = nval;
          });
        },
      ),
      Text(
        'It\'s $actvPlyr Turn'.toUpperCase(),
        style: const TextStyle(color: Colors.white, fontSize: 50),
        textAlign: TextAlign.center,
      ),
    ];
  }

  Expanded buildExpanded(BuildContext context) {
    return Expanded(
      child: GridView.count(
        padding: const EdgeInsets.all(15),
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: 1.0,
        crossAxisCount: 3,
        children: List.generate(
          9,
          (idx) => InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: gmOver ? null : () => _onTap(idx),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).shadowColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  Plyr.plyrX.contains(idx)
                      ? 'X'
                      : Plyr.plyrO.contains(idx)
                          ? 'O'
                          : '',
                  style: TextStyle(
                      color: Plyr.plyrX.contains(idx)
                          ? Colors.black
                          : Colors.white,
                      fontSize: 50),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> bottomBlock() {
    return [
      Text(
        rslt,
        style: const TextStyle(color: Colors.white, fontSize: 40),
        textAlign: TextAlign.center,
      ),
      ElevatedButton.icon(
        onPressed: () {
          setState(() {
            Plyr.plyrX = [];
            Plyr.plyrO = [];
            actvPlyr = 'X';
            gmOver = false;
            turns = 0;
            rslt = '';
          });
        },
        icon: const Icon(Icons.replay),
        label: const Text('Repeat The Game'),
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(Theme.of(context).splashColor)),
      ),
    ];
  }

  _onTap(int idx) async {
    if ((Plyr.plyrX.isEmpty || !Plyr.plyrX.contains(idx)) &&
        (Plyr.plyrO.isEmpty || !Plyr.plyrO.contains(idx))) {
      game.plyGame(idx, actvPlyr);
      updatState();
      if (!sSwtch && !gmOver && turns != 9) {
        await game.autoPly(actvPlyr);
        updatState();
      }
    }
  }

  void updatState() {
    return setState(() {
      actvPlyr = (actvPlyr == 'X') ? 'O' : 'X';
      turns++;
      String winrPlyr = game.checkWinner();
      if (winrPlyr != '') {
        gmOver = true;
        rslt = '$winrPlyr is the winner';
      } else if (!gmOver && turns == 9) rslt = 'It\'s Draw';
    });
  }
}
