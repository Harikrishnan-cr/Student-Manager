import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:student_database/controller/studentdata%20getx/studentdata_getx.dart';
import 'package:student_database/core/colors/colour_const.dart';

import 'package:student_database/model/student%20model/student_model.dart';

import 'package:student_database/view/splash%20screen/splash_screen.dart';

late Box<StudentModel> studentDb;
final StudentController stdController = Get.put(StudentController());

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
    Hive.registerAdapter(StudentModelAdapter());
  }
  // Hive.registerAdapter(StudentModelAdapter());
  studentDb = await Hive.openBox<StudentModel>('student');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          canvasColor: canvasColour,
          appBarTheme: AppBarTheme(color: appBarColour)),
      home: const SplashScreen(),
    );
  }
}
