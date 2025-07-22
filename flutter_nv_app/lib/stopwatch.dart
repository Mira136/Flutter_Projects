import 'package:flutter/material.dart';

class StopwatchExperiement extends StatefulWidget {
  const StopwatchExperiement({super.key});

  @override
  State<StopwatchExperiement> createState() => _StopwatchExperiementState();
}

class _StopwatchExperiementState extends State<StopwatchExperiement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stopwatch Experiment')),
      body: Center(
        child: Text(
          '0 Seconds',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
