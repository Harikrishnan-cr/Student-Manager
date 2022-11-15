// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_database/controller/studentdata%20getx/studentdata_getx.dart';
import 'package:student_database/core/colors/colour_const.dart';
import 'package:student_database/main.dart';

import 'package:student_database/model/student%20model/student_model.dart';
import 'package:student_database/view/common%20widgets/bottom%20sheet/bottom_sheet.dart';
import 'package:student_database/view/common%20widgets/snack%20bar/snack_bar_screen.dart';

class EditScreen extends StatelessWidget {
  int index;
  EditScreen({Key? key, required this.index, this.image}) : super(key: key);

  final StudentController studcontroller = Get.put(StudentController());

  final userupdateNamecontroller = TextEditingController();

  final userupdateAgecontroller = TextEditingController();

  final userupdatePhonecontroller = TextEditingController();

  final userupdateSchoolcontroller = TextEditingController();

  final File? image;

  @override
  Widget build(BuildContext context) {
    userupdateNamecontroller.text = studcontroller.studentList[index].studName;
    userupdateAgecontroller.text = studcontroller.studentList[index].studAge;
    userupdatePhonecontroller.text = studcontroller.studentList[index].studPhone;
    userupdateSchoolcontroller.text = studcontroller.studentList[index].studSchool;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Details'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: GetBuilder<StudentController>(
            init: StudentController(),
            builder: (StudentController updateData) {
              return ListView(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Center(
                    child: Text(
                      'Update Student Details',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Color.fromARGB(255, 145, 22, 13)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 190,
                    width: 150,
                    child: Stack(
                      clipBehavior: Clip.none,
                      fit: StackFit.expand,
                      children: [
                        CircleAvatar(
                          backgroundImage: stdController
                                      .pickedImage ==
                                  null
                              ? FileImage(File(updateData.studentList[index].studImg))
                              : FileImage(
                                  File(updateData.pickedImage!)),
                        ),
                        Positioned(
                            right: 100,
                            bottom: 0,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 25,
                              child: IconButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: ((ctx1) =>
                                          const ImageSelectPopUp()));
                                },
                                icon: const Icon(
                                  Icons.camera_alt,
                                  size: 30,
                                ),
                                color: Colors.teal,
                              ),
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: userupdateNamecontroller,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0))),
                        helperText: 'Name'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: userupdateAgecontroller,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0))),
                        helperText: 'Age'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: userupdatePhonecontroller,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0))),
                        helperText: 'Phone-Number'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: userupdateSchoolcontroller,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0))),
                        helperText: 'school'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 145, 22, 13)),
                      onPressed: () {
                        onUpdateButtonClick(context);
                      },
                      child: const Text(
                        'Update Details',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ))
                ],
              );
            }),
      ),
    );
  }

  void onUpdateButtonClick(ctx) async {
    final String imagefile = stdController.pickedImage ??
        stdController.studentList[index].studImg;
    final String schoolUp = userupdateSchoolcontroller.text;
    final String nameUp = userupdateNamecontroller.text;
    final String ageUp = userupdateAgecontroller.text;
    final String phoneUp = userupdatePhonecontroller.text;

    if (nameUp.isEmpty ||
        ageUp.isEmpty ||
        phoneUp.isEmpty ||
        schoolUp.isEmpty) {
      bottomSnack(ctx, 'All Fields Are requried', clearButtonColour);
    } else {
      final value = StudentModel(
          id: studcontroller.studentList[index].id,
          studName: nameUp,
          studAge: ageUp,
          studPhone: phoneUp,
          studSchool: schoolUp,
          studImg: imagefile);

      studcontroller.updateStudent(value, index);
      bottomSnack(ctx, 'Updated Succesfully', saveButtonColour);
      stdController.pickedImage = null;
      userupdateNamecontroller.clear();
      userupdateAgecontroller.clear();
      userupdateSchoolcontroller.clear();
      userupdatePhonecontroller.clear();

    }
  }
}
