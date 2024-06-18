class CourseModel {
  final String id;
  final DateTime createdAt;
  final String courseName;
  final String description;
  final String duration;
  final double price;
  final String courseCurriculum;

  CourseModel({
    required this.id,
    required this.createdAt,
    required this.courseName,
    required this.description,
    required this.duration,
    required this.price,
    required this.courseCurriculum,
  });

 factory CourseModel.fromJson(Map<String, dynamic> json) {
  return CourseModel(
    id: json['_id'],
    createdAt: DateTime.parse(json['createdAt']),
    courseName: json['courseName'],
    description: json['description'],
    duration: json['duration'],
    price: json['price']?.toDouble() ?? 0.0, // Default to 0.0 if 'price' is null
    courseCurriculum: json['courseCurriculum'],
  );
}

}
