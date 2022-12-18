import 'package:flutter/material.dart';

import 'package:flutter_client/components/text_widgets.dart';
import 'package:flutter_client/components/simple_teachers.dart';

class SimplePage extends StatelessWidget{
  const SimplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Container(
          constraints: BoxConstraints.loose(Size.fromWidth(
            MediaQuery.of(context).size.width * 0.8
          )),
          child: Column(
            children: const [
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 50),
                child: Center(
                  child: TitleText(text: 'Wähle die Lehrer für\ndein Bingo-Spiel'),
                ),
              ),
              SizedBox(height: 20),
              Expanded(child: TeachersListWrapper()),
            ],
          ),
        ),
      ),
    );
  }
}
