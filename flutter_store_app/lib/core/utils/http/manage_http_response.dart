import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_store_app/core/utils/show_snackbar.dart';
import 'package:http/http.dart' as http;

dynamic manageHttpResponse({
  required http.Response response, //the http response from the request
  // required BuildContext context, //the context is to show snackbar
  required dynamic Function()
  onSuccess, //the callback to execute on a successful response
}) {
  switch (response.statusCode) {
    case 200: //successful request
      return onSuccess();
    case 400: //bad request
      // showSnackBar(context, jsonDecode(response.body)["message"]);
      return jsonDecode(response.body)["message"];
    case 500: //server error
      // showSnackBar(context, jsonDecode(response.body)["error"]);
      return jsonDecode(response.body)["error"];
    case 201: //created succeed
      return onSuccess();
    // break;
  }
}
