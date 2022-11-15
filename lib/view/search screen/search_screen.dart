// ignore_for_file: prefer_is_empty

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_database/controller/studentdata%20getx/studentdata_getx.dart';
import 'package:student_database/core/colors/colour_const.dart';
import 'package:student_database/model/student%20model/student_model.dart';

import 'package:student_database/view/student%20details/student_details.dart';

class SearchScreen extends SearchDelegate {
  final StudentController studcontroller = Get.put(StudentController());
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<StudentModel> searchedSuggestionList = studcontroller.studentList
        .where(
          (StudentModel element) => element.studName.toLowerCase().contains(
                query.toLowerCase(),
              ),
        )
        .toList();

    return searchedSuggestionList.length > 0
        ? ListView.separated(
            itemCount: searchedSuggestionList.length,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(height: 0, color: Colors.white),
            itemBuilder: (BuildContext context, int index) {
              final listData = searchedSuggestionList[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: studentDetailTileColour,
                      borderRadius: BorderRadius.circular(15)),
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(builder: (ctx) {
                        return StudentDetailsScreen(
                            imageData: listData.studImg,
                            studentDetailList: listData);
                      }));
                    },
                    leading: CircleAvatar(
                      backgroundImage: FileImage(File(listData.studImg)),
                    ),
                    title: Text(listData.studName),
                  ),
                ),
              );
            })
        : Center(
            child: Text(
            'No Data Found',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: appBarColour, fontSize: 25),
          ));
  }
}




















// subtitle: Text(listData.studAge),
                // trailing: SizedBox(
                //         width: 115,
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.end,
                //           children: [
                //             IconButton(
                //                 onPressed: () {
                //                   Navigator.of(context).push(MaterialPageRoute(
                //                     builder: (context) => EditScreen(
                //                       index: index,
                //                     ),
                //                   ));
                //                 },
                //                 icon: const Icon(
                //                   Icons.edit,
                //                   color: Color.fromARGB(200, 40, 102, 153),
                //                 )),
                //             IconButton(
                //                 onPressed: () {
                //                   studcontroller.deleteStudent(
                //                     listData.id!,
                //                     index,
                //                   );

                //                 },
                //                 icon: const Icon(
                //                   Icons.delete,
                //                   color: Color.fromARGB(163, 191, 44, 34),
                //                 )),
                //           ],
                //         ),
                //       ),

                // IconButton(
                //   onPressed: () {
                //     if (listData.id != null) {
                //       deletStudent(listData.id!);
                //   bottomSnack(
                //       context, "Successfully Deleted", Colors.green);
                // }
                //     Navigator.pop(context);
                //   },
                //   icon: const Icon(Icons.delete),
                //   color: Colors.red,
                // ),