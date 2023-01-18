import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping/blocs/theme.bloc.dart';

class ButtonThemeSettings extends StatelessWidget {
  final String theme;

  const ButtonThemeSettings({Key? key, required this.theme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<ThemeBloc>(context);

    return TextButton(
      onPressed: () {
        save();
        bloc.change(theme);
      },
      child: textTheme(),
    );
  }

  Widget textTheme() {
    switch (theme) {
      case 'light':
        {
          return const Text(
            'Light',
            style: TextStyle(
              color: Colors.blue,
            ),
          );
        }
      case 'dark':
        {
          return const Text(
            'Dark',
            style: TextStyle(
              color: Color.fromARGB(255, 32, 31, 31),
            ),
          );
        }
      case 'dark-yellow':
        {
          return const Text(
            'Dark Yellow',
            style: TextStyle(
              color: Color(0xFFFFCC00),
            ),
          );
        }
      default:
        {
          return const Text(
            'Light',
            style: TextStyle(
              color: Colors.blue,
            ),
          );
        }
    }
  }

  save() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', theme);
  }
}
