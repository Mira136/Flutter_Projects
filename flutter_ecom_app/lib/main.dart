import 'package:flutter/material.dart';

void main() {
  runApp(
    Container(
      width: 300,
      height: 300,
      padding: const EdgeInsets.all(30),
      margin: const EdgeInsets.all(20),
      color: Colors.amber,

      child: Container(
        width: 200,
        height: 200,
        padding: const EdgeInsets.all(30),
        margin: const EdgeInsets.all(20),
        color: Colors.blue,

        child: Container(
          width: 100,
          height: 100,
          padding: const EdgeInsets.all(30),
          margin: const EdgeInsets.all(20),
          color: Colors.red,

          child: Container(
            width: 50,
            height: 50,
            padding: const EdgeInsets.all(30),
            margin: const EdgeInsets.all(20),
            color: Colors.black,

            child: Container(
              width: 500,
              height: 500,
              padding: const EdgeInsets.all(30),
              margin: const EdgeInsets.all(20),
              color: Colors.green,
            ),
          ),
        ),
      ),
    ),
  );
}

// yellow blue red black green
