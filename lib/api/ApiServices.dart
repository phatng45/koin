import 'package:dio/dio.dart';

class ApiServices {
  static String baseUrl = 'http://10.0.2.2:3000';

  static Future<dynamic>? GetAllTransactions() async {
    final response = await Dio().get('$baseUrl/transactions');
    if (response.statusCode != 200) return null;
    return response.data;
  }

  static Future<dynamic>? Login(String privateKey) async {
    final response = await Dio().post('$baseUrl/logIn', data: privateKey);
    if (response.statusCode != 200) return null;


    // localStorage.setItem('publicKey', data.publicKey);
    // localStorage.setItem('privateKey', data.privateKey);

    return response.data;
  }

}