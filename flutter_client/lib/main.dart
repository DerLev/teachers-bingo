import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lehrer-Bingo',
      theme: ThemeData.light().copyWith(
        textTheme: ThemeData.light().textTheme.copyWith(
          titleMedium: ThemeData.light().textTheme.titleMedium?.copyWith(fontSize: 30),
          bodyMedium: ThemeData.light().textTheme.bodyMedium?.copyWith(fontSize: 20),
        ),
        colorScheme: ThemeData.light().colorScheme.copyWith(
          primary: Colors.amber,
          onPrimary: Colors.white,
          background: Colors.white,
          onBackground: Colors.black,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Container(
          constraints: BoxConstraints.loose(Size.fromWidth(
            MediaQuery.of(context).size.width * 0.8,
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Willkommen beim\nLehrer Bingo',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
              ),
              const SizedBox(height: 100),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
                  fixedSize: MaterialStateProperty.all(Size.fromWidth(
                    MediaQuery.of(context).size.width * 0.6,
                  )),
                  elevation: MaterialStateProperty.all(0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      MdiIcons.star,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'simple',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                      ),
                    ),
                  ],
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.onPrimary),
                  fixedSize: MaterialStateProperty.all(Size.fromWidth(
                    MediaQuery.of(context).size.width * 0.6,
                  )),
                  side: MaterialStateProperty.all(BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2
                  ))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      MdiIcons.wrench,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'custom',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                      ),
                    ),
                  ],
                )
              ),
              Divider(
                color: Theme.of(context).colorScheme.primary,
                height: 40,
                thickness: 2,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
                  fixedSize: MaterialStateProperty.all(Size.fromWidth(
                    MediaQuery.of(context).size.width * 0.6
                  )),
                  elevation: MaterialStateProperty.all(0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      MdiIcons.contentSave,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'saved',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
