import 'dart:convert';
import 'dart:io';

import 'package:flutter_store_web_app/src/core/error/exception/api_exception.dart';
import 'package:flutter_store_web_app/src/core/global/global_variable.dart';
import 'package:flutter_store_web_app/src/services/http/http_service.dart';
import 'package:http/http.dart' as http;

abstract class BaseApiProvider {
  final String _baseUrl = '$uri/api';

  // Helper để lấy header chung
  Future<Map<String, String>> _getHeaders() async {
    // Trong ứng dụng thật, bạn sẽ lấy token từ một nơi lưu trữ an toàn
    // final String? token = await yourTokenStorage.getToken();
    return {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      // if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  // Helper cho phương thức GET
  Future<dynamic> get(String endpoint) async {
    final uri = Uri.parse(_baseUrl + endpoint);
    try {
      final response = await http.get(uri, headers: await _getHeaders());
      return _processResponse(response);
    } catch (e) {
      // Xử lý lỗi kết nối mạng
      throw ApiException(e.toString(), 0);
    }
  }

  // Helper cho phương thức POST
  Future<dynamic> post(
    String endpoint, {
    required Map<String, dynamic> body,
  }) async {
    final uri = Uri.parse(_baseUrl + endpoint);
    try {
      final response = await http.post(
        uri,
        headers: await _getHeaders(),
        body: jsonEncode(body), // Phải encode body ra JSON string
      );
      return _processResponse(response);
    } catch (e) {
      throw ApiException(e.toString(), 0);
    }
  }

  // Xử lý response tập trung
  dynamic _processResponse(http.Response response) {
    return HttpService.manageHttpResponse(response: response);
    // // Chú ý: Cần decode UTF-8 để hiển thị đúng tiếng Việt
    // final body = utf8.decode(response.bodyBytes);
    // final jsonBody = jsonDecode(body);

    // if (response.statusCode >= 200 && response.statusCode < 300) {
    //   return jsonBody;
    // } else {
    //   // Ném ra lỗi nếu status code không thành công
    //   final errorMessage = jsonBody['message'] ?? 'Đã có lỗi xảy ra';
    //   throw ApiException(errorMessage, response.statusCode);
    // }
  }
}
