import 'package:flutter/material.dart';
import 'package:laundaryapp/Screens/signupscreen.dart';
import 'package:laundaryapp/Widgets/ElevatedButton.dart';
import 'package:laundaryapp/Widgets/appBarCustom.dart';

class Akoyaclubscreen extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xFFF7F3EE),
      body: SafeArea(
        child: Column(
          children: [
            Appbarcustom(),
            Padding(
              padding: const EdgeInsets.only(left: 14,top: 12,bottom: 14),
              child: Row(
                children: [
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: Icon(Icons.arrow_back)),
                  const Text("Akoya Club",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700))
                ],
              ),
            ),
            const Text("For The Few Who Know",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Color(0xFFD4AF37))),
            const Text("Become a privileged member to access a\n range of exclusive vip perks.",textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500)),
            Padding(
              padding: const EdgeInsets.all(25),
              child: elevatedButton(text: "Join Now", page: Signupscreen()),
            )
          ],
        ),
      ),
    );
  }
}