import 'package:flutter/material.dart';
import 'package:laundaryapp/Screens/ReviewScreen.dart';
import 'package:laundaryapp/Screens/homescreen.dart';
import 'package:laundaryapp/Screens/packagingScreen.dart';
import 'package:laundaryapp/Screens/virtualAssistant.dart';
import 'package:laundaryapp/Widgets/ElevatedButton.dart';
import 'package:laundaryapp/Widgets/appBarCustom.dart';

class Pickupschedule extends StatelessWidget{
  Widget build(BuildContext  context){
    return Scaffold(
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
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Virtualassistant()));
                    }, icon: Icon(Icons.arrow_back)),
                    IconButton(onPressed: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=> Reviewscreen()));
                    }, icon: Icon(Icons.arrow_forward))
                  ],
                ),
              ),
              const Text("How It Work",textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Color(0xFFD4AF37))),
              const Text("From pickup to doorstep delivery, here’s\n how Akoya makes it seamless.",textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500)),
              SizedBox(height: 8),
              cards(maintext: "Shedule Pickup", text: "Choose time & location \nthat suits you.", 
              image: Image(image: AssetImage("assets/images/location.png"))),
              cards(maintext: "Shedule Pickup", text: "Choose time & location \nthat suits you.", 
              image: Image(image: AssetImage("assets/images/shirt2.png"))),
              cards(maintext: "Shedule Pickup", text: "Choose time & location \nthat suits you.", 
              image: Image(image: AssetImage("assets/images/drops.png"))),
              cards(maintext: "Shedule Pickup", text: "Choose time & location \nthat suits you.", 
              image: Image(image: AssetImage("assets/images/home.png"))),
              Padding(
                padding: const EdgeInsets.only(left: 25,right: 25,top: 28),
                child: elevatedButton(text: "Schedule a pickup", page: HomeScreen()),
              )
            ],
          ),
        )
        ),
    );
  }
}