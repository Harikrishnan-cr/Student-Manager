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

class AddStudentDetailsScreen extends StatelessWidget {
  AddStudentDetailsScreen({Key? key}) : super(key: key);

  File? image;
  final userNamecontroller = TextEditingController();

  final userAgecontroller = TextEditingController();

  final userPhonecontroller = TextEditingController();

  final userSchoolcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Details'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 145, 22, 13),
      ),
      body: GetBuilder<StudentController>(
          init: StudentController(),
          builder: (StudentController data) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 18,
                  ),
                  const Center(
                    child: Text(
                      'Add New Student',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Color.fromARGB(255, 145, 22, 13)),
                    ),
                  ),

                  SizedBox(
                    height: 190,
                    width: 150,
                    child: Stack(
                      clipBehavior: Clip.none,
                      fit: StackFit.expand,
                      children: [
                        CircleAvatar(
                          backgroundImage: data.pickedImage != null
                              ? FileImage(File(data.pickedImage!))
                                  as ImageProvider
                              : const AssetImage(
                                  'assets/images/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg'),
                          backgroundColor: Colors.black,
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
                  // const SizedBox(height: 18,),
                  // CircleAvatar(
                  //   radius: 80,
                  //   backgroundImage: NetworkImage('https://t3.ftcdn.net/jpg/03/46/83/96/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg'),
                  //   child: IconButton(onPressed: (){

                  //   }, icon: const Icon(Icons.camera_alt),color: Colors.teal),
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: userNamecontroller,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0))),
                        hintText: 'Name',
                        labelText: 'Name'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: userAgecontroller,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0))),
                        hintText: 'Age',
                        labelText: 'Age'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: userPhonecontroller,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0))),
                        hintText: 'Phone Number',
                        labelText: 'Phone-Number'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: userSchoolcontroller,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0))),
                        hintText: 'School',
                        labelText: 'School'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: clearButtonColour),
                            onPressed: () {
                              onClearButtonClicked();
                              // clearPage();
                              // bottomSnack(context, "Cleared", Colors.red);
                            },
                            child: const Text(
                              'Clear Data',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            )),
                        TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: saveButtonColour),
                            onPressed: () {
                             
                              onAddButtonClick(context);
                            },
                            child: const Text(
                              'Save Data',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ))
                      ]),
                  const SizedBox(
                    height: 20,
                  ),

                  // TextButton(
                  //     style: TextButton.styleFrom(
                  //         backgroundColor: const Color.fromARGB(255, 145, 22, 13)),
                  //     onPressed: () {
                  //       // bottomSnack(
                  //       //       context, "All Fields Requred", Colors.red);
                  //       // onAddButtonClick();
                  //       // Navigator.of(context)
                  //       //     .pushReplacement(MaterialPageRoute(builder: (ctx) {
                  //       //   return const AddDetails();
                  //       // }));
                  //     },
                  //     child: const Text(
                  //       'Save Data',
                  //       style: TextStyle(
                  //         color: Colors.white,
                  //         fontWeight: FontWeight.bold,
                  //         fontSize: 16,
                  //       ),
                  //     ))
                ],
              ),
            );
          }),
    );
  }

//--------------------functions -----------------------------------------

  void onAddButtonClick(ctx) async {
    final String image = stdController.pickedImage ??
        'assets/images/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg';
    final String name = userNamecontroller.text.trim();
    final String age = userAgecontroller.text.trim();
    final String number = userPhonecontroller.text.trim();
     final String schoolsdata = userSchoolcontroller.text.trim();
    // final image = imagefile;
    if (name.isEmpty || age.isEmpty || schoolsdata.isEmpty || number.isEmpty) {
      bottomSnack(ctx, 'All Fields Are requried', clearButtonColour);
    } else {
    //  log(schoolsdata);
      final StudentModel addStudentToDb = StudentModel(
          studName: name,
          studAge: age,
          studPhone: number,
          studSchool: schoolsdata,
          studImg: image);

          
stdController.addStudentList(
        addStudentToDb,
      );
      stdController.pickedImage = null;
      userNamecontroller.clear();
      userAgecontroller.clear();
      userSchoolcontroller.clear();
      userPhonecontroller.clear();
      
      bottomSnack(ctx, 'Data saved succesfully', saveButtonColour);
    }
  }

  void onClearButtonClicked() {
    userNamecontroller.clear();
    userAgecontroller.clear();
    userSchoolcontroller.clear();
    userPhonecontroller.clear();

    // Get.offAll(AddStudentDetailsScreen());
  }
}
