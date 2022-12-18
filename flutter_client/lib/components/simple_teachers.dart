import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';

import 'package:flutter_client/components/simple_widgets.dart';
import 'package:flutter_client/components/text_widgets.dart';

class NoOverscrollIndicatorBehavior extends ScrollBehavior{
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class TeachersListWrapper extends StatefulWidget{
  static final Uri address = Uri(
    scheme: 'https',
    host: 'teachers-bingo-derlev.vercel.app',
    path: '/api/teachers',
  );
  
  const TeachersListWrapper({super.key});

  @override
  State createState() => TeachersListWrapperState();
}

class TeachersListWrapperState extends State<TeachersListWrapper>{
  late Future<Response> response;
  bool reloadIndicator = true;
  
  @override
  void initState() {
    super.initState();
    response = get(TeachersListWrapper.address);
  }
  
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {
          reloadIndicator = false;
          response = get(TeachersListWrapper.address);
        });
        await response;
      },
      child: TeachersList(data: response, showIndicator: reloadIndicator),
    );
  }
}

class TeachersList extends StatelessWidget{
  final Future<Response> data;
  final bool showIndicator;
  
  const TeachersList({required this.data, this.showIndicator = false, super.key});
  
  List<Widget> parseResponse(Response response){
    final List<dynamic> json = jsonDecode(response.body.toString());
    List<Widget> widgets = [const DefaultDivider()];
    for (int index = 0; index < json.length; ++index){
      widgets.add(TeacherTile(
          name: (json[index] as Map<String, dynamic>)['name'] as String
      ));
      widgets.add(const DefaultDivider());
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    final Widget error = DefaultText(
      text: 'Beim laden der Lehrer ist ein Fehler aufgetreten!',
      color: Theme.of(context).colorScheme.error,
    );
    
    return FutureBuilder(
      future: data,
      builder: (BuildContext ctx, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Column(children: showIndicator
              ? [const CircularProgressIndicator()]
              : [const Center()]
            );
          
          case ConnectionState.none: return error;
          
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasData == false) {
              return error;
            } else {
              final parsed = parseResponse(snapshot.data);
              return ScrollConfiguration(
                behavior: NoOverscrollIndicatorBehavior(),
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: parsed,
                ),
              );
            }
        }
      }
    );
  }
}

class TeacherTile extends StatefulWidget{
  final String name;
  
  const TeacherTile({required this.name, super.key});

  @override
  State<StatefulWidget> createState() => TeacherTileState();
}

class TeacherTileState extends State<TeacherTile>{
  bool value = false;
  
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: value,
      onChanged: (bool value) {
        setState(() {
          this.value = value;
        });
      },
      title: DefaultText(text: widget.name),
    );
  }
}

