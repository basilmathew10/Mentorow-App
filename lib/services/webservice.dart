import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:mentorow_app/models/all_mentordetails_model.dart';
import 'package:mentorow_app/models/allcourse_model.dart';
import 'package:mentorow_app/models/course_model.dart';

class Webservice {
  static const mainurl = "https://mentorow.onrender.com/api/";
  List<AllCourseModel> items = [];
  Future<List<AllCourseModel>?> fetchAllCourses() async{
    try{
      final response = await http.get(Uri.parse("${mainurl}course/AllCourse"));
      log("response == $response");
      if(response.statusCode == 200){
         final jsonResponse = jsonDecode(response.body);
        if (jsonResponse.containsKey('courses')) {
          final jsonArray = jsonResponse['courses'] as List<dynamic>;
          items = jsonArray.map((itemJson) => AllCourseModel.fromJson(itemJson)).toList();
          return items;
          }
        } else{
        throw Exception("Failed to load courses");
      } 
    } catch (e){
      log(e.toString());
    }
    return null;
  }
  Future<List<AllMentorModel>> fetchMentors() async {
    final response = await http.get(Uri.parse('${mainurl}mentor/AllMentors'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((mentorData) => AllMentorModel.fromJson(mentorData)).toList();
    } else {
      throw Exception('Failed to load mentors');
    }
}

Future<CourseModel?> fetchCourseDetails(String courseId) async {
  final response = await http.get(Uri.parse('${mainurl}course/singleCourse/$courseId'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    return CourseModel.fromJson(data['course']);
  } else {
    throw Exception('Failed to load course details');
  }
}
}