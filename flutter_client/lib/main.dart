import 'package:flutter/material.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic Example App',
      theme: ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Basic Example App"),
        ),
        body: const Center(
          child: Text(
            "lorem ipsum",
            style: TextStyle(
              fontSize: 20
            ),
          ),
        ),
      ));
  }
}
