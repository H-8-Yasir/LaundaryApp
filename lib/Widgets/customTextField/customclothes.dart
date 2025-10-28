import 'package:flutter/material.dart';

  class Customclothes extends StatefulWidget{
    final String name;
    final String imagePath;
    final double number;

  const Customclothes({super.key,required this.name,required this.imagePath,required this.number});
  @override
  State<Customclothes> createState() => _CustomclothesState();
}

class _CustomclothesState extends State<Customclothes> {
    Widget build(BuildContext context){
      return Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top:10),
        child: Container(
                    height: 55,
                    decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                     boxShadow: [
                       BoxShadow(
                           color: Colors.grey.withOpacity(0.4),
                             spreadRadius: 2,
                              blurRadius: 8,
                            offset: Offset(0, 4)
                          )
                          ],
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8,right: 6,top: 6,bottom: 4),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image(image: AssetImage(widget.imagePath),width: 30,height: 30,),
                                    SizedBox(width: 5),
                                    Text(widget.name,style: TextStyle(
                                      fontSize: 20
                                    ),),
                                      ],
                                    ),
                              Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                      height:20,width:20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),color: Color(0xFFD4AF37)
                                    ),
                                    child: Text("-",textAlign: TextAlign.center,style: TextStyle(
                                      color: Colors.white
                                    ),),
                                    ),
                                    SizedBox(width: 8),
                                    Container(height:20,width:20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),color: Color(0xFFD4AF37)
                                    ),
                                    child: Text(widget.number.toString(),textAlign: TextAlign.center,style: TextStyle(color: Colors.white)),),
                                    SizedBox(width: 8),
                                   Container(
                                      height:20,width:20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),color: Color(0xFFD4AF37)
                                    ),
                                    child: Text("+",textAlign: TextAlign.center,style: TextStyle(
                                      color: Colors.white
                                    ),),
                                    )
                                      ],
                                    )  
                                  ],
                                ),
                              ),
                            ),
                          ),
      );
    }
}