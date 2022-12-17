import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_client/components.dart';
import 'package:http/http.dart';

class SimplePage extends StatelessWidget{
  const SimplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: const [
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.all(30),
            child: Center(
              child: TitleText(text: 'Wähle die Lehrer für\ndein Bingo-Spiel'),
            ),
          ),
          SizedBox(height: 20),
          TeachersList(),
        ],
      ),
    );
  }
}

class TeachersList extends StatefulWidget{
  const TeachersList({super.key});

  @override
  State createState() => TeachersListState();
}

class TeachersListState extends State<TeachersList>{
  late List<String> teachers;
  late bool error;
  
  void setTeachers(Response resp){    
    error = resp.statusCode != 200;
    if (error) return;
    
    List<dynamic> json = jsonDecode(resp.body.toString());
    teachers = json.map((element) => (element as Map<String, dynamic>)['name'] as String).toList();
  }
  
  @override
  Widget build(BuildContext context) {
    final Widget errorText = Center(child: DefaultText(
        text: 'Beim laden der Lehrer ist ein Fehler aufgetreten!',
        color: Theme.of(context).colorScheme.error,
    ));
    
    return FutureBuilder(
      future: get(Uri(
        scheme: 'https',
        host: 'teachers-bingo-derlev.vercel.app',
        path: '/api/teachers',
      )),
      
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState){
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(),
            );
          
          case ConnectionState.none:
            return errorText;
          
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasData == false) {
              return errorText;
            } else {
              setTeachers(snapshot.data);
              return Column(
                children: teachers.map((element) => Teacher(element)).toList(growable: false),
              );
            }
        }
      }
    );
  }
}

class Teacher extends StatelessWidget{
  final String name;
  
  const Teacher(this.name, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      style: ListTileStyle.list,
      title: DefaultText(text: name),
    );
  }
}
