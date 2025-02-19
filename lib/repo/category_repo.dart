import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../models/category.dart';

class CategoryRepo {
  static Future<void> getCategory(
      {required Function(List<CategoryItem>) onSuccess,
      required Function(String message) onError,
      required int id}) async {
    // try {
    var url = Uri.parse("http://192.168.1.71:8000/api/categories/$id");
    var headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
    };

    http.Response response = await http.get(
      url,
      headers: headers,
    );
    var data = json.decode(response.body);

    if (data['status']) {
      log("--------------------------------");

      onSuccess(categoryListFromJson(data['data']['categories']));
      log("-----------------${data}---------------");
    }
    // } catch (e) {
    //   log("-->>>>$e");
    //   onError("Sorry something went wrong. Please try again");
    // }
  }
}
