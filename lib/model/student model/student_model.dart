import 'package:hive_flutter/adapters.dart';
part 'student_model.g.dart'; 

@HiveType(typeId: 0)
class StudentModel {
  @HiveField(0)
  int? id;
   @HiveField(1)
  final String studName;
   @HiveField(2)
  final String studAge;
   @HiveField(3)
  final String studPhone;
   @HiveField(4)
  final String studSchool;
   @HiveField(5)
  final String studImg;

  StudentModel(
  {required this.studName, 
  required this.studAge, 
  required this.studPhone, 
  required this.studSchool,
  required this.studImg,
  this.id
  });
}



