import 'dart:convert';

import 'package:flutter_store_app/core/common/global_values.dart';
import 'package:flutter_store_app/core/errors/exceptions.dart';
import 'package:flutter_store_app/core/utils/http/manage_http_response.dart';

import 'package:flutter_store_app/data/models/user.dart';
import 'package:http/http.dart' as http;

abstract interface class AuthRemoteDataSource {
  ///Function for calling signup api
  ///@params - email, password, fullname
  ///return type is either a User or error string
  Future<dynamic> signUpUsers({
    required String email,
    required String password,
    required String fullName,
  });

  ///Function for calling signin api
  ///@params - email, password
  ///return type is either a User or error string
  Future<dynamic> signinUsers({
    required String email,
    required String password,
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
        token: "",
      );
      final response = await http.post(
        Uri.parse("$uri/api/signup"),
        body: newUser.toJson(),
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
        },
      );

      return manageHttpResponse(
        response: response,
        onSuccess: () => User.fromJson(response.body),
      );
      // return response.body;
    } catch (e) {
      // throw ServerException(e.toString());
      return e.toString();
    }
  }

  @override
  Future<dynamic> signinUsers({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse("$uri/api/signin"),
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
        },
      );
      return manageHttpResponse(
        response: response,
        onSuccess: () => User.fromJson(response.body),
      );
    } catch (e) {
      return e.toString();
    }
  }
}
