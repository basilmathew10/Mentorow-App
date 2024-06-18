// ignore_for_file: unused_import

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:mentor/course.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Course {
  String courseName;
  String description;
  String duration;
  int price;
  String courseCurriculum;

  Course({
    required this.courseName,
    required this.description,
    required this.duration,
    required this.price,
    required this.courseCurriculum,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      courseName: json["courseName"] ?? "",
      description: json["description"] ?? "",
      duration: json["duration"] ?? "",
      price: json["price"] ?? 0,
      courseCurriculum: json["courseCurriculum"] ?? "",
    );
  }
}

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  late Future<List<Course>> futureCourses;

  @override
  void initState() {
    super.initState();
    futureCourses = fetchCourses();
  }

  Future<List<Course>> fetchCourses() async {
    final response =
        await http.get(Uri.parse('https://mentorow.onrender.com/api/course/AllCourse'));

    if (response.statusCode == 200) {
      List<dynamic> coursesJson = jsonDecode(response.body)['courses'];
      List<Course> courses = coursesJson.map((json) => Course.fromJson(json)).toList();
      return courses;
    } else {
      throw Exception('Failed to load courses');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Details'),
      ),
      body: Center(
        child: FutureBuilder<List<Course>>(
          future: futureCourses,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  Course course = snapshot.data![index];
                  return ListTile(
                    title: Text(course.courseName),
                    subtitle: Text(course.description),
                    trailing: Text('\$${course.price.toString()}'),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
