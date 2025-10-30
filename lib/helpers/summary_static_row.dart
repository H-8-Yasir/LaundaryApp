import 'package:flutter/material.dart';

class SummaryStaticRow extends StatelessWidget{
  final String label;
  final String value;
  final String? imagePath;

  const SummaryStaticRow({
    required this.label,
    required this. value,
    required this.imagePath,
    super.key
  });
  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow:const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
          )
        ]
      ),
      child: Row(
        children: [
          imagePath !=null ? Image.asset(imagePath!,width: 24,height: 24)
          : const SizedBox(width: 24,height: 24),
          const SizedBox(width: 10),
          Text(label,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w500)),
          const Spacer(),
          Text(value,style: const TextStyle(fontSize: 16),)
        ],
      ),
    );
  }
}