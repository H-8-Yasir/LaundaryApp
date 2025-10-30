import 'package:flutter/material.dart';
import 'package:laundaryapp/Screens/welcomeScreen.dart';
import 'package:laundaryapp/classes/cart_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
    create: (context) => CartProvider(),
    child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    Widget build(BuildContext context){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WelcomeScreen(),
      );
    }
}
