import 'package:flutter/material.dart';
import 'package:flutter_client/pages/home_page.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lehrer-Bingo',
      theme: ThemeData.dark().copyWith(
        textTheme: ThemeData.dark().textTheme.copyWith(
          titleMedium: ThemeData.dark().textTheme.titleMedium?.copyWith(fontSize: 30),
          bodyMedium: ThemeData.dark().textTheme.bodyMedium?.copyWith(fontSize: 20),
        ),
      ),
      home: const HomePage(),
    );
  }
}
