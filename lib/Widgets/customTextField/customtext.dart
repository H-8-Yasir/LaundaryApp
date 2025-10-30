    import 'package:flutter/material.dart';

   Widget customText(String text){
    return Padding(
               padding: const EdgeInsets.only(left: 12),
               child: Row( 
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                       SelectableText(text,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                       showCursor: true,
         cursorColor: Colors.red,
  cursorWidth: 2,
  cursorRadius: Radius.circular(2),
  toolbarOptions: ToolbarOptions(
    copy: true,
    cut: true,
    paste: true,
    selectAll: true,))
                    ],
                  ),
    );
   }