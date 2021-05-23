import 'dart:io';

import 'package:flutter_app/model/comment/comment_model.dart';
import 'package:flutter_app/model/courses/course_favorite.dart';
import 'package:flutter_app/model/courses/course_favorite.dart';
import 'package:flutter_app/model/courses/course_favorite.dart';
import 'package:flutter_app/model/courses/course_withlesson.dart';
import 'package:flutter_app/model/courses/courses_model.dart';
import 'package:flutter_app/model/video/videoModel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/model/courses/course_detail.dart';
import 'package:flutter_app/model/search/search_model.dart';
import'dart:convert';


class ApiProductService {
  Future<List<Courses>> fetchCourses() async {
    final String url = "https://api.letstudy.org/course/top-new";
    List<Courses> courses = [];
    int a = 1;
    while(true){
      String b= a.toString();
      var data = await http.post(Uri.parse(url),
          body: {"limit": "10", "page": b}
      );
      var jsonData = json.decode(data.body);
      if(jsonData["payload"].isEmpty){
        break;
      }
      for (var joke in jsonData["payload"]) {
        courses.add(Courses.fromJson(joke));
      }
      a++;
    }

    return courses;
  }

  Future<List<Courses>> fetchTrendingCourses() async {
    final String url = "https://api.letstudy.org/course/top-rate";
    List<Courses> courses = [];
    int a = 1;
    while(true){
      String b= a.toString();
      var data = await http.post(Uri.parse(url),
          body: {"limit": "10", "page": b}
      );
      var jsonData = json.decode(data.body);
      if(jsonData["payload"].isEmpty){
        break;
      }
      for (var joke in jsonData["payload"]) {
        courses.add(Courses.fromJson(joke));
      }
      a++;
    }
    return courses;
  }

  Future<CourseWithLessons> fetchCourseDetail(String id) async {
    final String url = "https://api.letstudy.org/course/get-course-detail/$id/{userId}";
    final data = await http.get(Uri.parse(url));
    final jsonData = json.decode(data.body);
    var item = jsonData["payload"];
    CourseWithLessons courseDetail;
    courseDetail = CourseWithLessons.fromJson(item);
    return courseDetail;
  }
  Future<List<CoursesSuggestion>> fetchCourseSuggestions(String userId) async {
    String url="https://api.letstudy.org/user/recommend-course/$userId/10/1";
    List<CoursesSuggestion> courses = [];
    final data = await http.get(Uri.parse(url));
    var jsonData = json.decode(data.body);
    var dataCourses = jsonData["payload"];
    for(var course in dataCourses){
      courses.add(CoursesSuggestion.fromJson(course));
    }
    return courses;
  }
  static Future<void> LikeCourses(String token, String idCourse) async {
    final url = "https://api.letstudy.org/user/like-course";
    await http.post(Uri.parse(url), headers: {

      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    }, body: {"courseId": idCourse});
  }

  Future<List<FavoriteCourses>> FavoriteCoursesOfUser(String token) async {
    final url = "https://api.letstudy.org/user/get-favorite-courses";
    final response = await http.get(Uri.parse(url), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var jsonData = json.decode(response.body);
    List<FavoriteCourses> favoritecourses = [];
    for (var course in jsonData["payload"]) {
      favoritecourses.add(FavoriteCourses.fromJson(course));
    }
    return favoritecourses;
  }

  Future<StatusFavorite> StatusFavoriteCourse(String id, String token) async {
    final url = "https://api.letstudy.org/user/get-course-like-status/$id";
    StatusFavorite coursesFavorite;
    final response = await http.get(Uri.parse(url), headers: {

      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    final jsonData = json.decode(response.body);
    coursesFavorite = StatusFavorite.fromJson(jsonData);
    return coursesFavorite;
  }

  Future<CourseWithLessons> fetchCourseWithLesson(String id,
      String token) async {
    final url = "https://api.letstudy.org/course/detail-with-lesson/" + id;
    CourseWithLessons courseWithLessons;
    final response = await http.get(Uri.parse(url), headers: {

      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var jsonData = json.decode(response.body);
    var dataCourse = jsonData["payload"];
    courseWithLessons = CourseWithLessons.fromJson(dataCourse);
    return courseWithLessons;
  }

  Future<List<SearchData>> fetchCourseSearch(String keyword) async {
    final String url = "https://api.letstudy.org/course/search-bar";
    List<SearchData> list =[] ;
    final response = await http.post(Uri.parse(url),
        body: {"keyword":keyword});
    var jsonData = json.decode(response.body);
    var data = jsonData['payload'] ;
    var courses = data['courses'];
    var  a= courses['data'] ;

    for(var course in a){
      list.add(SearchData.fromJson(course));
    }
    return list;
  }
  Future<List<CommentModel>> fetchCommentofCourse(String courseId) async {
    final String url="https://api.letstudy.org/course/get-course-detail/$courseId/{userId}";
    List<CommentModel> list = [];
    final response =await http.get(Uri.parse(url));
    var jsonData = json.decode(response.body);
    var payload =jsonData["payload"];
    var listrating= payload["ratings"];
    for(var rating in listrating["ratingList"]){
      list.add(CommentModel.formJson(rating));
    }
    return list;
  }
  Future<http.Response> CommentToCouser(String token,String courseId,String content,int a) async {
    String url = "https://api.letstudy.org/course/rating-course";
    final response = await http.post(Uri.parse(url), headers: {
      'Authorization': 'Bearer $token',
    }, body: {'courseId': courseId,
      'formalityPoint': a,
      'contentPoint': a,
      'presentationPoint': a,
      "content": content
    });
    return response;
  }
  Future<VideoModel> fetchVideo(String token,String courseId,String lessonId) async{
    String url= "https://api.letstudy.org/lesson/detail/$courseId/$lessonId";
    VideoModel video;
    final response = await http.get(Uri.parse(url),headers: {
    'Authorization': 'Bearer $token'});
    var jsonData = json.decode(response.body);
    var data = jsonData["payload"];
    video = VideoModel.fromJson(data);
    return video;
  }
  Future<VideoUrl> fetchVideoUrl(String token,String courseId,String lessonId) async{
    String url= "https://api.letstudy.org/lesson/video/$courseId/$lessonId";
    VideoUrl video;
    final response = await http.get(Uri.parse(url),headers: {
      'Authorization': 'Bearer $token'});
    var jsonData = json.decode(response.body);
    var data = jsonData["payload"];
    video = VideoUrl.fromJson(data);
    return video;
  }


}



