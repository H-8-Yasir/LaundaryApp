import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:laundaryapp/Screens/homescreen.dart';
import 'package:laundaryapp/Screens/pickupSchedule.dart';
import 'package:laundaryapp/Widgets/ElevatedButton.dart';
import 'package:laundaryapp/Widgets/appBarCustom.dart';
import 'package:laundaryapp/bar/bottomBar.dart';

class Virtualassistant extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xFFF7F3EE),
      body: SafeArea(
        child: Column(
          children: [
            Appbarcustom(),
            Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BottomBar()));
                  }, icon: Icon(Icons.arrow_back)),
                  IconButton(onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=> Pickupschedule()));
                  }, icon: Icon(Icons.arrow_forward))
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Your Akoya Assistant",textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFFD4AF37),fontSize: 18,fontWeight: FontWeight.w600)),
                Gap(8),
                Container(
                  height: 22,
                  width: 22,
                  decoration: BoxDecoration(
                    color: Color(0xFFD4AF37),
                    borderRadius: BorderRadius.circular(22)
                  ),
                  child: Image(image: AssetImage("assets/images/chat.png"),height: 13.2,width: 13.2),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25,right: 25,top: 25),
              child: Row(
                children: [
                  Image(image: AssetImage("assets/images/assistant.png"),height: 120,width: 130,fit: BoxFit.cover,),
                  Gap(25),
                  Container(
                    height: 52,
                    width: 146,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: const Text("Let me help you choose a fragrance",textAlign: TextAlign.center,),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Row(
                children: [
                  Container(
                    height: 177,
                    width: 229,
                    color: Colors.white,
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Meet Al-Danah:\nStyle Expert",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,),),
                        const Text("AI-Danah assists with women’s clothing and fragrance.",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400)),
                        Gap(16),
                        elevatedButton(text: "GotIt", page: HomeScreen())
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}