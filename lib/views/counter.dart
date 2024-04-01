import 'package:flutter/material.dart';

import '../components/player.dart';

class Counter extends StatelessWidget {
  const Counter({
    super.key,
    required this.players,
    required this.startingLife,
  });

  final int players;
  final int startingLife;

  @override
  Widget build(BuildContext context) {
    Widget layout;

    switch (players) {
      case 1:
        layout = Player(
          player: 0,
          startingLife: startingLife,
        );
        break;
      case 2:
        layout = Column(
          children: [
            Expanded(
              child: RotatedBox(
                quarterTurns: 2,
                child: Player(
                  player: 0,
                  startingLife: startingLife,
                ),
              ),
            ),
            Expanded(
              child: Player(
                player: 1,
                startingLife: startingLife,
              ),
            ),
          ],
        );
        break;
      case 3:
        layout = Column(
          children: [
            Expanded(
              child: RotatedBox(
                quarterTurns: 2,
                child: Player(
                  player: 0,
                  startingLife: startingLife,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: Player(
                        player: 1,
                        startingLife: startingLife,
                      ),
                    ),
                  ),
                  Expanded(
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Player(
                        player: 2,
                        startingLife: startingLife,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
        break;
      case 4:
        layout = Row(
          children: [
            Expanded(
              child: RotatedBox(
                quarterTurns: 1,
                child: Row(
                  children: [
                    Expanded(
                      child: Player(
                        player: 0,
                        startingLife: startingLife,
                      ),
                    ),
                    Expanded(
                      child: Player(
                        player: 1,
                        startingLife: startingLife,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: RotatedBox(
                quarterTurns: 3,
                child: Row(
                  children: [
                    Expanded(
                      child: Player(
                        player: 2,
                        startingLife: startingLife,
                      ),
                    ),
                    Expanded(
                      child: Player(
                        player: 3,
                        startingLife: startingLife,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
        break;
      case 5:
        layout = Column(
          children: [
            Expanded(
              child: RotatedBox(
                quarterTurns: 2,
                child: Player(
                  player: 0,
                  startingLife: startingLife,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Row(
                children: [
                  Expanded(
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: Row(
                        children: [
                          Expanded(
                            child: Player(
                              player: 1,
                              startingLife: startingLife,
                            ),
                          ),
                          Expanded(
                            child: Player(
                              player: 2,
                              startingLife: startingLife,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Row(
                        children: [
                          Expanded(
                            child: Player(
                              player: 3,
                              startingLife: startingLife,
                            ),
                          ),
                          Expanded(
                            child: Player(
                              player: 4,
                              startingLife: startingLife,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
        break;
      case 6:
        layout = Row(
          children: [
            Expanded(
              child: RotatedBox(
                quarterTurns: 1,
                child: Row(
                  children: [
                    Expanded(
                      child: Player(
                        player: 0,
                        startingLife: startingLife,
                      ),
                    ),
                    Expanded(
                      child: Player(
                        player: 1,
                        startingLife: startingLife,
                      ),
                    ),
                    Expanded(
                      child: Player(
                        player: 2,
                        startingLife: startingLife,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: RotatedBox(
                quarterTurns: 3,
                child: Row(
                  children: [
                    Expanded(
                      child: Player(
                        player: 3,
                        startingLife: startingLife,
                      ),
                    ),
                    Expanded(
                      child: Player(
                        player: 4,
                        startingLife: startingLife,
                      ),
                    ),
                    Expanded(
                      child: Player(
                        player: 5,
                        startingLife: startingLife,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
        break;
      default:
        layout = Center(
          child: Text("Invalid number of players"),
        );
        break;
    }

    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                if (constraints.maxWidth >= constraints.maxHeight) {
                  return RotatedBox(
                    quarterTurns: 1,
                    child: layout,
                  );
                } else {
                  return layout;
                }
              },
            ),
          ),
          Center(
            child: BackButton(),
          )
        ],
      ),
    );
  }
}
