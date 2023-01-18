import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shopping/models/authenticated_user.model.dart';
import 'package:shopping/models/create_user.model.dart';
import 'package:shopping/models/user.model.dart';
import 'package:shopping/settings.dart';

class AccountRepository {
  Future<UserModel> authenticate(AuthenticatedUserModel user) async {
    var url = '${Settings.apiUrl}v1/account/login';

    Response response = await Dio().post(url, data: user);

    var user2 = UserModel.fromJson(response.data);

    return user2;
  }

  Future<UserModel> create(CreateUserModel user) async {
    var url = '${Settings.apiUrl}v1/account';

    Response response = await Dio().post(url, data: user);

    return UserModel.fromJson(response.data);
  }
}
