  import 'package:flutter/material.dart';

     Widget customCircleAvatar(Widget? image,String text){
      return Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            child: image,
            radius: 25,
          ),
          Text(text,style: TextStyle(fontSize: 12,color: Colors.black))
        ],
      );
     }