import 'package:flutter_app/Helper/Constance/const_variable.dart';
import 'package:http/http.dart' as http;

class AuthFunctions{
  static registerAuth() async {
    try {
      final http.Response _response = await http.post(
          Uri.parse('$baseUrl/wp/v2/users/'),
          body: {
          }
      );
    }catch(e) {
      print(e.toString());
    }
  }
}