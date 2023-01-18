import 'package:shopping/models/authenticated_user.model.dart';

class CreateUserModel extends AuthenticatedUserModel {
  String? name;
  String? email;

  CreateUserModel({this.name, this.email});

  CreateUserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['name'] = name;
    data['email'] = email;
    data['username'] = username;
    data['password'] = password;
    return data;
  }
}
