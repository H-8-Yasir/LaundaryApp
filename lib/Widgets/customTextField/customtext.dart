    import 'package:flutter/material.dart';

   Widget customText(String text){
    return Padding(
               padding: const EdgeInsets.only(left: 12),
               child: Row( 
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                       Text(text,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)
                    ],
                  ),
    );
   }