import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Lab N1'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int duration = 1;
  int _numTimer = 0;
  bool _timerIsOn = false;

  void _increaseTimer() {
    _numTimer += 1;
  }

  void _startTimer() {
    setState(() {
        Timer(const Duration(seconds: 1), _increaseTimer);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF147CD4),
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            const Text('Timer:', style: TextStyle(fontSize: 20)),
            Text(
              '$_numTimer',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 25),
              child: FloatingActionButton(
                onPressed: () {
                  _startTimer();
                },
                tooltip: 'Increment',
                backgroundColor: Color(0xFF147CD4),
                child: const Icon(Icons.play_circle_outline),
                shape : CircleBorder()
              ),
            ),
          ],
        ),
      ),
    );
  }
}
