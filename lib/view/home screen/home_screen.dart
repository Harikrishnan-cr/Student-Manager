import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:student_database/controller/studentdata%20getx/studentdata_getx.dart';
import 'package:student_database/core/colors/colour_const.dart';

import 'package:student_database/view/add%20student/add_student_screen.dart';
import 'package:student_database/view/common%20widgets/appbar%20title/appbar_title.dart';
import 'package:student_database/view/common%20widgets/snack%20bar/snack_bar_screen.dart';

import 'package:student_database/view/edit%20screen/edit_screen.dart';
import 'package:student_database/view/search%20screen/search_screen.dart';
import 'package:student_database/view/student%20details/student_details.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final StudentController studentController = Get.put(StudentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Student Data',
          style: appBarTitleStyle(),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: SearchScreen(),
                );
              },
              icon: const Icon(Icons.search_rounded))
        ],
      ),
      body: Scaffold(
        body: GetBuilder<StudentController>(
            init: StudentController(),
            builder: (StudentController data) {
              return data.studentList.isNotEmpty
                  ? ListView.separated(
                      itemCount: data.studentList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          // subtitle: Text(data.list[index].id.toString()),
                          title: Text(data.studentList[index].studName),
                          leading: CircleAvatar(
                            backgroundColor: Colors.black,
                            backgroundImage: data.studentList[index].studImg !=
                                    'assets/images/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg'
                                ? FileImage(
                                    File(
                                      data.studentList[index].studImg,
                                    ),
                                  )
                                : const AssetImage(
                                        'assets/images/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg')
                                    as ImageProvider,
                          ),
                          trailing: SizedBox(
                            width: 115,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) => EditScreen(
                                          index: index,
                                        ),
                                      ));
                                    },
                                    icon: const Icon(
                                      Icons.edit,
                                      color: Color.fromARGB(200, 40, 102, 153),
                                    )),
                                IconButton(
                                    onPressed: () {
                                      Get.defaultDialog(
                                        title: 'Delete',
                                        middleText:
                                            'Do you want to delet ${data.studentList[index].studName}',
                                        middleTextStyle: const TextStyle(
                                            fontWeight: FontWeight.w500),
                                        onConfirm: () {
                                          data.deleteStudent(
                                            data.studentList[index].id!,
                                            index,
                                          );
                                          Get.back();
                                          bottomSnack(context, 'Deleted',
                                              clearButtonColour);
                                        },
                                        onCancel: () {
                                          Get.back();
                                          // Get.offAll(HomeScreen());
                                          // Navigator.of(context).pop();
                                        },
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Color.fromARGB(163, 191, 44, 34),
                                    )),
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => StudentDetailsScreen(
                                  imageData: data.studentList[index].studImg,
                                  studentDetailList:
                                      studentController.studentList[index]),
                            ));
                          },
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                    )
                  : Center(
                      child: Text(
                      'No Data Found',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: appBarColour,
                          fontSize: 25),
                    ));
            }),
      ),
      floatingActionButton: FloatingActionButton(
        isExtended: true,
        elevation: 0,
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddStudentDetailsScreen(),
          ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
