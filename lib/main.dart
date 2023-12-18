import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}
// statefulwidget의 데이터는 또 하나의 클래스 프로퍼티이다.

class _MyAppState extends State<MyApp> {
  int counter = 0;
  void onClicked() {
    setState(() {
      counter = counter + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Click count.",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              Text(
                "$counter",
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
              IconButton(
                iconSize: 40,
                onPressed: onClicked,
                icon: const Icon(Icons.add_box_outlined),
              )
            ],
          ),
        ),
      ),
    );
  }
}
