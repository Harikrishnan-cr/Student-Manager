

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class EditDeleteIcons extends StatelessWidget {
  final IconData editDltIcon;
  final Function editDltFunction;
  final Color editDltIconColor; 
  const EditDeleteIcons({Key? key,required this.editDltIcon,required this.editDltFunction,required this.editDltIconColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () => editDltFunction, icon: Icon(editDltIcon,color: editDltIconColor,));
  }
}