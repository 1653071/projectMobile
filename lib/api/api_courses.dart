import 'package:flutter_app/model/courses/course_favorite.dart';
import 'package:flutter_app/model/courses/course_favorite.dart';
import 'package:flutter_app/model/courses/course_favorite.dart';
import 'package:flutter_app/model/courses/course_withlesson.dart';
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
    final String url ="https://api.letstudy.org/course/get-course-info?id=$id" ;
    final data = await http.get(Uri.parse(url));
    final jsonData = json.decode(data.body);
    var item = jsonData["payload"];
    CourseDetail courseDetail ;
    courseDetail = CourseDetail.fromJson(item);
    return courseDetail;
  }
  static Future<void> LikeCourses(String token,String idCourse) async{
    final url = "https://api.letstudy.org/user/like-course";
    await http.post(Uri.parse(url),headers: {

      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },body: {"courseId": idCourse });
  }
  Future<List<FavoriteCourses>> FavoriteCoursesOfUser(String token) async{
    final url = "https://api.letstudy.org/user/get-favorite-courses";
    final response = await http.get(Uri.parse(url),headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var jsonData = json.decode(response.body);
    List<FavoriteCourses> favoritecourses= [];
    for (var course in jsonData["payload"]){
      favoritecourses.add(FavoriteCourses.fromJson(course));
    }
    return favoritecourses;
  }
  Future<StatusFavorite> StatusFavoriteCourse(String id,String token)async{
    final url = "https://api.letstudy.org/user/get-course-like-status/$id";
    StatusFavorite coursesFavorite;
    final response = await http.get(Uri.parse(url),headers: {

      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    final jsonData = json.decode(response.body);
    coursesFavorite = StatusFavorite.fromJson(jsonData);
    return coursesFavorite;
  }
  Future<CourseWithLessons> fetchCourseWithLesson(String id,String token) async{
    final url= "https://api.letstudy.org/course/detail-with-lesson/"+ id;
    CourseWithLessons courseWithLessons;
    final response = await http.get(Uri.parse(url),headers: {

      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var jsonData = json.decode(response.body);
    var dataCourse = jsonData["payload"];
    courseWithLessons = CourseWithLessons.fromJson(dataCourse);
    return courseWithLessons;

  }

}

