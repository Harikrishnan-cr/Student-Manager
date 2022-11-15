import 'dart:io';

import 'package:flutter/material.dart';
import 'package:student_database/core/colors/colour_const.dart';
import 'package:student_database/core/size/hight_width.dart';

import 'package:student_database/model/student%20model/student_model.dart';
import 'package:student_database/view/common%20widgets/appbar%20title/appbar_title.dart';

class StudentDetailsScreen extends StatelessWidget {
  final imageData;
  final StudentModel studentDetailList;

  const StudentDetailsScreen({
    Key? key,
    required this.imageData,
    required this.studentDetailList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
    
        title: Text(studentDetailList.studName),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          commonHeight10,
          Center(
            child: Container(
              width: size.width * 0.5,
              height: size.height * 0.35,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: imageData != 'assets/images/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg' ? 
                      FileImage(
                        File(
                          imageData,
                        ),
                      ) : const AssetImage('assets/images/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg') as ImageProvider,)),
                      
                      
                      //FileImage(File(imageData)) )),
            ),
          ),
          commonHeight10,
          Center(
              child: Text(
            studentDetailList.studName,
            style: appBarTitleStyle(),
          )),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                  color: studentDetailTileColour,    
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Age       :  ${studentDetailList.studAge}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'School',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    const Divider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                    Text(
                      studentDetailList.studSchool,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Phone',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    const Divider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                    Text(
                      studentDetailList.studPhone,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
