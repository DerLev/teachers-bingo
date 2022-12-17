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

class FilledIconButton extends StatelessWidget{
  final String text;
  final Size fixedSize;
  final IconData icon;
  final void Function() onPressed;
  
  const FilledIconButton({
    required this.text,
    required this.fixedSize,
    required this.icon,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
        fixedSize: MaterialStateProperty.all(fixedSize),
        elevation: MaterialStateProperty.all(0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          const SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
            ),
          ),
        ],
      ),
    );
  }
}

class OutlinedIconButton extends StatelessWidget{
  final String text;
  final Size fixedSize;
  final IconData icon;
  final void Function() onPressed;
  
  const OutlinedIconButton({
    required this.text,
    required this.fixedSize,
    required this.icon,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.onPrimary),
        fixedSize: MaterialStateProperty.all(fixedSize),
        side: MaterialStateProperty.all(BorderSide(
          color: Theme.of(context).colorScheme.primary,
          width: 2
        )),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
            ),
          ),
        ],
      ),
    );
  }
}
