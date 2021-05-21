import 'package:flutter_app/model/search/search_model.dart';
import 'package:flutter_app/model/teacher/teacher_detail_model.dart';
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
  Future<TeacherDetail> fetchTeacherBaseOnCourse(String id) async{
      final String url="https://api.letstudy.org/instructor/detail/"+id;
      final data = await http.get(Uri.parse(url));
      TeacherDetail teacherDetail;
      var jsonData = json.decode(data.body);

      var teacher = jsonData["payload"];
      teacherDetail = TeacherDetail.fromJson(teacher);
      return teacherDetail;
  }
  Future<List<TeacherData>> fetchTeacherSearch(String keyword) async {
    final String url = "https://api.letstudy.org/course/search-bar";
    List<TeacherData> list =[] ;
    final response = await http.post(Uri.parse(url),
        body: {"keyword":keyword});
    var jsonData = json.decode(response.body);
    var data = jsonData['payload'] ;
    var teachers = data['instructors'];
    var  a= teachers['data'] as List;

    for(var teacher in a){
      list.add(TeacherData.fromJson(teacher));
    }
    return list;
  }
}