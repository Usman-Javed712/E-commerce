import 'package:ecommerce/addresspage.dart';
import 'package:ecommerce/carttile.dart';
import 'package:ecommerce/logic.dart';
import 'package:ecommerce/payment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {



  void _showEmptyCartDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text('Cart is Empty'),
          content: Text('Go shop first to add items to your cart.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Container(
                  height: 40,
                  width: 80,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(child: Text('OK'))),
            ),
          ],
        );
      },
    );
  }

  int discount = 40;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(builder: (context, value, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(width: 0.7)),
                          child: Center(
                              child: Icon(
                                Icons.arrow_back_ios_new,
                                size: 25,
                              )),
                        ),
                      ),
                      Text(
                        "My Cart",
                        style: TextStyle(fontSize: 20),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(width: 0.7)),
                        child: Center(
                            child: Icon(
                              Icons.more_horiz,
                              size: 25,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  height: 460,
                  color: Colors.transparent,
                  child: value.cartItems.isEmpty
                      ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/empty.png',
                          height: 400,
                          width: 400,),
                      ],
                    ),
                  )
                      : ListView.builder(
                      itemCount: value.cartItems.length,
                      itemBuilder: (context, index) {
                        return CartTile(
                          imagePath: value.cartItems[index][0],
                          namePath: value.cartItems[index][1],
                          pricePath: value.cartItems[index][2],
                          onPressed: () {
                            Provider.of<AppModel>(context, listen: false)
                                .removeItemFromCart(index);
                            Provider.of<AppModel>(context, listen: false)
                                .removelist(index);
                          },
                          index: index,
                        );
                      })),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  height: 65,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "ADJ3AK",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Text(
                          "Promocode applied",
                          style: TextStyle(
                              color: Color(0xFF19C463), fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Subtotal:",
                      style: TextStyle(fontSize: 18),
                    ),
                    Text("\$"+value.calculate(), style: TextStyle(fontSize: 18))
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Delivery Fee:",
                      style: TextStyle(fontSize: 18),
                    ),
                    value.cartItems.isEmpty?Text("\$0.00", style: TextStyle(fontSize: 18)):Text("\$5.00", style: TextStyle(fontSize: 18))
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Discount:",
                      style: TextStyle(fontSize: 18),
                    ),
                    value.cartItems.isEmpty? Text("0%", style: TextStyle(fontSize: 18)):Text("30%", style: TextStyle(fontSize: 18))
                  ],
                ),
              ),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: GestureDetector(
                  onTap: (){
                    if(value.cartItems.isEmpty){
                      _showEmptyCartDialog(context);
                    }else{
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddressPage()));
                    }
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xFF19C463),
                    ),
                    child: Center(
                      child: Text(
                        "Checkout for \$"+value.discounted(),
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
  Future _displayBottomSheet(BuildContext context){
    return showModalBottomSheet(
        context: context,
        builder: (context)=> Container(
          height: 300,
          color: Colors.grey[200],
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Choose Payment",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text("option",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Payment()),
                      );
                    },
                    child: Container(
                      height: 70,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                              width: 1
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Credit/Debit",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
                            Container(
                                height: 40,
                                width: 40,
                                child: Center(child: Icon(Icons.credit_card,)))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => AddressPage()),
                      );
                    },
                    child: Container(
                      height: 70,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                              width: 1
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Cash on Delivery",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
                            Container(
                                height: 50,
                                width: 50,
                                child: Center(child: Icon(Icons.money,)))
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
