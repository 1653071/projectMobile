import 'package:flutter_app/model/category/category.dart';
import 'package:http/http.dart' as http;
import'dart:convert';

class ApiCategoryService{
  Future<List<Category>> fetchCategory() async {
    final String url ="https://api.letstudy.org/category/all";
    final data = await http.get(Uri.parse(url)
    );
    var jsonData = json.decode(data.body);
    List<Category> categories = [];

    for (var joke in jsonData["payload"]) {
      categories.add(Category.fromJson(joke));
    }
    return categories;
  }



}