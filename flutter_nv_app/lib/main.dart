import 'package:flutter/material.dart';
import 'package:flutter_nv_app/calculatorview.dart';
import 'package:flutter_nv_app/containerexperiment.dart';
import 'package:flutter_nv_app/columnexperiment.dart';
import 'package:flutter_nv_app/stopwatch.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StopwatchExperiemnt(),
      // body: Calculatorview(),
      //body: CustomContainer(),
      //body: ColumnContainer(),
      //(child: Text('3456789'))),
      // );
    );
  }
}
