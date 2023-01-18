import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping/models/authenticated_user.model.dart';
import 'package:shopping/models/user.model.dart';
import 'package:shopping/repositories/account.repository.dart';
import 'package:shopping/settings.dart';

import '../models/create_user.model.dart';

class UserBloc extends ChangeNotifier {
  UserModel? user;

  UserBloc() {
    user = null;
    loadUser();
  }

  Future<UserModel?> authenticate(AuthenticatedUserModel model) async {
    try {
      var prefs = await SharedPreferences.getInstance();
      var repository = AccountRepository();

      var res = await repository.authenticate(model);

      user = res;
      await prefs.setString('user', jsonEncode(res));

      notifyListeners();
      return res;
    } catch (ex) {
      user = null;
      return null;
    }
  }

  Future<UserModel?> create(CreateUserModel model) async {
    try {
      var repository = AccountRepository();
      var res = await repository.create(model);

      return res;
    } catch (ex) {
      user = null;
      print(ex);
      return null;
    }
  }

  logout() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');

    user = null;

    notifyListeners();
  }

  Future loadUser() async {
    var prefs = await SharedPreferences.getInstance();
    var userData = prefs.getString('user');
    if (userData != null) {
      var res = UserModel.fromJson(jsonDecode(userData));

      Settings.user = res;
      user = res;
    }
  }
}
