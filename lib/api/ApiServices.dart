import 'package:dio/dio.dart';

class ApiServices {
  static String baseUrl = 'http://10.0.2.2:3000';

  static Future<dynamic>? GetAllTransactions() async {
    final response = await Dio().get('$baseUrl/transactions');
    if (response.statusCode != 200) return null;
    return response.data;
  }

  static Future<dynamic>? Login(String privateKey) async {
    final response =
        await Dio().post('$baseUrl/logIn', data: {'privateKey': privateKey});
    if (response.statusCode != 200) return null;
    return response.data;
  }

  static Future<dynamic>? SignUp() async {
    final response = await Dio().get('$baseUrl/signUp');
    if (response.statusCode != 200) return null;
    return response.data;
  }

  static Future<dynamic>? Logout() async {
    final response = await Dio().get('$baseUrl/logOut');
    if (response.statusCode != 200) return null;
    return response.data;
  }

  static Future<dynamic>? GetBalance() async {
    final response = await Dio().get('$baseUrl/balance');
    if (response.statusCode != 200) return null;
    return response.data;
  }

  static Future<dynamic>? GetHistory() async {
    final response = await Dio().get('$baseUrl/history');
    if (response.statusCode != 200) return null;
    print(response.data);
    return response.data;
  }

  static Future<dynamic>? Mine() async {
    final response = await Dio().get('$baseUrl/mine-transactions');
    if (response.statusCode != 200) return null;
    print(response.data);
    return response.data;
  }

  static Transfer(String key, String amount) async {
    final response = await Dio().post(
      '$baseUrl/transact',
      data: {'recipient': key, 'amount': amount},
    );
    if (response.statusCode != 200) return null;
    return response.data;
  }
}
