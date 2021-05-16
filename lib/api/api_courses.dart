import 'package:flutter_app/model/courses/courses_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/model/courses/course_detail.dart';
import'dart:convert';


class ApiProductService{
  Future<List<Courses>> fetchCourses() async {
      final String url ="https://api.letstudy.org/course/top-new";
      final data = await http.post(Uri.parse(url),
          body: {"limit": "10", "page": "1"}
      );
      var jsonData = json.decode(data.body);
      List<Courses> courses = [];

      for (var joke in jsonData["payload"]) {
        courses.add(Courses.fromJson(joke));
    }
      return courses;
  }
  Future<List<Courses>> fetchTrendingCourses() async {
    final String url ="https://api.letstudy.org/course/top-rate";
    final data = await http.post(Uri.parse(url),
        body: {"limit": "10", "page": "1"}
    );
    var jsonData = json.decode(data.body);
    List<Courses> courses = [];

    for (var joke in jsonData["payload"]) {
      courses.add(Courses.fromJson(joke));
    }
    return courses;
  }
  Future<CourseDetail> fetchCourseDetail(String id) async{
    final String url ="https://api.letstudy.org/course/get-course-info?id=" +id;
    final data = await http.get(Uri.parse(url));
    final jsonData = json.decode(data.body);
    var item = jsonData["payload"];
    CourseDetail courseDetail ;
    courseDetail = CourseDetail.fromJson(item);


    return courseDetail;
  }

}

