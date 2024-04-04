import 'package:flutter/material.dart';

class Player extends StatefulWidget {
  const Player({
    super.key,
    required this.player,
    required this.startingLife,
  });

  final int player;
  final int startingLife;

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  int life = 0;
  String name = "Player";

  final TextEditingController _textFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      life = widget.startingLife;
      name = "Player ${widget.player + 1}";
    });
  }

  @override
  Widget build(BuildContext context) {
    const buttonStyle = TextStyle(fontSize: 96.0, fontWeight: FontWeight.w100);
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              Center(
                child: Text(life.toString(),
                    style: const TextStyle(
                        fontSize: 120.0, fontWeight: FontWeight.w300)),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: TextButton(
                      child: const Text("-", style: buttonStyle),
                      onPressed: () {
                        setState(() {
                          life -= 1;
                        });
                      },
                      onLongPress: () {
                        setState(() {
                          life -= 10;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      child: const Text("+", style: buttonStyle),
                      onPressed: () {
                        setState(() {
                          life += 1;
                        });
                      },
                      onLongPress: () {
                        setState(() {
                          life += 10;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        ElevatedButton(
          child: Text(name),
          onPressed: () async {
            final newName = await showDialog<String?>(
              context: context,
              builder: (context) {
                _textFieldController.text = name;
                return AlertDialog(
                  title: const Text('Change Player Name'),
                  content: TextField(
                    controller: _textFieldController,
                    decoration: const InputDecoration(hintText: "Player Name"),
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('Cancel'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    ElevatedButton(
                      child: const Text('Change'),
                      onPressed: () {
                        Navigator.pop(context, _textFieldController.text);
                      },
                    ),
                  ],
                );
              },
            );

            if (newName != null && newName.isNotEmpty) {
              setState(() {
                name = newName;
              });
            }
          },
        ),
      ],
    );
  }
}
