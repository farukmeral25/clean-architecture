import 'dart:convert';

import 'package:flutter_clean_architecture/feature/authenticate/login/domain/entities/user_info.dart';

class UserInfoModel extends UserInfo {
  UserInfoModel({required String email, required String password}) : super(email: email, password: password);
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory UserInfoModel.fromMap(Map<String, dynamic> map) {
    return UserInfoModel(
      email: map['email'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserInfoModel.fromJson(String source) => UserInfoModel.fromMap(json.decode(source));
}
