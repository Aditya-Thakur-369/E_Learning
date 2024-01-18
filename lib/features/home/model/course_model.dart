// ignore_for_file: public_member_api_docs, sort_constructors_first
class CourseModel {
  String id;
  String status1;
  String status2;
  int days;
  String info;
  CourseModel({
    required this.id,
    required this.status1,
    required this.status2,
    required this.days,
    required this.info,
  });
}

class ClassModel {
  String topic;
  String status;
  String image;
  String name;
  String logo;
  ClassModel({
    required this.topic,
    required this.status,
    required this.image,
    required this.name,
    required this.logo,
  });
}
