import 'package:flutter/material.dart';

Widget buildWashCard(String title, IconData icon, List<String> features) {
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