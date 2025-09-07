import 'dart:convert';

import 'package:flutter_store_web_app/src/core/error/exception/api_exception.dart';
import 'package:http/http.dart' as http;

class HttpService {
  static dynamic manageHttpResponse({
    required http.Response response, //the http response from the request
    // required BuildContext context, //the context is to show snackbar
    // required dynamic Function()
    // onSuccess, //the callback to execute on a successful response
  }) {
    final body = utf8.decode(response.bodyBytes);
    final jsonBody = jsonDecode(body);
    switch (response.statusCode) {
      case 200: //successful request
        return jsonBody;
      case 400: //bad request
        // showSnackBar(context, jsonDecode(response.body)["message"]);
        // final message = jsonDecode(response.body)["message"];
        return ApiException(jsonBody["message"], response.statusCode);
      case 500: //server error
        // showSnackBar(context, jsonDecode(response.body)["error"]);
        // final error = jsonDecode(response.body)["error"];
        return ApiException(jsonBody["error"], response.statusCode);
      case 201: //created succeed
        return jsonBody;
      // break;
    }
  }
}
