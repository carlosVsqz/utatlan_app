import 'dart:async';
import 'dart:convert';
import 'package:utatlan_app/model/api_model.dart';
import 'package:http/http.dart' as http;

final _base = "https://plaza-utatlan.herokuapp.com";
final _tokenEndpoint = "/api-v2/users/login";
final _tokenURL = _base + _tokenEndpoint;

Future<Token> getToken(UserLogin userLogin) async {
  print(_tokenURL);
  final http.Response response = await http.post(
    _tokenURL,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept-Encoding':'gzip, deflate, br',
      'Accept':'*/*',
    },
    body: jsonEncode(userLogin.toDatabaseJson()),
  );
  if (response.statusCode == 200) {
    print(response.statusCode);
    return Token.fromJson(json.decode(response.body));
  } else {
    print(json.decode(response.body).toString());
    throw Exception(json.decode(response.body));
  }
}
