    import 'package:flutter/material.dart';
import 'package:laundaryapp/Widgets/customAppBar.dart';
import 'package:laundaryapp/Widgets/customCircleAvatar.dart';
import 'package:laundaryapp/Widgets/customContainer.dart';
import 'package:laundaryapp/Widgets/custom_sub_text.dart';

class HomeScreen extends StatefulWidget{
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget build(BuildContext build){
    return Scaffold(
      backgroundColor: Color(0xFFF7F3EE),
     // endDrawer: Drawer(child: Text("drfgh")),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(backgroundcolor: Color(0xFFD4AF37),colors: Colors.white,color: Colors.white,
              image: Image(image: AssetImage("assets/images/Frame 15.png"),),),
              Image(image: AssetImage("assets/images/picture2.jpg"),height: 220,width: double.infinity,fit: BoxFit.cover),
              Padding(
                padding: const EdgeInsets.only(top: 18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("The Akoya Collection",style: TextStyle(
                     fontSize: 18,
                     fontWeight: FontWeight.bold,
                     color: Color(0xFFD4AF37)
                     )),
                    customsubtext("The Akoya Collection is where care meets class. Elevate your laundry experience with exclusive,personalized touches"),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12,top: 14),
                      child: Container(
                        height: 86,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            customCircleAvatar(Image(image: AssetImage("assets/images/perfume.png")), "Perfume\nInfusion"),
                            customCircleAvatar(Image(image: AssetImage("assets/images/perfume.png")), "Premium\nPackaging"),
                            customCircleAvatar(Image(image: AssetImage("assets/images/Istri.png")), "Steam\nFinishing")
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 14,right: 14,bottom: 12),
                      child: const Text("How would you like us to clean \nyour garments?",textAlign: TextAlign.center, style: TextStyle(
                        fontWeight: FontWeight.bold,fontSize: 20,color: Color(0xFFD4AF37))),
                    )
                  ],
                ),
              ),
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
               // mainAxisSpacing: 20,
                childAspectRatio: 1.8,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(16.0),
                shrinkWrap: true,
                children: [
                  customContainer(text: "Standard Wash",
                  assetPath: "assets/images/drops.png",width: 2,),
                   customContainer(text: "Express Wash",assetPath: "assets/images/current.png",width: 2,)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}