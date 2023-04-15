import 'package:flutter/material.dart';

List <ProductModel>prodcutList=[];

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}
class _Home_ScreenState extends State<Home_Screen> {
  int? index;
  TextEditingController txtPName=TextEditingController();
  TextEditingController txtPQty=TextEditingController();
  TextEditingController txtPprice=TextEditingController();
  ProductModel productModel=ProductModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: Text("Invoice generator"),centerTitle: true,
        leading:  Icon(Icons.shop_2_sharp),
        actions: [Icon(Icons.refresh)],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: prodcutList.asMap().entries.map((e) => myInvoice(prodcutList[e.key],e.key)).toList(),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
        children: [
                  InkWell(
                    onTap: () {
                      showDilog();
                    },
                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.black87
                      ),
                      child: Center(child: Text("Product + ",style: TextStyle(color: Colors.white),)),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'product',arguments: prodcutList);
                    },
                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.black87
                      ),
                      child: Center(child: Text("Invoice + ",style: TextStyle(color: Colors.white),)),
                    ),
                  ),
                ],
              ),
    ));
  }
  void showDilog()
  {
    showDialog(context: context,
        builder: (context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: txtPName,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: "Product Name",
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: txtPQty,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: "Product Qty",
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: txtPprice,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: "Product Price",
                    ),
                  ),
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    String name=txtPName.text;
                    String qty=txtPQty.text;
                    String price=txtPprice.text;
                    ProductModel pm=ProductModel(name: name,no: qty,price: price);
                    setState(() {
                      prodcutList.add(pm);
                      Navigator.pop(context);
                    });
                  },
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.black87
                    ),
                    child: Center(child: Text("Invoice + ",style: TextStyle(color: Colors.white),)),
                  ),
                ),
              ],
            ),
          );
        },
    );
  }
  Widget myInvoice(ProductModel pm,int index)
  {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        width: 390,
        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20),boxShadow: [BoxShadow(color: Colors.black,blurStyle: BlurStyle.outer)]),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
             Text("No"),
             Text("Product Name"),
             Text("Price"),
            ]),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
                Text("${pm.no}"),
                Text("${pm.name}"),
                Text("${pm.price}"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
class ProductModel
{
  String? name,no,price;

  ProductModel({this.name, this.no, this.price});
}