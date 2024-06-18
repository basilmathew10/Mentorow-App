class AllCourseModel{
  int? id;
  String? course;
  String? description;
  String? duration;
  String? price;
  String? curriculam;
  AllCourseModel({
    this.id,
    this.course,
    this.description,
    this.duration,
    this.price,
    this.curriculam
  });
  factory AllCourseModel.fromJson(Map<String, dynamic> json) => AllCourseModel(
    id: json["id"],
    course: json["courseName"],
    description: json["description"],
    duration: json["duration"],
    price: json["price"],
    curriculam: json["courseCurriculam"]
  );
}