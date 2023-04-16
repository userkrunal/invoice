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
  String total="";
  String qty="1";
  String price = "0";
  String amount="";
  String tax="";
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: Text("Invoice generator"),centerTitle: true,backgroundColor: Colors.purple.shade200,
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
                          color: Colors.purpleAccent.shade200
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
                          color: Colors.purpleAccent.shade200
                      ),
                      child: Center(child: Text("Invoice ^ ",style: TextStyle(color: Colors.white),)),
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
                  child: TextFormField(
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
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        price=value;
                      });
                    },
                    controller: txtPprice,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: "Product Price",
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: txtPQty,
                    onChanged: (value) {
                      setState(() {
                        qty=value;
                        total='${(int.parse(price)*int.parse(qty))}';
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: "Product Qty",
                    ),
                  ),
                ),
                // Text("${total}",style: TextStyle(color: Colors.redAccent,fontSize: 10)),
                SizedBox(height: 15),
                InkWell(
                  onTap: () {
                    ProductModel pm=ProductModel(name: txtPName.text,no: txtPQty.text,price: txtPprice.text,total: total);
                    setState(() {
                      prodcutList.add(pm);
                      txtPName.text='';
                      txtPQty.text='';
                      txtPprice.text='';
                      tax='${(int.parse(price)*int.parse(qty))*18/100}';
                      print("${tax}");
                    });
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(behavior:SnackBarBehavior.floating,content: Text("Thanks for Adding Product in List"),backgroundColor: Colors.purple.shade400,));
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
  String? name,no,price,total,amount,tax;

  ProductModel({this.name, this.no, this.price,this.total,this.amount,this.tax});
}