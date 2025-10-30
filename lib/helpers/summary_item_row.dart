import 'package:flutter/material.dart';
import 'package:laundaryapp/classes/garmentitem.dart';

class SummaryItemRow extends StatelessWidget{
  final Garmentitem item;

  const SummaryItemRow({required this.item});
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 8),
      child: Container(
        height: 44,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              blurRadius: 8,
              spreadRadius: 2,
              offset: Offset(0, 4)
            )
          ]
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
                    Image(image: AssetImage(item.imagePath),width: 30,height: 30,fit: BoxFit.contain),
                    SizedBox(width: 10),
                    Text(item.name,style: TextStyle(fontSize: 20))
                  ],
                ),
                Container(
              height: 25,
              width: 25,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(0xFFD4AF37), // Your gold color
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                '${item.quantity}',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}