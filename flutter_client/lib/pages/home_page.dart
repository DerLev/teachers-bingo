import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:flutter_client/components/button_widgets.dart';
import 'package:flutter_client/components/text_widgets.dart';
import 'package:flutter_client/components/simple_widgets.dart';
import 'package:flutter_client/pages/simple_page.dart';

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
                    MaterialPageRoute(builder: (BuildContext context) => const SimplePage()),
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
