import 'package:flutter/material.dart';
import 'package:flutter_client/components.dart';
import 'package:flutter_client/simplepage.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Container(
          constraints: BoxConstraints.loose(Size.fromWidth(
            MediaQuery.of(context).size.width * 0.8,
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: TitleText(text: 'Willkommen beim\nLehrer-Bingo'),
              ),
              
              const SizedBox(height: 100),
              
              FilledIconButton(
                text: 'simple',
                fixedSize: Size.fromWidth(MediaQuery.of(context).size.width * 0.6),
                icon: MdiIcons.star,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context) {
                      return const SimplePage();
                    }),
                  );
                },
              ),
              
              OutlinedIconButton(
                text: 'custom',
                fixedSize: Size.fromWidth(MediaQuery.of(context).size.width * 0.6),
                icon: MdiIcons.wrench,
                onPressed: () {},
              ),
              
              const DefaultDivider(),
              
              FilledIconButton(
                text: 'saved',
                fixedSize: Size.fromWidth(MediaQuery.of(context).size.width * 0.6),
                icon: MdiIcons.contentSave,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
