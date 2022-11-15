import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_database/controller/studentdata%20getx/studentdata_getx.dart';

class ImageSelectPopUp extends StatelessWidget {
  const ImageSelectPopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      // width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          const Text(
            'Choose your Profile Photo',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              TextButton.icon(
                  onPressed: () {
                    Get.find<StudentController>().getCamera();
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.camera,
                    color: Color.fromARGB(211, 151, 6, 6),
                  ),
                  label: const Text(
                    'Camera',
                    style: TextStyle(color: Colors.black),
                  )),
              TextButton.icon(
                  onPressed: () {
                    Get.find<StudentController>().getGallery();
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.image,
                    color: Color.fromARGB(211, 151, 6, 6),
                  ),
                  label: const Text('Galary',
                      style: TextStyle(color: Colors.black))),
            ],
          )
        ],
      ),
    );
  }
}






// Widget bottomPopUp() {
//     return Container(
//       height: 100,
//       // width: MediaQuery.of(context).size.width,
//       margin: const EdgeInsets.symmetric(
//         horizontal: 20,
//         vertical: 20,
//       ),
//       child: Column(
//         children: [
//           const Text(
//             'Choose your Profile Photo',
//             style: TextStyle(fontSize: 20),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           Row(
//             children: [
//               TextButton.icon(
//                   onPressed: () {
//                     // imageGalary();
//                   },
//                   icon: const Icon(
//                     Icons.camera,
//                     color: Color.fromARGB(211, 151, 6, 6),
//                   ),
//                   label: const Text(
//                     'Camera',
//                     style: TextStyle(color: Colors.black),
//                   )),
//               TextButton.icon(
//                   onPressed: () {
//                     // imageCamera();
//                   },
//                   icon: const Icon(
//                     Icons.image,
//                     color: Color.fromARGB(211, 151, 6, 6),
//                   ),
//                   label: const Text('Galary',
//                       style: TextStyle(color: Colors.black))),
//             ],
//           )
//         ],
//       ),
//     );
//   }