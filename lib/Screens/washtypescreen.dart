import 'package:flutter/material.dart';
import 'package:laundaryapp/Screens/ClothScreen.dart';
import 'package:laundaryapp/Widgets/ElevatedButton.dart';
import 'package:laundaryapp/Widgets/customAppBar.dart';
import 'package:laundaryapp/Widgets/custom_sub_text.dart';
import 'package:laundaryapp/helpers/buildFragrance.dart';
import 'package:laundaryapp/helpers/buildWashCard.dart';

     class Washtypescreen extends StatefulWidget{
      
  @override
  State<Washtypescreen> createState() => _WashtypescreenState();
}

class _WashtypescreenState extends State<Washtypescreen> {

      String? selectedMenFragrance;
      String? selectedWomenFragrance;
      bool select=true;
       Widget build(BuildContext context){
        return Scaffold(
          backgroundColor: Color(0xFFF7F3EE),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomAppBar(backgroundcolor: Color(0xFFF7F3EE),color: Color(0xFFD4AF37),colors: Colors.black,
                  image: Image(image: AssetImage("assets/images/picture3.png"))),
                  const Text("How would you like us to clean\nyour garments?",
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Color(0xFFD4AF37)),textAlign: TextAlign.center,),
                  customsubtext("Choose the cleaning style that best fits your\n needs — standard care or express service."),
                   Padding(
                     padding: const EdgeInsets.only(left: 24,right: 24,bottom: 10,top: 10),
                     child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 0.9,
                      shrinkWrap: true,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      physics: const NeverScrollableScrollPhysics(),
                     children: [
                     buildWashCard('Standard Wash', Icons.water_drop_outlined, [
                       'Gentle Cycle',
                       'Fragrance Option',
                       'Delivery in\n24–48 hours'
                     ]),
                     buildWashCard('Express Wash', Icons.flash_on, [
                       'Quick Wash Cycle',
                       'Priority Delivery',
                       'Optional Steam\nFinish'
                     ],),
                                     ],
                                   ),
                   ),
                  const Text("Customize Your Wash",style: TextStyle(
                    color: Color(0xFFD4AF37),fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),),
                  const Text("Choose optional features to personalize your\nexperience.",textAlign: TextAlign.center),
                  Padding(
                    padding: const EdgeInsets.only(left: 22,right: 22,top: 10),
                    child: GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      childAspectRatio: 1.6,
                      crossAxisSpacing: 10,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        Buildfragrance(title: "Men's Fragrance", 
                        options: ["Elixir","Imperial"], selectedOption: selectedMenFragrance, 
                        onSelect: (value){
                          setState(() {
                            selectedMenFragrance=value;
                          });
                        }),
                        Buildfragrance(title: "Women's Fragrance", 
                        options: ["Orchid","Moony"], selectedOption: selectedWomenFragrance, 
                        onSelect: (value){
                          setState(() {
                            selectedWomenFragrance=value;
                          });
                        })
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24,right: 24,top: 10,bottom: 15),
                    child: GridView.count(
                      crossAxisCount: 1,
                      childAspectRatio: 3.8,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                   boxShadow: [
                     BoxShadow(
                         color: Colors.grey.withOpacity(0.4),
                           spreadRadius: 2,
                            blurRadius: 8,
                          offset: Offset(0, 4)
                        )
                        ],
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8,right: 6,top: 6,bottom: 4),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text("Add Steam Finish",style: TextStyle(color: Color(0xFFD4AF37),fontWeight: FontWeight.bold,fontSize: 18)),
                                      Transform.scale(scale: 0.7,
                                        child: Switch(value: select, onChanged: (value){
                                          setState(() {
                                            select=value;
                                          });
                                        },
                                        activeColor: Colors.white,activeTrackColor: const Color.fromARGB(255, 7, 116, 10),),
                                      )
                                    ],
                                  ),
                                  const Text("Remove Wrinkless With Steam Press",style: TextStyle(fontSize: 16),textAlign: TextAlign.start,)
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(left: 24,right: 24,bottom: 14),
                  child: elevatedButton(text: "Confirm & Continue", page: Clothscreen()),
                )
                ],
              ),
            ),
          ),
        );
       }
}