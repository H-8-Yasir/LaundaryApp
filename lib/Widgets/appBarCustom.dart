import 'package:flutter/material.dart';

   class Appbarcustom extends StatelessWidget{
      Widget build(BuildContext context){
        return Container(
          width: double.infinity,
          height: 40,
          child:  ListTile(
            leading: CircleAvatar(backgroundImage: AssetImage("assets/images/picture5.jpg"),radius: 30,),
            title: Row(
              children: [
                Text("Hello ",style: TextStyle()),
                Icon(Icons.waving_hand_outlined,color: Color(0xFFD4AF37),size: 21)
              ],
            ),
            subtitle: Text("Al-Danah",style: TextStyle()),
            trailing:  Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 30,
                  width: 30,
                  padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24)
                          ),
                          child: IconButton(onPressed: (){
                            Scaffold.of(context).openEndDrawer();
                          }, icon: Icon(Icons.notifications_outlined,size: 15),padding: EdgeInsets.zero,hoverColor: Colors.white),
                        ),SizedBox(width: 8,),
                     Container(
                     padding: const EdgeInsets.all(8),
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25)
                          ),
                          child: IconButton(onPressed: (){
                            Scaffold.of(context).openEndDrawer();
                          }, icon: Icon(Icons.menu,size: 15),padding: EdgeInsets.zero,hoverColor: Colors.white),
                        ),
              ],
            ),
          ),
        );
      }
   }