import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  ChangeNotifierProvider(
    create: (context) => DataProvider(),
    child: const App(),
  )
);

class DataProvider extends ChangeNotifier {
  final List<String> _teachers = [];
  Random _random = Random(0);
  
  UnmodifiableListView<String> get teachers
    => UnmodifiableListView<String>(_teachers);
  
  void add({String? teacher}) {
    teacher ??= _random.nextInt(1000).toString();
    
    if (!_teachers.contains(teacher)) {
      _teachers.add(teacher);
      notifyListeners();
    }
  }
  
  void reset() {
    _random = Random(0);
    _teachers.clear();
    notifyListeners();
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teachers Bingo',
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(title: const Text('Pseudo random numbers')),
        floatingActionButton: FloatingActionButton(
          child: Consumer<DataProvider>(
            builder: (context, dataProvider, child) => (
              dataProvider.teachers.isEmpty
              ? const Icon(Icons.add)
              : Text(dataProvider.teachers.last)
            ),
          ),
          onPressed: () => Provider.of<DataProvider>(context, listen: false).add(),
        ),
        body: Consumer<DataProvider>(
          builder: (context, dataProvider, child) => ListView(
            children: dataProvider.teachers.map((teacher) => ListTile(
              title: Text(teacher),
            )).toList(),
          ),
        ),
      ),
    );
  }
}
