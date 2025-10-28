   import 'package:flutter/material.dart';

class customTextField extends StatelessWidget{

    final String labelText;
    final TextEditingController controller;
    final TextInputType textInputType;
    final bool isPassword;
    final Widget? prefixIcon;
    final Widget? suffixIcon;

    const customTextField({
        super.key,
        required this.labelText,
        required this.controller,
        required this.textInputType,
        this.isPassword=false,
        this.prefixIcon,
        this.suffixIcon,
    });

    Widget build(BuildContext context){
        return Padding(
            padding: const EdgeInsets.only(left: 8,bottom: 14,top: 5),
            child: Container(
                height: 40,
                width: double.infinity,
              child: TextField(
                  controller: controller,
                  keyboardType: textInputType,
                  obscureText: isPassword,
                  decoration: InputDecoration(
                      labelText: labelText,
                      hintStyle: TextStyle(color: Color(0xFFD4AF37)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.black54)
                      ),
                      contentPadding: const EdgeInsets.all(16),
                      suffixIcon: suffixIcon,
                      prefixIcon: prefixIcon,
                  ),
                  style: TextStyle(
                      color: Color(0xFFD4AF37),
                      fontSize: 16,
                  ),
              ),
            ),
        );
    }
}