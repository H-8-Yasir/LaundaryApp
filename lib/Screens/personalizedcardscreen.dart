import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:laundaryapp/Screens/OrderSummaryScreen.dart';
import 'package:laundaryapp/Widgets/ElevatedButton.dart';
import 'package:laundaryapp/Widgets/appBarCustom.dart';
import 'package:laundaryapp/Widgets/textfieldcustom.dart';

class Personalizedcardscreen extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xFFF7F3EE),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
             Appbarcustom(),
              Gap(12),
              Padding(
                padding: const EdgeInsets.only(left: 14,top: 12,bottom: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon: Icon(Icons.arrow_back)),
                  ],
                ),
              ),
              Gap(12),
              const Text("Personalized Card",textAlign: TextAlign.center,style: TextStyle(
                fontWeight: FontWeight.w600,fontSize: 22,color: Color(0xFFD4AF37)
              ),),
              Gap(4),
              const Text("Want to include a card with your name or\n dedicate it to someone?",textAlign: TextAlign.center),
              Padding(
                padding: const EdgeInsets.only(left: 25,right: 25,top: 20),
                child: Column(
                  children: [
                    textField(text: "From"),
                    Gap(12),
                    textField(text: "To"),
                ],),
              ),
              Padding(
                padding: const EdgeInsets.all(25),
                child: elevatedButton(text: "Confirm & Continue", page: Ordersummaryscreen()),
              )
            ],
          ),
        ),
      ),
    );
  }
  }