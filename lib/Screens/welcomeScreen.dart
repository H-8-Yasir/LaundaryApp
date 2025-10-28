   import 'package:flutter/material.dart';
import 'package:laundaryapp/Screens/signupscreen.dart';
import 'package:laundaryapp/Widgets/ElevatedButton.dart';
import 'package:laundaryapp/Widgets/custom_sub_text.dart';

class WelcomeScreen extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xFFF7F3EE),
      body: SafeArea(
        child: Column(
           children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      image: DecorationImage(
                        image: AssetImage("assets/images/eff53e786c3899a632416ae66dbc55776e4a2732.png"),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                )),
              Padding(
                padding: const EdgeInsets.only(left: 22,right: 22),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 32),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                          ),
                          children: [
                            TextSpan(
                              text: "Welcome to "
                            ),
                            TextSpan(
                              text: "The Akoya\n",
                              style: TextStyle(color: Color(0xFFD4AF37))
                            ),
                            TextSpan(text: "Collection")
                          ]
                        ),
                      ),
                    ),
                    customsubtext("Welcome to The Akoya Collection — where every garment is treated with luxury, care, and precision")
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25),
                child: elevatedButton(text: "Let's get started",page: Signupscreen(),)
              )
           ],
        ),
      ),
    );
  }
}