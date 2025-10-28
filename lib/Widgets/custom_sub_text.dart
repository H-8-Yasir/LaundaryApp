import 'package:flutter/material.dart';

Widget customsubtext(String text){
  return Padding(
    padding: const EdgeInsets.only(left: 22,right: 22),
    child: Text(
      text,style: TextStyle(
        fontWeight: FontWeight.w400,fontSize: 12,
      ),
      textAlign: TextAlign.center,
    ),
  );
}