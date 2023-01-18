import 'package:shopping/models/create_user.model.dart';

class UserModel extends CreateUserModel {
  String? id = '';
  String? image;
  String? role;
  String? token;

  UserModel({this.id, this.image, this.role, this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    image = json['image'];
    username = json['username'];
    role = json['role'];
    token = json['token'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id ?? '';
    data['name'] = name ?? '';
    data['email'] = email ?? '';
    data['image'] = image ?? '';
    data['username'] = username;
    data['role'] = role ?? '';
    data['token'] = token ?? '';

    return data;
  }
}
