import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://localhost:3024"; // URL da API
  // OBS: Declaração de atributos usa-s lowerCamelCase
  // OBS: Declaração de classes usa-se UppeCamelCase

  // Método de classe para acessar os endpoints da api
  // GET(ALL)
  static Future<List<dynamic>> getList(String path) async {
    // No Dart precisa converter String => URL (Uri.parse)
    final res = await http.get(Uri.parse("$baseUrl/$path"));
    if(res.statusCode == 200) {
      return jsonDecode(res.body);
    }
    // Criando um erro para ser tratado no futuro
    throw Exception("Falha de conexão com a api $path");
  }


  // GET(One)
  static Future<Map<String,dynamic>> getOne(String path, String id) async {
    final res = await http.get(Uri.parse("$baseUrl/$path/$id"));
    if(res.statusCode == 200) {
      return jsonDecode(res.body);
    }
    throw Exception("Falha de conexão com a api $path");
  }


  // POST
  static Future<Map<String,dynamic>> post(String path, Map <String,dynamic> body) async {
    final res = await http.post(Uri.parse("$baseUrl/$path"), body: jsonEncode(body));
    if (res.statusCode == 201) {
      return jsonDecode(res.body);
    }
    throw Exception("Falha de comunicação com a api $path");
  }


  // PUT
  static Future<Map<String,dynamic>> put(String path, Map <String,dynamic> body, String id) async {
    final res = await http.put(Uri.parse("$baseUrl/$path/$id"), body: jsonEncode(body));
    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    }
    throw Exception("Falha de comunicação com a api $path");
  }
  

  // DELETE
  static Future<void> delete(String path, String id) async {
    final res = await http.delete(Uri.parse("$baseUrl/$path/$id"));
    if (res.statusCode != 200) {
      throw Exception("Falha ao deletar de $path");
    }
    return jsonDecode(res.body);
  }

}