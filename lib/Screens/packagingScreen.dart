import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:laundaryapp/Screens/personalizedcardscreen.dart';
import 'package:laundaryapp/Widgets/ElevatedButton.dart';
import 'package:laundaryapp/Widgets/appBarCustom.dart';

class Packagingscreen extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xFFF7F3EE),
      body: SafeArea(
        child: Column(
          children: [
            Appbarcustom(),
            Padding(
              padding: const EdgeInsets.only(left: 14,top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: Icon(Icons.arrow_back)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15,top: 22),
              child: const Text("How Would You Like Us To\n Package Your Garments",textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Color(0xFFd4AF37))),
            ),
            cards(maintext: "Plastic Wrap", text: "Clean and simple wrap,\ntransparent protection.",
            image: Image(image: AssetImage("assets/images/plastic.png"),fit: BoxFit.cover,height: 78,width: 87,)),
            cards(maintext: "Luxury Fabric Wrap", text: "Hidden, soft-touch\nwrapping with luxurious \ntexture.",
            image: Image(image: AssetImage("assets/images/luxury.png"),fit: BoxFit.cover,height: 78,width: 87,)),
            cards(maintext: "Premium Box", text: "Elegant gift box with \nmagnetic closure and\nscent-preserving lining.",
            image: Image(image: AssetImage("assets/images/premiumbox.png"),fit: BoxFit.cover,height: 78,width: 87,)),
            Padding(
              padding: const EdgeInsets.only(left: 25,right: 25,top: 20,),
              child: elevatedButton(text: "Confirm & Continue", page: Personalizedcardscreen()),
            )
          ],
        ),
      ),
    );
  }
}


   Widget cards({
    required String maintext,
    required String text,
    required Widget image,
   }){
    return Padding(
      padding: const EdgeInsets.only(left: 25,right: 25,top: 6),
      child: Card(
        elevation: 4,
        clipBehavior: Clip.antiAlias,
        shadowColor: Colors.grey,
        child: Container(
          width: double.infinity,
          height: 97,
          color: Colors.white,
          padding: const EdgeInsets.only(bottom: 2),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: image,
              ),
              Gap(20),
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(maintext,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,),),
                    Text(text,style: TextStyle(fontSize: 12),)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
   }