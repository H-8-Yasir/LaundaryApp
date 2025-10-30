import 'package:flutter/material.dart';

Widget customsubtext(String text){
  return Padding(
    padding: const EdgeInsets.only(left: 22,right: 22),
    child: SelectableText(
      text,style: TextStyle(
        fontWeight: FontWeight.w400,fontSize: 12,
      ),
      textAlign: TextAlign.center,
      showCursor: true,
  cursorColor: Colors.red,
  cursorWidth: 2,
  cursorRadius: Radius.circular(2),
  toolbarOptions: ToolbarOptions(
    copy: true,
    cut: true,
    paste: true,
    selectAll: true,
    ),
  ));
}