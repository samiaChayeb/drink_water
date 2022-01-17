import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/environment.dart';

class Authentication {
  final String apiHost = Environment().config.apiHost;

  login(email, password) async {
    final data = jsonEncode({"email": email, "password": password});
    final response = await http.post(
        Uri.parse(apiHost + '/api/authentication_token'),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: data,
        encoding: Encoding.getByName("utf-8"));
    Map<String, dynamic> responseBody = jsonDecode(response.body);
    if (response.statusCode == 200) {
      responseBody = {'token': responseBody['token'], 'code': 200};
    }
    return responseBody;
  }
}
