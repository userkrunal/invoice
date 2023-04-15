import 'package:billpay/home/home_screen.dart';
import 'package:billpay/home/product.dart';
import 'package:flutter/material.dart';
void main()
{
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/":(context) => Home_Screen(),
        "product":(context) => Product_List(),
      },
    ),
  );
}