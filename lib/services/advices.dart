import 'dart:async';
import 'dart:convert';
import 'dart:io';
import '../model/advice.dart';
import 'package:http/http.dart' as http;
import '../config/environment.dart';

Future<Advice> getAllAdvices() async {
  final String apiHost = Environment().config.apiHost;
  final response = await http.get(
    Uri.parse(apiHost + '/advices'),
    // Send authorization headers to the backend.
    headers: {
      HttpHeaders.authorizationHeader: 'Basic your_api_token_here',
    },
  );
  final responseJson = jsonDecode(response.body);

  return Advice.fromJson(responseJson);
}
