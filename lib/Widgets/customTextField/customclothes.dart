import 'package:flutter/material.dart';
import 'package:laundaryapp/classes/cart_provider.dart';
import 'package:laundaryapp/classes/garmentitem.dart';
import 'package:provider/provider.dart';

  class Customclothes extends StatelessWidget{
    final String name;
    final String imagePath;

  const Customclothes({super.key,required this.name,required this.imagePath});
    Widget build(BuildContext context){

      return Consumer<CartProvider>(
        builder: (context, cartProvider, child){
          final Garmentitem? item=cartProvider.items[name];
          final int currentQuantity = item?.quantity ?? 0;

          final void Function() increment= () => cartProvider.incrementQuantity(name);
          final void Function() decrement= () => cartProvider.decrementQuantity(name);

          return Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top:10),
        child: Container(
                    height: 55,
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
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image(image: AssetImage(imagePath),width: 30,height: 30,),
                                    SizedBox(width: 5),
                                    Text(name,style: TextStyle(
                                      fontSize: 20
                                    ),),
                                      ],
                                    ),
                              Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: decrement,
                                       child:  Container(
                                      height:20,width:20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),color: Color(0xFFD4AF37)
                                    ),
                                    child: Text("-",textAlign: TextAlign.center,style: TextStyle(
                                      color: Colors.white
                                    ))
                                    )),
                                    SizedBox(width: 8),
                                    Container(height:20,width:20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),color: Color(0xFFD4AF37)
                                    ),
                                    child: Text("$currentQuantity",textAlign: TextAlign.center,style: TextStyle(color: Colors.white)),),
                                    SizedBox(width: 8),
                                   InkWell(
                                    onTap: increment,
                                     child: Container(
                                        height:20,width:20,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(2),color: Color(0xFFD4AF37)
                                      ),
                                      child: Text("+",textAlign: TextAlign.center,style: TextStyle(
                                        color: Colors.white
                                      ),),
                                      ),
                                   )
                                      ],
                                    )  
                                  ],
                                ),
                              ),
                            ),
                          ),
               );
            },
      );     
    }
}