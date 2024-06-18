
class AllMentorModel {
  final String id;
  final String name;
  final String areaOfExpertise;
  final String domain;
  final String linkedinUrl;
  final String photo;
  final DateTime createdAt;

  AllMentorModel({
    required this.id,
    required this.name,
    required this.areaOfExpertise,
    required this.domain,
    required this.linkedinUrl,
    required this.photo,
    required this.createdAt,
  });

  factory AllMentorModel.fromJson(Map<String, dynamic> json) {
    return AllMentorModel(
      id: json['_id'],
      name: json['name'],
      areaOfExpertise: json['areaOfExpertise'],
      domain: json['domain'],
      linkedinUrl: json['linkedinUrl'],
      photo: json['photo'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}