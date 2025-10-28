import 'package:flutter/material.dart';

Widget textField({required String text}){
  return Container(
    width: double.infinity,
    height: 44,
    decoration: BoxDecoration(
      color: Colors.white,
       borderRadius: BorderRadius.circular(12),
    ),
    child: TextField(
      decoration: InputDecoration(
        label: Text(text),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
        )
      ),
    ),
  );
}