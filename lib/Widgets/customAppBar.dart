import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget{
  final Color? backgroundcolor;
  final Color? color;
  final Color? colors;
  final Widget? image;

  const CustomAppBar({super.key,this.backgroundcolor,this.color,this.colors,this.image});
  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  TextEditingController search=TextEditingController();

  Widget build(BuildContext context){
    return Container(
      width: double.infinity,
      height: 119,
     color: widget.backgroundcolor,
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(backgroundImage: AssetImage("assets/images/picture1.png"),radius: 30,),
            title: Row(
              children: [
                Text("Hello ",style: TextStyle(color: widget.colors)),
                Icon(Icons.waving_hand_outlined,color: widget.color,size: 21)
              ],
            ),
            subtitle: Text("Al-Danah",style: TextStyle(color: widget.colors)),
            trailing: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25)
              ),
              child: IconButton(onPressed: (){
                Scaffold.of(context).openEndDrawer();
              }, icon: Icon(Icons.menu,size: 15),hoverColor: Colors.white),
            )
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 24,right: 10),
                  child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                    color: widget.color,
                    borderRadius: BorderRadius.circular(8.0)
                  ),
                  child: TextField(
                    controller: search,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 8),
                      hintText: "Search",
                    ),
                  ),
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24),
                child: widget.image,
              )
            ],
          )
        ],
      )
    );
  }
}