    import 'package:flutter/material.dart';

class elevatedButton extends StatelessWidget{
  final String text;
  final Widget page;

  elevatedButton({super.key, required this.text,required this.page});


  Widget build(BuildContext context){
    return SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => page));
                    }, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD4AF37),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)
                      )
                    ),
                    child: Text(text,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,
                    fontSize: 16),)),
                );
  }
}