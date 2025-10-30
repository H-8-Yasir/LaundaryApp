import 'package:flutter/material.dart';
import 'package:laundaryapp/Screens/packagingScreen.dart';
import 'package:laundaryapp/Widgets/ElevatedButton.dart';
import 'package:laundaryapp/Widgets/appBarCustom.dart';
import 'package:laundaryapp/Widgets/customTextField/customclothes.dart';
import 'package:laundaryapp/Widgets/custom_sub_text.dart';

   class Clothscreen extends StatefulWidget{
  @override
  State<Clothscreen> createState() => _ClothscreenState();
}

class _ClothscreenState extends State<Clothscreen> {
    final Color selectedColor = Color(0xFFD4AF37); 
 // Gold color
  final Color unselectedColor = Colors.white;

  final Color backgroundColor = Color(0xFFF7F3EE); 
 // Light cream background
  final Color textColor = Colors.black87;

  final bool isSelected=true;
  int selectedIndex=0;
  final int index=0;

    Widget build(BuildContext context){
      return Scaffold(
        backgroundColor: Color(0xFFF7F3EE),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Appbarcustom(),
                Padding(
                  padding: const EdgeInsets.only(top: 30,left: 30,bottom: 18),
                  child: Row(
                    children: [
                      InkWell(onTap: (){
                        Navigator.pop(context);
                      },child:Icon(Icons.arrow_back,size: 33)),
                      const Text("Select Your Cloth",style: TextStyle(
                        fontWeight: FontWeight.bold,fontSize: 24
                      ),)
                    ],
                  ),
                ),
                const Text("What clothes are you\nsending us?",textAlign: TextAlign.center,style: TextStyle(
                  fontSize: 22,color: Color(0xFFD4AF37)
                ),),
                customsubtext("Tell us which garments you’d like us to care for. Add each item with the quantity so we can prepare them perfectly."),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                   children: [
                     Row(
                       children: [
                          Expanded(
                           child: _buildCategoryButton(context: context, label: "Men's",
                           selectedindex: selectedIndex,index: 0,
                            onPressed: (){
                              setState(() {
                                  selectedIndex=0;
                              });
                           }),
                         ),
                         Expanded(
                           child: _buildCategoryButton(context: context, label: "Women's",
                           selectedindex: selectedIndex, index: 1, onPressed: (){
                             setState(() {
                               selectedIndex=1;
                             });
                           }),
                         ),
                       ],
                     ),
                     SizedBox(height: 10),
                     selectedIndex==index ? Column(
                     children: [
                    Customclothes(name: "Kandura", imagePath: "assets/images/kandura.png"),
                    Customclothes(name: "Shirt", imagePath: "assets/images/shirt.png"),
                    Customclothes(name: "Pant", imagePath: "assets/images/pant.png"),
                    Customclothes(name: "Socks", imagePath: "assets/images/socks.png"),
                    Customclothes(name: "Trouser", imagePath: "assets/images/trouser.png"),
                     ],
                    ) : Column(
                     children: [
                    Customclothes(name: "Abaya", imagePath: "assets/images/abaya.png"),
                    Customclothes(name: "Hijab", imagePath: "assets/images/hijab.png"),
                    Customclothes(name: "Kaftan", imagePath: "assets/images/kaftan.png"),
                    Customclothes(name: "Skirt", imagePath: "assets/images/skirt.png"),
                    Customclothes(name: "Trouser", imagePath: "assets/images/trouser.png"),
                     ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 150,top: 12),
                      child: const Text("+ Add More Items",style: TextStyle(color: Color(0xFFD4AF37),fontSize: 16,fontWeight: FontWeight.w500)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20,left: 13,right: 13),
                      child: elevatedButton(text: "Confirm", page: Packagingscreen()),
                    )
                   ],
                    ), 
                 )
              ],
            ),
          ),
        ),
      );
    }

   Widget _buildCategoryButton({
    required BuildContext context,
    required String label,
    required VoidCallback onPressed,
    required int index,
    required int selectedindex,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10),
      child: SizedBox(
        width: 139,
        height: 40,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: selectedindex==index ? Color(0xFFD4AF37) : Colors.white,
            foregroundColor: selectedindex==index ? Color(0xFFD4AF37) : Colors.white,
            // Makes the corners rounded
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              // Adds a light border to the white button
              side: selectedindex == unselectedColor
                  ? BorderSide(color: Colors.grey.shade300)
                  : BorderSide.none,
            ),
            elevation: selectedindex == unselectedColor ? 0 : 2, // Add shadow to selected
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: selectedindex==index ? Colors.white : Colors.black
            ),
          ),
        ),
      ),
    );
  }
}