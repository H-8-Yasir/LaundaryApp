import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:laundaryapp/Screens/personalizedcardscreen.dart';
import 'package:laundaryapp/Widgets/appBarCustom.dart';
import 'package:laundaryapp/classes/cart_provider.dart';
import 'package:provider/provider.dart';

class Packagingscreen extends StatefulWidget{
  @override
  State<Packagingscreen> createState() => _PackagingscreenState();
}

class _PackagingscreenState extends State<Packagingscreen> {

  String? _selectedPackagingName;
  @override 
  void initState(){
    super.initState();
    final cartProvider = context.read<CartProvider>();
    _selectedPackagingName = cartProvider.selectedPackaging?.name;
  }
  @override
  Widget build(BuildContext context){
    final cartProvider = context.read<CartProvider>();
    final options = cartProvider.availablePackagingOptions;
    
    return Scaffold(
      backgroundColor: Color(0xFFF7F3EE),
      body: SafeArea(
        child: Column(
          children: [
            Appbarcustom(),
            Padding(
              padding: const EdgeInsets.only(left: 14,top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: Icon(Icons.arrow_back)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15,top: 22),
              child: const Text("How Would You Like Us To\n Package Your Garments",textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Color(0xFFd4AF37))),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: options.length,
                itemBuilder: (context,index){
                  final option = options[index];
                  return cards(maintext: option.name, 
                  text: option.description, image: Image(
                    image: AssetImage(option.imagePath),fit: BoxFit.cover,
                  ), onTap: (){
                    setState(() {
                      _selectedPackagingName = option.name;
                    });
                    cartProvider.setSelectedPackaging(option);
                  }, isSelected: _selectedPackagingName == option.name);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25,right: 25),
              child: ElevatedButton(
                onPressed: (){
                  if(cartProvider.selectedPackaging != null){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Personalizedcardscreen()));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please select a packaging style."))
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD4AF37),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)
                    )
                  ),
                child: const Text("Confirm & Continue",style: TextStyle(
                  color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16
                ),),
              )
            )
          ],
        ),
      ),
    );
  }
}


   Widget cards({
    required String maintext,
    required String text,
    required Image image,
    required VoidCallback onTap,
    required bool isSelected
   }){
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 25,right: 25,top: 6),
        child: Card(
          elevation: 4,
          clipBehavior: Clip.antiAlias,
          shadowColor: Colors.grey,
          child: Container(
            width: double.infinity,
            height: 97,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: isSelected ? 
              Border.all(color: const Color(0xFFD4AF37),width: 2.5)
              : Border.all(color: Colors.grey.shade300,width: 1),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.15),
                  spreadRadius: 1,
                  blurRadius: 5
                )
              ]
            ),
            padding: const EdgeInsets.only(bottom: 2),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: image,
                ),
                Gap(20),
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(maintext,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,),),
                      Text(text,style: TextStyle(fontSize: 12),)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
   }