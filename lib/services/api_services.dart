import 'dart:convert';

import '../models/Users.dart';

import 'package:http/http.dart' as http;

String baseUrl = 'https://dummyjson.com';
class AppServices {
  Future<Users> productsApi({required int skip, required int limit}) async {
    String endPoint = '$baseUrl/products?limit=$limit&skip=$skip';
    try {
      var response = await http.get(Uri.parse(endPoint));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        Users newUserModel = Users.fromJson(data);
        return newUserModel;
      } else {
        throw Exception("Failed to fetch data");
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }
}


