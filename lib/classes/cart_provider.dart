import 'package:flutter/material.dart';
import 'package:laundaryapp/classes/garmentitem.dart';
import 'package:laundaryapp/classes/packaging_option.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';

class CartProvider extends ChangeNotifier{
  // packaging state
  PackagingOption? _selectedPackaging;
  PackagingOption? get selectedPackaging => _selectedPackaging;

  final List<PackagingOption> availablePackagingOptions = const [
    PackagingOption(name: "Plastic Wrap", 
    description: "Clean and simple wrap,\ntransparent protection.", imagePath: "assets/images/plastic.png", price: 10),
    PackagingOption(name: "Luxury Fabric Wrap", 
    description: "Hidden, soft-touch \nwrapping with luxurious\ntexture.", imagePath: "assets/images/luxury.png", price: 30),
    PackagingOption(name: "Premium Box", 
    description: "Elegant gift box with\nmagnetic closure and\nscent-preserving lining.", imagePath: "assets/images/premiumbox.png", price: 40)
  ];

  void setSelectedPackaging(PackagingOption option){
    _selectedPackaging = option;
    notifyListeners();
  }
  // for garments
  final Map<String, Garmentitem> _items = {};

  CartProvider(){
    _items['Kandura']=Garmentitem(name: "Kandura", unitPrice: 15.0,imagePath: "assets/images/kandura.png");
    _items['Shirt']=Garmentitem(name: "Shirt", unitPrice: 20.0,imagePath: "assets/images/shirt.png");
    _items['Pant']=Garmentitem(name: "Pant", unitPrice: 18.0,imagePath: "assets/images/pant.png");
    _items['Socks']=Garmentitem(name: "Socks", unitPrice: 12.0,imagePath: "assets/images/socks.png");
    _items['Trouser']=Garmentitem(name: "Trouser", unitPrice: 10.0,imagePath: "assets/images/trouser.png");
    _items['Abaya']=Garmentitem(name: "Abaya", unitPrice: 22.0,imagePath: "assets/images/abaya.png");
    _items['Hijab']=Garmentitem(name: "Hijab", unitPrice: 23.0,imagePath: "assets/images/hijab.png");
    _items['Kaftan']=Garmentitem(name: "Kaftan", unitPrice: 20.0,imagePath: "assets/images/kaftan.png");
    _items['Skirt']=Garmentitem(name: "Skirt", unitPrice: 5.0,imagePath: "assets/images/skirt.png");
    _items['Trouser']=Garmentitem(name: "Trouser", unitPrice: 10.0,imagePath: "assets/images/trouser.png");

    loadCartFromPrefs();
  }

  Map<String, Garmentitem> get items => _items;

  List<Garmentitem> get cardItems=> _items.values.where((item) => item.quantity > 0).toList();

  double get totalOrderPrice{
    double total=0.0;
    for(var item in _items.values){
      total += item.totalItemPrice;
    }
    return total;
  }

  void incrementQuantity(String itemName){
    if(_items.containsKey(itemName)){
      _items[itemName]!.quantity++;
      notifyListeners();
      saveCartToPrefs();
    }
  }

  void decrementQuantity(String itemName){
    if(_items.containsKey(itemName) && _items[itemName]!.quantity>0){
      _items[itemName]!.quantity--;
      notifyListeners();
      saveCartToPrefs();
    }
  }

  static const String _prefsKey="Saved_card_items";

  Future<void> saveCartToPrefs() async{
    final SharedPreferences prefs= await SharedPreferences.getInstance();
    final List<Map<String, dynamic>> itemToSave= _items.values.where((item)=>item.quantity>0)
    .map((item) => item.toJson()).toList();

    final String jsonString=jsonEncode(itemToSave);
    await prefs.setString(_prefsKey, jsonString);
  }

  Future<void> loadCartFromPrefs() async{
    final SharedPreferences prefs=await SharedPreferences.getInstance();
    final String? jsonString=prefs.getString(_prefsKey);

    if(jsonString != null){
      final List<dynamic> jsonList = jsonDecode(jsonString);
      final List<Garmentitem> loadedItems= jsonList.map((json)=> Garmentitem.fromJson(json as Map<String,dynamic>)).toList();
      for(var loadedItem in loadedItems){
        if(_items.containsKey(loadedItem.name)){
          _items[loadedItem.name]!.quantity=loadedItem.quantity;
        }
      }
      notifyListeners();
    }
  }
}