import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Container(
          color: Colors.amber,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              color: Colors.blue,
              child: Center(
                child: const Text(
                  "hello",
                  style: TextStyle(
                    fontFamily: "Times New Roman",
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
