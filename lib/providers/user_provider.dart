import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:test_provider/models/user_model.dart';

class UserProvider {
  final String _dataPath = "assets/users.json";
  List<UserModel> userList = [];

  Future<String> loadAsset() async {
    return await Future.delayed(const Duration(seconds: 2), () async {
      return await rootBundle.loadString(_dataPath);
    });
  }

  Future<List<UserModel>> loadUserData() async {
    var dataString = await loadAsset();
    Map<String, dynamic> jsonUserData = jsonDecode(dataString);
    userList = UserListModel.fromJson(jsonUserData["users"]).userList;

    return userList;
  }
}
