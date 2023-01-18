import 'package:flutter/material.dart';
import 'package:shopping/settings.dart';
import 'package:shopping/ui/shared/widgets/settings/button_theme.widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          const SizedBox(
            height: 60,
          ),
          Text(
            'Tema atual: ${Settings.theme}',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          const ButtonThemeSettings(theme: 'light'),
          const ButtonThemeSettings(theme: 'dark'),
          const ButtonThemeSettings(theme: 'dark-yellow'),
        ],
      ),
    );
  }
}
