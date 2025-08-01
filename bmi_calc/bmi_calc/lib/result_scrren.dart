import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  double result = 0;
  ResultScreen(result, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI Calc'), centerTitle: true),
      body: Column(children: [Text('Message'), Text('Sujjestion')]),
    );
  }
}
