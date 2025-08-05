import 'dart:async';
import 'package:flutter/material.dart';

class StopwatchExperiemnt extends StatefulWidget {
  var name, email;
  StopwatchExperiemnt({super.key, required this.name, required this.email});

  @override
  State<StopwatchExperiemnt> createState() => _StopwatchExperiemntState();
}

class _StopwatchExperiemntState extends State<StopwatchExperiemnt> {
  double seconds = 0;
  late Timer timer;
  bool isTicking = false;
  int millis = 0;
  final laps = <int>[];
  String _secondtoText() => seconds <= 1 ? 'Second' : 'Seconds';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.name)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Text(
                '$seconds ${_secondtoText()}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ),
          Expanded(child: controlPanel()),
          Expanded(child: _builderDisplay()),
        ],
      ),
    );
  }

  Row controlPanel() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: isTicking ? null : _starttimer,
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.green),
            foregroundColor: MaterialStatePropertyAll(Colors.white),
          ),
          child: const Text("Start"),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: isTicking ? _stoptimer : null,
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.red),
            foregroundColor: MaterialStatePropertyAll(Colors.white),
          ),
          child: const Text("Stop"),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: _lapClick,
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.amber),
            foregroundColor: MaterialStatePropertyAll(Colors.white),
          ),
          child: const Text("Lap"),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }

  void _starttimer() {
    timer = Timer.periodic(const Duration(milliseconds: 100), _onTick);
    setState(() {
      isTicking = true;
      millis = 0;
      laps.clear();
    });
  }

  // final laps = <int>[];
  void _lapClick() {
    if (isTicking) {
      setState(() {
        laps.add(millis);
        millis = 0;
      });
    }
    print(laps);
  }

  void _stoptimer() {
    timer.cancel();
    setState(() {
      isTicking = false;
    });
  }

  void _onTick(Timer timer) {
    if (mounted) {
      setState(() {
        millis += 100;
        seconds = millis / 1000;
      });
    }
  }

  Widget _buildDisplay() {
    return ListView(
      children: [
        for (int i in laps)
          ListTile(
            leading: const Icon(Icons.timer),
            title: Text('Lap ${laps.indexOf(i) + 1}: ${i / 1000} seconds'),
            trailing: const Icon(Icons.delete),
          ),
      ],
    );
  }

  Widget _builderDisplay() {
    return ListView.builder(
      itemCount: laps.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.timer),
          title: Text('Lap ${index + 1}: ${laps[index] / 1000} seconds'),
        );
      },
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
