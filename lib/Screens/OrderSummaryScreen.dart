import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:laundaryapp/helpers/summary_item_row.dart';
import 'package:laundaryapp/Widgets/appBarCustom.dart';
import 'package:laundaryapp/classes/cart_provider.dart';
import 'package:provider/provider.dart';
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

    final cartProvider= Provider.of<CartProvider>(context);
    return Scaffold(
      backgroundColor: Color(0xFFF7F3EE),
      body: SafeArea(
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
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: cartProvider.cardItems.length,
                itemBuilder: (context, index){
                  final item=cartProvider.cardItems[index];
                  return SummaryItemRow(item: item);
                },
              ),
            ),
        
            Divider(),
        
        // Final Total Price
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              // Display the calculated total price
              Text(
                'QAR ${cartProvider.totalOrderPrice.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
              ),
            ],
          ),
        ),
        
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
    );
  }
}