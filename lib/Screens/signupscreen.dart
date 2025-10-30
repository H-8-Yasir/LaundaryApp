import 'package:flutter/material.dart';
import 'package:laundaryapp/Widgets/ElevatedButton.dart';
import 'package:laundaryapp/Widgets/customTextField/customTextField.dart';
import 'package:laundaryapp/Widgets/customTextField/customtext.dart';
import 'package:laundaryapp/Widgets/custom_sub_text.dart';
import 'package:laundaryapp/bar/bottomBar.dart';

class Signupscreen extends StatefulWidget{
  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {

  final TextEditingController name=TextEditingController();
  final TextEditingController email=TextEditingController();
  final TextEditingController password=TextEditingController();
  final TextEditingController confirmPassword=TextEditingController();
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xFFF7F3EE),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Form(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Create Account",textAlign: TextAlign.center, style: TextStyle(
                            color: Color(0xFFD4AF37),
                            fontSize: 24
                          ),),
                        ],
                      ),
                  const SizedBox(height: 7),
                  customsubtext("Create your Akoya account to enjoy personalized services and premium laundry care."),
                  const SizedBox(height: 12),
                  customText("Name"),
            customTextField(labelText: "Name", 
                  controller: name, 
                  textInputType: TextInputType.text),
                  customText("Email"),
            customTextField(labelText: "Email", 
                  controller: email, 
                  textInputType: TextInputType.text),
                  customText("Password"),
            customTextField(labelText: "Password", 
                  controller: password, 
                  textInputType: TextInputType.text,
                  isPassword: true,
                  suffixIcon: Icon(Icons.remove_red_eye_outlined),),
                  customText("Confirm Password"),
           customTextField(labelText: "Confirm Password", 
                  controller: confirmPassword, 
                  textInputType: TextInputType.text,
                  isPassword: true),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Row(
                  children: [
                    SizedBox(
                      height: 24,
                      width: 24,
                      child: Checkbox(value: false, 
                      onChanged: (bool? value){}),
                    ),
                    const SizedBox(width: 7),
                    const Text("Agree with ",style: TextStyle(color: Color.fromARGB(255, 126, 124, 124)),),
                    const Text("terms & conditions",style: TextStyle(
                      color: Color(0xFFD4AF37)
                    ))
                ]),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10,top: 10),
                child: elevatedButton(text: "Sign Up",page: BottomBar()),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                 const Expanded(child: Divider(color: Colors.black,)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: const Text("or sign up with",style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                 const Expanded(child: Divider(color: Colors.black)),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipOval(
                    child: Image.asset('assets/images/download.png',height: 50,width: 50,fit: BoxFit.cover),
                    ),
                    const SizedBox(width: 32),
                  ClipOval(
                    child: Image.asset('assets/images/facebook.png',height: 50,width: 50,fit: BoxFit.cover),
                    )
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? ",style: TextStyle(color: Color.fromARGB(255, 95, 94, 94))),
                  const Text("Sign in",style: TextStyle(color: Color(0xFFD4AF37)))
                ],
              )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}