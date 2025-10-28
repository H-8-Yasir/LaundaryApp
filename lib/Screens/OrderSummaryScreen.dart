import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:laundaryapp/Widgets/appBarCustom.dart';
import 'package:laundaryapp/Widgets/customTextField/customclothes.dart';
import 'package:url_launcher/url_launcher.dart';

class Ordersummaryscreen extends StatelessWidget{
  final String whatsappNumber="923280402880";
  final String message = "Hello! I want to contact you.";

  Future<void> openWhatsApp() async {
    final Uri WhatsappUrl= Uri.parse("whatsapp://send?phone=$whatsappNumber&text=${Uri.encodeComponent(message)}");

    if(await canLaunchUrl(WhatsappUrl)){
      await launchUrl(WhatsappUrl,mode: LaunchMode.externalApplication);
    }else{
      throw "Could not open whatsapp";
    }
  }
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xFFF7F3EE),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Appbarcustom(),
              Padding(
                padding: const EdgeInsets.only(top: 14,bottom: 16,left: 14),
                child: Row(
                  children: [
                    IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon: Icon(Icons.arrow_back)),
                    const Text("Order Summary",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20))
                  ],
                ),
              ),
              const Text("Review before confirming",textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Color(0xFFD4AF37))),
              Gap(10),
              Customclothes(name: "Kandura", imagePath: "assets/images/kandura.png", number: 2),
              Customclothes(name: "Abaya", imagePath: "assets/images/abaya.png", number: 3),
              Customclothes(name: "Hijab", imagePath: "assets/images/hijab.png", number: 8),
              Customclothes(name: "Kaftan", imagePath: "assets/images/kaftan.png", number: 5),
              Customclothes(name: "Skirt", imagePath: "assets/images/skirt.png", number: 9),
              Customclothes(name: "Perfume", imagePath: "assets/images/perfume2.png", number: 2),
              Customclothes(name: "Packaging", imagePath: "assets/images/box.png", number: 2),
              Customclothes(name: "Total", imagePath: "assets/images/box.png", number: 2),
               Padding(
                padding: const EdgeInsets.all(25),
                child: SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: ElevatedButton(onPressed: (){
                    openWhatsApp();
                  },
                  style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFD4AF37),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24)
                          )
                        ),
                         child: Text("Confirm & order on whatsApp",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,
                      fontSize: 16))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}