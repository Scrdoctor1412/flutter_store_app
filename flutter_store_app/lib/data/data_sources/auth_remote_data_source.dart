import 'dart:convert';

import 'package:flutter_store_app/core/common/global.dart';
import 'package:flutter_store_app/core/errors/exceptions.dart';

import 'package:flutter_store_app/data/models/user.dart';
import 'package:http/http.dart' as http;

abstract interface class AuthRemoteDataSource {
  Future<dynamic> signUpUsers({
    required String email,
    required String password,
    required String fullName,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<dynamic> signUpUsers({
    required String email,
    required String password,
    required String fullName,
  }) async {
    try {
      User newUser = User(
        id: "",
        fullName: fullName,
        email: email,
        state: "",
        city: "",
        locality: "",
        password: password,
      );
      final response = await http.post(
        Uri.parse("$uri/api/signup"),
        body: newUser.toJson(),
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return User.fromJson(response.body);
      }
      // throw ServerException(response.body);
      return response.body;
    } catch (e) {
      // throw ServerException(e.toString());
      return e.toString();
    }
  }
}
