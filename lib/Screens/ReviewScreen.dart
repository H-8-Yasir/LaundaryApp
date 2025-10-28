import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:laundaryapp/Screens/akoyaclubScreen.dart';
import 'package:laundaryapp/Widgets/appBarCustom.dart';

class Reviewscreen extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xFFF7F3EE),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Appbarcustom(),
               Padding(
                padding: const EdgeInsets.all(14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon: Icon(Icons.arrow_back)),
                    IconButton(onPressed: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=> Akoyaclubscreen()));
                    }, icon: Icon(Icons.arrow_forward))
                  ],
                ),
              ),
              const Text("Loved by Doha's Finest",textAlign: TextAlign.center,style: TextStyle(
                color: Color(0xFFD4AF37),fontSize: 18,fontWeight: FontWeight.w600
              ),),
              Gap(5),
              const Text(" Hear what our elite clients say about the\n Akoya experience.",textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500)),
              Padding(
                padding: const EdgeInsets.only(left: 25,top: 14),
                child: Row(
                  children: [
                    const Text("Reviews : 74",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500)),
                    Gap(4),
                    Icon(Icons.star,size: 16,color: Color(0xFFD4AF37)),
                    Icon(Icons.star,size: 16,color: Color(0xFFD4AF37)),
                    Icon(Icons.star,size: 16,color: Color(0xFFD4AF37)),
                    Icon(Icons.star,size: 16,color: Color(0xFFD4AF37)),
                    Icon(Icons.star_outline,size: 16,color: Color(0xFFD4AF37))
                  ],
                ),
              ),
              reviewCard(title: "Sheikha Al-Thani", subtitle: "UI Designer", 
              text: "Akoya's attention to detail is unmatched. The only service I trust with my collection.\"", 
              assetPath: "assets/images/review1.png", trailing: "3.0"),
              reviewCard(title: "Mr.Khalid Al-Mansoori", subtitle: "Executive Director", 
              text: "As someone who wears bespoke suits daily, Akoya's executive service saves hours each week.", 
              assetPath: "assets/images/review2.png", trailing: "4.0"),
              reviewCard(title: "Mrs.Eleanor Rutherrford", subtitle: "Diplomat's Wife", 
              text: "The fragrance infusion option is divine. My clothes return smelling like a Parisian boutique.", 
              assetPath: "assets/images/review3.png", trailing: "5.0")
            ],
          ),
        ),
      ),
    );
  }
}

Widget reviewCard(
  {required String title,
  required String subtitle,
  required String text,
  required String assetPath,
  required String trailing,
  }
){
  return Padding(
    padding: const EdgeInsets.only(left: 25,right: 24,top: 14),
    child: Container(
      height: 113,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white
      ),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 8,
                children: [
                CircleAvatar(backgroundImage: AssetImage(assetPath),radius: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
              Text(subtitle,style: TextStyle(color: Color(0xFFD4AF37))),
                ],
              ),
              ],),
              Row(
              children: [
                Icon(Icons.star,color: Color(0xFFD4AF37),size: 16),
                Gap(4),
                Text(trailing)
              ],
            ),
            ]
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14,top: 2,right: 8),
            child: Text(text,textAlign: TextAlign.start,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400)),
          )
        ],
      ),
    ),
  );
}