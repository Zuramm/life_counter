import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'counter.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int players = 2;
  int startingLife = 20;

  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Life Counter",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 16.0),
              Text(
                "Number of Players",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SegmentedButton<int>(
                multiSelectionEnabled: false,
                emptySelectionAllowed: false,
                showSelectedIcon: false,
                selected: {players},
                onSelectionChanged: (Set<int> newSelection) {
                  setState(() {
                    players = newSelection.first;
                  });
                },
                segments: [1, 2, 3, 4, 5, 6]
                    .map<ButtonSegment<int>>(
                      (int value) => ButtonSegment<int>(
                          value: value, label: Text(value.toString())),
                    )
                    .toList(),
              ),
              const SizedBox(height: 8.0),
              Text(
                "Starting Life",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SegmentedButton<int>(
                multiSelectionEnabled: false,
                emptySelectionAllowed: false,
                showSelectedIcon: false,
                selected: {startingLife},
                onSelectionChanged: (Set<int> newSelection) async {
                  int? newStartingLife;

                  if (newSelection.first == 0) {
                    newStartingLife = await showDialog<int?>(
                      context: context,
                      builder: (context) {
                        _textFieldController.text = startingLife.toString();
                        return AlertDialog(
                          title: const Text('Set Custom Starting Life'),
                          content: TextField(
                            controller: _textFieldController,
                            decoration: const InputDecoration(
                                hintText: "Starting Life"),
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('Cancel'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            ElevatedButton(
                              child: const Text('Set'),
                              onPressed: () {
                                Navigator.pop(
                                  context,
                                  int.tryParse(
                                    _textFieldController.text,
                                    radix: 10,
                                  ),
                                );
                              },
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    newStartingLife = newSelection.first;
                  }

                  if (newStartingLife != null) {
                    setState(() {
                      startingLife = newStartingLife!;
                    });
                  }
                },
                segments: [10, 20, 30, 40, 50, 0]
                    .map<ButtonSegment<int>>(
                      (int value) => ButtonSegment<int>(
                          value: value,
                          label:
                              Text(value == 0 ? "Custom" : value.toString())),
                    )
                    .toList(),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                child: const Text("Start"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Counter(
                        players: players,
                        startingLife: startingLife,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
