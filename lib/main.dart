import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:laundaryapp/Screens/welcomeScreen.dart';
import 'package:laundaryapp/classes/cart_provider.dart';
import 'package:laundaryapp/firebase_options.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
