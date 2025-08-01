import 'dart:developer';
import 'package:flutter/material.dart';

class BmiCalcScreen extends StatefulWidget {
  const BmiCalcScreen({super.key});

  @override
  State<BmiCalcScreen> createState() => _BmiCalcScreenState();
}

class _BmiCalcScreenState extends State<BmiCalcScreen> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  double result = 0;
  String category = ''; // <- To store BMI category
  bool isValidated = false;

  void validate() {
    if (weightController.text.isNotEmpty && heightController.text.isNotEmpty) {
      isValidated = true;
    } else {
      isValidated = false;
    }
    setState(() {});
  }

  /// This function determines the BMI category
  String getBmiCategory(double bmi) {
    if (bmi < 18.5) {
      return "Underweight";
    } else if (bmi < 24.9) {
      return "Normal weight";
    } else if (bmi < 29.9) {
      return "Overweight";
    } else if (bmi < 34.9) {
      return "Obesity Class I";
    } else if (bmi < 39.9) {
      return "Obesity Class II";
    } else {
      return "Obesity Class III (Severe)";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI Calc'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            TextField(
              onChanged: (v) {
                validate();
              },
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Weight in Kgs",
                hintText: "Enter your Weight in Kgs",
              ),
            ),
            SizedBox(height: 10),
            TextField(
              onChanged: (v) {
                log("from heightController" + v);
                validate();
              },
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Height in Meters",
                hintText: "Enter your Height in Meters",
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: isValidated
                  ? () {
                      double wt = double.parse(weightController.text);
                      double ht = double.parse(heightController.text);
                      result = wt / (ht * ht);
                      category = getBmiCategory(result); // Get the category
                      setState(() {});
                    }
                  : null,
              child: Text('Calculate'),
            ),
            SizedBox(height: 20),
            Text(
              'BMI: ${result.toStringAsFixed(2)}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            if (category.isNotEmpty) // Only show if calculated
              Text(
                'Category: $category',
                style: TextStyle(fontSize: 24, color: Colors.blueGrey),
              ),
          ],
        ),
      ),
    );
  }
}
