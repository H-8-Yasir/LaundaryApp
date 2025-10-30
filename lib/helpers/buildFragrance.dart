import 'package:flutter/material.dart';

class Buildfragrance extends StatefulWidget{
  final String title;
  final List<String> options;
  final String? selectedOption;
  final Function(String) onSelect;

  const Buildfragrance({
    super.key,
    required this.title,
    required this.options,
    required this.selectedOption,
    required this.onSelect,
  });
  @override
  State<Buildfragrance> createState() => _Buildfragrancestate();
}

class _Buildfragrancestate extends State<Buildfragrance>{

  bool select=false;
  @override
  Widget build(BuildContext context){
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFD4AF37),
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ),
              Transform.scale(
                scale: 0.5,
                child: Switch(value: select, onChanged: (value){
                   setState(() {
                     select=value;
                   });
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
                padding: const EdgeInsets.all(10),
                child: Image(image: AssetImage("assets/images/picture4.png"),fit: BoxFit.fill),
              ),
              Column(
                children: [
              ...widget.options.map((option) {
                final bool isSelected = widget.selectedOption == option;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () => widget.onSelect(option),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          spacing: 3,
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
}