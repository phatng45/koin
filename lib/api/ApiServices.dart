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
    print("history: " + response.data.toString());
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

  static GetBlocks() async {
    final response = await Dio().get('$baseUrl/blocks');
    if (response.statusCode != 200) return null;
    print(response.data);
    return response.data;
  }

  static GetBlockDetails(String id) async {
    print(id);
    final response = await Dio().get('$baseUrl/blocks/$id');
    if (response.statusCode != 200) return null;
    print(response.data);
    return response.data;
  }

  static String? getParameterByName(String name, {String? url}) {
    RegExp regex = RegExp('[?&]' + name + '(=([^&#]*)|&|#|\$)');
    if (url == null) {
      // You can remove the next line and use your URL directly if you have one.
      url = '?param=$name'; // Replace 'name' with your UUID (e.g., '75bd5fda-2ff4-447b-b14a-eac3182f988e')
    }
    Match? match = regex.matchAsPrefix(url);
    if (match == null) return null;
    String? result = match?.group(2);
    if (result == null) return '';
    return Uri.decodeComponent(result.replaceAll('+', ' '));
  }
}
