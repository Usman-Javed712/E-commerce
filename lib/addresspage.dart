import 'package:ecommerce/bottombar.dart';
import 'package:ecommerce/logic.dart';
import 'package:ecommerce/payment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  void showOrderConfirmedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text('Order Confirmed'),
          content: Text(
            'Your order has been confirmed successfully.', style: TextStyle(
              fontSize: 18
          ),),
          actions: [
            TextButton(
              onPressed: () {
                Provider.of<AppModel>(context,listen: false).clearCart();
                Provider.of<AppModel>(context,listen: false).clearprice();
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => NavPage()),
                      (Route<dynamic> route) => false,
                );
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
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
                          color: Colors.grey[200],
                        ),
                        child: Center(child: Icon(Icons.arrow_back)),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Add Details", style: TextStyle
                      (color: Colors.black87,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),),
                  ],
                ),
                Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 5,
                ),
                Text("First Name", style: TextStyle(fontSize: 18),),
                SizedBox(
                  height: 8,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[200],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    maxLength: 30,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      // Adjust padding as needed
                      border: InputBorder.none,
                      hintText: 'First Name',
                      hintStyle: TextStyle(
                          color: Colors.grey[600], fontSize: 16),
                      prefixIcon: Icon(Icons.person, color: Colors.grey),
                      // Prefix icon
                      counterText: "",
                    ),
                    style: TextStyle(
                        color: Colors.black, fontSize: 18, letterSpacing: 1),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Last Name", style: TextStyle(fontSize: 18),),
                SizedBox(
                  height: 8,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[200],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    maxLength: 30,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      // Adjust padding as needed
                      border: InputBorder.none,
                      hintText: 'Last Name',
                      hintStyle: TextStyle(
                          color: Colors.grey[600], fontSize: 16),
                      prefixIcon: Icon(Icons.person, color: Colors.grey),
                      // Prefix icon
                      counterText: "",
                    ),
                    style: TextStyle(
                        color: Colors.black, fontSize: 18, letterSpacing: 1),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("E-mail", style: TextStyle(fontSize: 18),),
                SizedBox(
                  height: 8,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[200],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    maxLength: 30,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      // Adjust padding as needed
                      border: InputBorder.none,
                      hintText: 'E-mail',
                      hintStyle: TextStyle(
                          color: Colors.grey[600], fontSize: 16),
                      prefixIcon: Icon(Icons.mail, color: Colors.grey),
                      // Prefix icon
                      counterText: "",
                    ),
                    style: TextStyle(
                        color: Colors.black, fontSize: 18, letterSpacing: 1),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Phone Number", style: TextStyle(fontSize: 18),),
                SizedBox(
                  height: 8,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[200],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    maxLength: 30,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      // Adjust padding as needed
                      border: InputBorder.none,
                      hintText: 'Phone number',
                      hintStyle: TextStyle(
                          color: Colors.grey[600], fontSize: 16),
                      prefixIcon: Icon(Icons.phone, color: Colors.grey),
                      // Prefix icon
                      counterText: "",
                    ),
                    style: TextStyle(
                        color: Colors.black, fontSize: 18, letterSpacing: 1),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text("Permanent Address", style: TextStyle(fontSize: 18),),
                SizedBox(
                  height: 10,
                ), Container(
                  height: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[200],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    maxLength: 30,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      border: InputBorder.none,
                      hintText: 'Address',
                      hintStyle: TextStyle(
                          color: Colors.grey[600], fontSize: 16),
                      prefixIcon: Icon(Icons.house, color: Colors.grey),
                      // Prefix icon
                      counterText: "",
                      alignLabelWithHint: true,
                    ),
                    style: TextStyle(
                        color: Colors.black, fontSize: 18, letterSpacing: 1),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text("Zip code", style: TextStyle(fontSize: 18),),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[200],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    maxLength: 30,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      border: InputBorder.none,
                      hintText: 'Postal Code',
                      hintStyle: TextStyle(
                          color: Colors.grey[600], fontSize: 16),
                      prefixIcon: Icon(Icons.location_on, color: Colors.grey),
                      // Prefix icon
                      counterText: "",
                      alignLabelWithHint: true,
                    ),
                    style: TextStyle(
                        color: Colors.black, fontSize: 18, letterSpacing: 1),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () {
                    _displayBottomSheet(context);
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.blue
                    ),
                    child: Center(
                        child: Text("Checkout", style: TextStyle(color: Colors
                            .white, fontSize: 30,
                            fontWeight: FontWeight.w500),)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future _displayBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) =>
            Container(
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  topLeft: Radius.circular(25)
                ),
                color: Colors.grey[200],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text("Choose Payment", style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text("option", style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Payment()));
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
                                Text("Credit/Debit", style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),),
                                Container(
                                    height: 40,
                                    width: 40,
                                    child: Center(
                                        child: Icon(Icons.credit_card,)))
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
                          showOrderConfirmedDialog(context);
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
                                Text("Cash on Delivery", style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),),
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