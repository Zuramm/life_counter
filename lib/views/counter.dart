import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wakelock/wakelock.dart';

import '../components/player.dart';

class Counter extends StatefulWidget {
  const Counter({
    super.key,
    required this.players,
    required this.startingLife,
  });

  final int players;
  final int startingLife;

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  void initState() {
    super.initState();
    Wakelock.enable();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  }

  @override
  void dispose() {
    super.dispose();
    Wakelock.disable();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    Widget layout;

    switch (widget.players) {
      case 1:
        layout = Player(
          player: 0,
          startingLife: widget.startingLife,
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
                  startingLife: widget.startingLife,
                ),
              ),
            ),
            Expanded(
              child: Player(
                player: 1,
                startingLife: widget.startingLife,
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
                  startingLife: widget.startingLife,
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
                        startingLife: widget.startingLife,
                      ),
                    ),
                  ),
                  Expanded(
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Player(
                        player: 2,
                        startingLife: widget.startingLife,
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
                        startingLife: widget.startingLife,
                      ),
                    ),
                    Expanded(
                      child: Player(
                        player: 1,
                        startingLife: widget.startingLife,
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
                        startingLife: widget.startingLife,
                      ),
                    ),
                    Expanded(
                      child: Player(
                        player: 3,
                        startingLife: widget.startingLife,
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
                  startingLife: widget.startingLife,
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
                              startingLife: widget.startingLife,
                            ),
                          ),
                          Expanded(
                            child: Player(
                              player: 2,
                              startingLife: widget.startingLife,
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
                              startingLife: widget.startingLife,
                            ),
                          ),
                          Expanded(
                            child: Player(
                              player: 4,
                              startingLife: widget.startingLife,
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
                        startingLife: widget.startingLife,
                      ),
                    ),
                    Expanded(
                      child: Player(
                        player: 1,
                        startingLife: widget.startingLife,
                      ),
                    ),
                    Expanded(
                      child: Player(
                        player: 2,
                        startingLife: widget.startingLife,
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
                        startingLife: widget.startingLife,
                      ),
                    ),
                    Expanded(
                      child: Player(
                        player: 4,
                        startingLife: widget.startingLife,
                      ),
                    ),
                    Expanded(
                      child: Player(
                        player: 5,
                        startingLife: widget.startingLife,
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
        layout = const Center(
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
          const Center(
            child: BackButton(),
          )
        ],
      ),
    );
  }
}
