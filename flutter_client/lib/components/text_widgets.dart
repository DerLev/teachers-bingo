import 'package:flutter/material.dart';

class TitleText extends StatelessWidget{
  final String text;
  final Color? color;
  
  const TitleText({required this.text, this.color, super.key});
  
  @override
  Widget build(BuildContext context){
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
        color: (color ?? Theme.of(context).colorScheme.onSurface),
      ),
    );
  }
}

class DefaultText extends StatelessWidget{
  final String text;
  final Color? color;
  
  const DefaultText({required this.text, this.color, super.key});
  
  @override
  Widget build(BuildContext context){
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
        color: (color ?? Theme.of(context).colorScheme.primary),
      ),
    );
  }
}
