    import 'package:flutter/material.dart';
import 'package:laundaryapp/Screens/ClothScreen.dart';
import 'package:laundaryapp/Widgets/ElevatedButton.dart';
    import 'package:laundaryapp/Widgets/customAppBar.dart';
import 'package:laundaryapp/Widgets/custom_sub_text.dart';

     class Washtypescreen extends StatefulWidget{
      
  @override
  State<Washtypescreen> createState() => _WashtypescreenState();
}

class _WashtypescreenState extends State<Washtypescreen> {
      String? selectedMenFragrance;
      String? selectedWomenFragrance;
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
                     _buildWashCard('Standard Wash', Icons.water_drop_outlined, [
                       'Gentle Cycle',
                       'Fragrance Option',
                       'Delivery in\n24–48 hours'
                     ]),
                     _buildWashCard('Express Wash', Icons.flash_on, [
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
                    padding: const EdgeInsets.only(left: 24,right: 24,top: 10),
                    child: GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      childAspectRatio: 1.6,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        _buildFragranceCard(title: "Men's Fragrance", 
                        options: ["Elixir","Imperial"], 
                        selectedOption: selectedMenFragrance, 
                        onSelect: (value){
                          setState(() {
                            selectedMenFragrance=value;
                          });
                        } ),
                        _buildFragranceCard(title: "Women's Fragrance", 
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
                                        child: Switch(value: true, onChanged: (value){},
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




     Widget _buildWashCard(String title, IconData icon, List<String> features) {
    return Container(
      clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: Color(0xFFD4AF37),
              width: 4
            )
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 2,
              blurRadius: 8,
              offset: Offset(0, 4)
            )
          ]
        ),
      child: Material(
        child: Column(
          children: [
            Icon(icon, color: Colors.black, size: 30),
            const SizedBox(height: 10),
            Text(title, style: TextStyle(color: Color(0xFFD4AF37), fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            ...features.map((f) => Padding(
              padding: const EdgeInsets.all(2),
              child: Row(
                children: [
                  const Icon(Icons.circle, size: 12, color: Color(0xFFD4AF37)),
                  const SizedBox(width: 6),
                  Expanded(child: Text(f, style: const TextStyle(fontSize: 12))),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildFragranceCard({
    required String title,
    required List<String> options,
    required String? selectedOption,
    required Function(String) onSelect,
    bool select=true
      }) {
    return Container(
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
          ]
        ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Color(0xFFD4AF37),
                  fontWeight: FontWeight.bold,
                  fontSize: 9.5,
                ),
              ),
              Transform.scale(
                scale: 0.6,
                child: Switch(value: select, onChanged: (value){
                   select=value;
                },
                activeColor: Colors.white,
                splashRadius: 15,
                activeTrackColor: const Color.fromARGB(255, 6, 100, 9),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Image(image: AssetImage("assets/images/picture4.png"),width: 40,height: 40,),
              ),
              Column(
                children: [
              ...options.map((option) {
                final bool isSelected = selectedOption == option;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () => onSelect(option),
                      child: Container(
                        decoration: BoxDecoration(
                          color: isSelected ? Color(0xFFD4AF37).withOpacity(0.15) : Colors.white,
                          border: Border.all(
                            color: isSelected ? Color(0xFFD4AF37) : Colors.grey.shade300,
                            width: 1.0,
                            style: BorderStyle.none
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                        //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              isSelected ? Icons.check_circle : Icons.circle_outlined,
                              color: isSelected ? Color(0xFFD4AF37) : Colors.grey,
                              size: 20,
                            ),
                            Text(
                              option,
                              style: TextStyle(
                                color: isSelected ? Color(0xFFD4AF37) : Colors.black87,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }