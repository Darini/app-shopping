import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping/settings.dart';
import 'package:shopping/themes/dark.theme.dart';
import 'package:shopping/themes/dark_yellow.theme.dart';
import 'package:shopping/themes/light.theme.dart';

class ThemeBloc extends ChangeNotifier {
  var theme = lightTheme();

  ThemeBloc() {
    load();
  }

  change(String colorTheme) {
    switch (colorTheme) {
      case 'light':
        {
          theme = lightTheme();
          Settings.theme = 'light';
          break;
        }
      case 'dark':
        {
          theme = darkTheme();
          Settings.theme = 'dark';
          break;
        }
      case 'dark-yellow':
        {
          theme = darkYellowTheme();
          Settings.theme = 'dark-yellow';
          break;
        }
      default:
        {
          theme = lightTheme();
          Settings.theme = 'light';
          break;
        }
    }
    notifyListeners();
  }

  Future load() async {
    var prefs = await SharedPreferences.getInstance();
    var themeLoad = prefs.getString('theme');

    Settings.theme = themeLoad!.isEmpty ? 'light' : themeLoad;

    change(Settings.theme);
  }
}
