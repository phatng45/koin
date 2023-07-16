import 'package:dio/dio.dart';

class ApiServices {
  static String baseUrl = 'http://10.0.2.2:3000';

  static Future<dynamic>? GetAllTransactions() async {
    final response = await Dio().get('$baseUrl/transactions');

    if (response.statusCode != 200) return null;
    return response.data;
  }
}

class Transaction {}
