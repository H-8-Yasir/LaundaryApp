import 'package:flutter/material.dart';

   class customContainer extends StatefulWidget{

    final String text;
    final String assetPath;
    final Color? color;
    final double width;

  customContainer({super.key,
  required this.text,required this.assetPath,this.color,required this.width});


  @override
  State<customContainer> createState() => _customContainerState();
}

class _customContainerState extends State<customContainer> {
    Widget build(BuildContext context){
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: Color(0xFFD4AF37),
              width: widget.width
            )
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 2,
              blurRadius: 8,
              offset: Offset(0, 4)
            )
          ]
        ),
        child: Material(
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.text,style: TextStyle(color: widget.color)),
              Image(image: AssetImage(widget.assetPath)),
            ],
          ),
        ),
      );
    }
}