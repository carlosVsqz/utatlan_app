import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:utatlan_app/src/models/api_model.dart';

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
  if (response.statusCode == 200 && response.headers.containsKey('authorization')) {
//    return Token.fromJson(json.decode(response.headers));
  return Token.toBearer(response.headers.values.elementAt(2));
  } else {
    print(json.decode(response.body).toString());
    throw Exception(json.decode(response.body));
  }
}
