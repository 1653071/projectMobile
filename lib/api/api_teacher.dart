import 'package:flutter_app/model/teacher/teacher_model.dart';
import 'package:http/http.dart' as http;
import'dart:convert';
class ApiTeacher{
  Future<List<Teacher>> fetchTeacher() async {
    final String url ="https://api.letstudy.org/instructor";
    final data = await http.get(Uri.parse(url));
    var jsonData = json.decode(data.body);
    List<Teacher> teachers = [];

    for (var joke in jsonData["payload"]) {
      teachers.add(Teacher.fromJson(joke));
    }
    return teachers;
  }
}