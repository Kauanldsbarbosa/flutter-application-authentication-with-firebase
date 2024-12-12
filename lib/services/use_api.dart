import 'dart:convert';
import 'package:authenticate/exceptions/auth_exceptions.dart';
import 'package:authenticate/services/result.dart';
import 'package:http/http.dart' as http;

class UseApi {
  static Future<Result> post(
      String url, Map<String, String> header, Map<String, dynamic> body) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode(body),
      );

      final responseData = jsonDecode(response.body);

      if (responseData["error"] != null) {
        throw AuthExceptions(responseData["error"]['message']);
      }

      return Result.success(responseData);
    } on AuthExceptions catch (error) {
      return Result.error(error.errorResponse());
    } catch (error) {
      return Result.error("$error");
    }
  }
}
