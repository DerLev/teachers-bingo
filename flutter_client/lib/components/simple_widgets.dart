import 'package:flutter/material.dart';

class DefaultDivider extends StatelessWidget{
  const DefaultDivider({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Theme.of(context).colorScheme.primary,
      height: 40,
      thickness: 2,
    );
  }
}
