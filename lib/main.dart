import 'package:flutter/material.dart';
import 'package:flutter_blocxx/src/presentation/pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;
  String textCounter = "None";

  void _incrementCounter() async {
    asyncCounter().then((value) => {
          setState(() {
            _counter++;
            textCounter = value;
          })
        });
  }

  Future<String> asyncCounter() {
    return Future.delayed(
        const Duration(seconds: 2), (() => _counter.toString()));
  }

  void _decreaseCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: MainPage());
  }
}
