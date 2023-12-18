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
  List<int> numbers = [];
  // int counter = 0;

  void onClicked() {
    setState(() {
      numbers.add(numbers.length);
      // counter = counter + 1;
    });
  }
  // setstate안에서 데이터의 변경이 발생하면 스테잇이 이걸 받아서 다시 데이터와
  // UI를 업데이트 하라고 한다.

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
              for (var number in numbers) Text('$number'),
              // collection for in dart. list의 각각의 항에 대한 동작 실행.
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
