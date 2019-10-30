import 'package:flutter_developer_test/model/registrasi.dart';
import 'package:http/http.dart' show Client;

class ApiService{
  final String baseUrl = "https://jsonplaceholder.typicode.com";
  Client client = Client();

  Future<List<Registrasi>> getRegistrasi() async {
    final response = await client.get("$baseUrl/todos");
    if (response.statusCode == 200) {
      return registrasiFromJson(response.body);
    } else {
      return null;
    }
  }

}