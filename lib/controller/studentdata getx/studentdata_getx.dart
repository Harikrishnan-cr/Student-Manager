import 'dart:developer';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_database/main.dart';
import 'package:student_database/model/student%20model/student_model.dart';

class StudentController extends GetxController {
  @override
  void onReady() {
    studentList.clear();
    studentList.addAll(studentDb.values);
    update();
    log('On Ready called');
    super.onReady();
  }

  String? pickedImage;
  List<StudentModel> studentList = <StudentModel>[];

  Future<void> getCamera() async {
    final XFile? images =
        await ImagePicker().pickImage(source: ImageSource.camera);

    pickedImage = images!.path;
    update();
  }

  Future<void> getGallery() async {
    final XFile? images =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    pickedImage = images!.path;

    update();
  }

  Future<void> addStudentList(StudentModel data) async {
    final int id = await studentDb.add(data);
    final StudentModel studentdata = StudentModel(
        id: id,
        studName: data.studName,
        studAge: data.studAge,
        studPhone: data.studPhone,
        studSchool: data.studSchool,
        studImg: data.studImg);

    await studentDb.put(id, studentdata);
    studentList.add(studentdata);
    update();
  }

  void deleteStudent(int id, int index) {
    studentDb.delete(id);
    studentList.removeAt(index);
    update();
  }

  Future<void> updateStudent(StudentModel editStudent, int index) async {
    await studentDb.put(stdController.studentList[index].id, editStudent);
    studentList.removeAt(index);
    studentList.insert(index, editStudent);
    update();
  }
}
