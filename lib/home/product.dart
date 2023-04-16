import 'dart:typed_data';
import 'dart:ui';

import 'package:billpay/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class Product_List extends StatefulWidget {
  const Product_List({Key? key}) : super(key: key);

  @override
  State<Product_List> createState() => _Product_ListState();
}

class _Product_ListState extends State<Product_List> {
  GlobalKey _globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    List<ProductModel> pm =ModalRoute.of(context)!.settings.arguments as List<ProductModel>;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.purpleAccent.shade400,
        appBar: AppBar(
            title: Text("Bridal Studio"),centerTitle: true,
            actions: [
              IconButton(onPressed: () async {


              RenderRepaintBoundary? renderBoundry=_globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
              var image= await renderBoundry.toImage();
              var byteData=await image.toByteData(format: ImageByteFormat.png);
              Uint8List uint8List =byteData!.buffer.asUint8List();
              await ImageGallerySaver.saveImage(uint8List);


              }, icon: Icon(Icons.save))
            ],
        ),
        body: RepaintBoundary(
          key: _globalKey,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.cyan.shade100,
            child: Stack(
              children: [

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(width: 20),
                        Text("Marriag Shopping",style: TextStyle(fontSize: 30)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(height: 30,width: 80,color:Colors.black45 ,child: Center(child: Text("Product",style: TextStyle(fontSize: 20,color: Colors.black)))),
                      Container(height: 30,width: 40,color:Colors.black45,child: Center(child: Text("Qty",style: TextStyle(fontSize: 20,color: Colors.black)))),
                      Container(height: 30,width: 60,color:Colors.black45,child: Center(child: Text("price",style: TextStyle(fontSize: 20,color: Colors.black)))),
                      Container(height: 30,width: 50,color:Colors.black45,child: Center(child: Text("Total",style: TextStyle(fontSize: 20,color: Colors.black)))),
                     // Container(height: 30,width: 50,color:Colors.black45,child: Center(child: Text("Tax",style: TextStyle(fontSize: 20,color: Colors.black)))),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 130,left: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: ListView.builder(itemBuilder: (context, index) {
                          return Center(child: Text("${pm[index].name}\n\n",style: TextStyle(fontSize: 20,color: Colors.black)));
                        },itemCount: prodcutList.length),
                      ),
                      Expanded(
                        child: ListView.builder(itemBuilder: (context, index) {
                          return Center(child: Text("${pm[index].no} \n\n",style: TextStyle(fontSize: 20,color: Colors.black)));
                        },itemCount: prodcutList.length),
                      ),
                      Expanded(
                        child: ListView.builder(itemBuilder: (context, index) {
                          return Center(child: Text("${pm[index].price}\n\n",style: TextStyle(fontSize: 20,color: Colors.black)));
                        },itemCount: prodcutList.length),
                      ),
                      Expanded(
                        child: ListView.builder(itemBuilder: (context, index) {
                          return Center(child: Text("${pm[index].total}\n\n",style: TextStyle(fontSize: 20,color: Colors.black)));
                        },itemCount: prodcutList.length),
                      ),
                      // Expanded(
                      //   child: ListView.builder(itemBuilder: (context, index) {
                      //     return Center(child: Text("${pm[index].tax}\n\n",style: TextStyle(fontSize: 15,color: Colors.black)));
                      //   },itemCount: prodcutList.length),
                      // ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
