import 'package:ecommerce/addresspage.dart';
import 'package:ecommerce/bottombar.dart';
import 'package:ecommerce/logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> with SingleTickerProviderStateMixin{
  late TabController _outerTabController;

  TextEditingController _numController = TextEditingController();
  TextEditingController _cvvController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _dateController = TextEditingController();


  void cards() {
    Provider.of<AppModel>(context, listen: false).cardlist(
      _numController.text,
      _nameController.text,
      _dateController.text,
      _cvvController.text,
    );
  }


  bool _isChecked = false;

  void _toggleCheckbox(bool? value) {
    setState(() {
      _isChecked = value ?? false;
    });
    cards();
  }



  @override
  void initState() {
    super.initState();
    _outerTabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _outerTabController.dispose();
    super.dispose();
  }
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
                Provider.of<AppModel>(context,listen: false).getdata();
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
                Text("Debit/Credit",style: TextStyle(color: Colors.black87,
                    fontSize: 30,fontWeight: FontWeight.w500),),
                Text("Card",style: TextStyle(color: Colors.black87,
                    fontSize: 30,fontWeight: FontWeight.w500),),
                SizedBox(
                  height: 15,
                ),
                TabBar(
                  controller: _outerTabController,
                  dividerColor: Colors.white,
                  indicatorPadding: EdgeInsets.zero,
                  labelPadding: EdgeInsets.zero,
                  tabs: [
                    Tab(
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                          color: Colors.grey[200],
                        ),
                        child: Align(
                            alignment: Alignment.center,
                            child: Text('Credit',style: TextStyle(fontSize: 16,),)),
                      ),
                    ),
                    Tab(
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          color: Colors.grey[200],
                        ),
                        child: Align(
                            alignment: Alignment.center,
                            child: Text('debit',style: TextStyle(fontSize: 16,),)),
                      ),
                    )
                  ],
                ),
                Container(
                    height: 400,
                    child: TabBarView(
                      controller: _outerTabController,
                      children: [
                        //Credit Card
                        Container(
                          height: 400,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Container(
                                  height: 230,
                                  width: 390,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFF3A8DF0),
                                        Color(0xFF4A67D8),
                                        Color(0xFF8F63E8),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 15,bottom: 25),
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 50,
                                                width: 110,
                                                child: Stack(
                                                  children: [
                                                    Center(child: Text("VISA",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 28),))
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                height: 35,
                                                color: Colors.red,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 15),
                                        child: Container(
                                          height: 35,
                                          padding: EdgeInsets.symmetric(horizontal: 25),
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(color: Colors.transparent),
                                          ),
                                          child: TextField(
                                            controller: _numController,
                                            keyboardType: TextInputType.number,
                                            maxLength: 19,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              counterText: "", // To hide the counter
                                              hintText: "5142 - 8164 - 6526 - 2563",
                                              hintStyle: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 16,
                                              ),
                                            ),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              letterSpacing: 2.0,
                                            ),
                                          ),
                                        ),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(right: 25,left: 15),
                                        child: Container(
                                          height: 30,
                                          color: Colors.transparent,
                                          child: Row(
                                            children: [
                                              Text("Name",style: TextStyle(color: Colors.white,fontSize: 18),),
                                              SizedBox(
                                                width: 120,
                                              ),
                                              Text("Valid Till",style: TextStyle(color: Colors.white,fontSize: 18),),
                                              SizedBox(
                                                width: 45,
                                              ),
                                              Text("CVV",style: TextStyle(color: Colors.white,fontSize: 18),),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 35,
                                        color: Colors.transparent,
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 8),
                                              child: Container(
                                                  width: 165,
                                                  color: Colors.transparent,
                                                  child: TextField(
                                                    controller: _nameController,
                                                    decoration: InputDecoration(
                                                      hintText: 'Name',
                                                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                                                      hintStyle: TextStyle(color: Colors.grey),
                                                      border: InputBorder.none, // Remove the border
                                                      enabledBorder: InputBorder.none, // Remove the border when not focused
                                                      focusedBorder: InputBorder.none,
                                                    ),
                                                    style: TextStyle(
                                                        color: Colors.white
                                                    ),
                                                    keyboardType: TextInputType.name,
                                                    inputFormatters: [
                                                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')), // Restrict to letters and spaces
                                                      TextInputFormatter.withFunction(
                                                            (oldValue, newValue) => TextEditingValue(
                                                          text: newValue.text.toUpperCase(),
                                                          selection: newValue.selection,
                                                        ),
                                                      ),
                                                    ],
                                                  )

                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 5),
                                              child: Container(
                                                width: 90,
                                                child: TextField(
                                                  controller: _dateController,
                                                  decoration: InputDecoration(
                                                    hintText: 'Date',
                                                    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                                                    hintStyle: TextStyle(color: Colors.grey),
                                                    border: InputBorder.none,
                                                    enabledBorder: InputBorder.none,
                                                    focusedBorder: InputBorder.none,
                                                  ),
                                                  style: TextStyle(color: Colors.white),
                                                  keyboardType: TextInputType.name,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 20),
                                              child: Container(
                                                width: 70,
                                                color: Colors.transparent,
                                                child: TextField(
                                                  controller: _cvvController,
                                                  keyboardType: TextInputType.number,
                                                  obscureText: true,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    enabledBorder: InputBorder.none,
                                                    focusedBorder: InputBorder.none,
                                                    hintText: 'CVV',
                                                    hintStyle: TextStyle(color: Colors.grey),
                                                    contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                                    filled: true,
                                                    fillColor: Colors.transparent,
                                                  ),
                                                  style: TextStyle(color: Colors.white),
                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(3),
                                                    FilteringTextInputFormatter.digitsOnly,
                                                  ],
                                                ),

                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                      value: _isChecked,
                                      onChanged: _toggleCheckbox,
                                    checkColor: Colors.black,
                                  ),
                                  Text("Save info"),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap:(){
                                        Navigator.of(context).pop();
                                      },
                                      child: Container(
                                        height: 35,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.grey[200],
                                        ),
                                        child: Center(child: Text("Cancel Payment", style: TextStyle(fontSize: 17))),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: (){
                                        showOrderConfirmedDialog(context);
                                      },
                                      child: Container(
                                        height: 35,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.blue[800],
                                        ),
                                        child: Center(child: Text("Pay Now", style: TextStyle(color: Colors.white, fontSize: 17))),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),



                        //Debit Card
                        Container(
                          height: 500,
                          padding: EdgeInsets.all(0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20),
                              // Card Number
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Container(
                                  height: 230,
                                  width: 390,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFF2C3E50),
                                        Color(0xFF4C657D),
                                        Color(0xFF707B8C),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 15,bottom: 25),
                                          child: Container(
                                            height: 50,
                                            width: 110,
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  left: 10,
                                                  child: Container(
                                                    height: 50,
                                                    width: 60,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFEA001B), // MasterCard Red
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  right: 10,
                                                  child: Container(
                                                    height: 50,
                                                    width: 50,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFF79E1B), // MasterCard Yellow-Orange
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ),
                                                ),
                                                Center(child: Text("Master Card",style: TextStyle(color: Colors.white),))
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 15),
                                        child: Container(
                                          height: 35,
                                          padding: EdgeInsets.symmetric(horizontal: 25),
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(color: Colors.transparent),
                                          ),
                                          child: TextField(
                                            keyboardType: TextInputType.number,
                                            maxLength: 19,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              counterText: "", // To hide the counter
                                              hintText: "5142 - 8164 - 6526 - 2563",
                                              hintStyle: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 16,
                                              ),
                                            ),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              letterSpacing: 2.0,
                                            ),
                                          ),
                                        ),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(right: 25,left: 25),
                                        child: Container(
                                          height: 30,
                                          color: Colors.transparent,
                                          child: Row(
                                            children: [
                                              Text("Name",style: TextStyle(color: Colors.white,fontSize: 18),),
                                              SizedBox(
                                                width: 170,
                                              ),
                                              Text("Valid Till",style: TextStyle(color: Colors.white,fontSize: 18),)
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 35,
                                        color: Colors.transparent,
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 15),
                                              child: Container(
                                                  width: 210,
                                                  child: TextField(
                                                    decoration: InputDecoration(
                                                      hintText: 'Name',
                                                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                                                      hintStyle: TextStyle(color: Colors.grey),
                                                      border: InputBorder.none, // Remove the border
                                                      enabledBorder: InputBorder.none, // Remove the border when not focused
                                                      focusedBorder: InputBorder.none,
                                                    ),
                                                    style: TextStyle(
                                                        color: Colors.white
                                                    ),
                                                    keyboardType: TextInputType.name,
                                                    inputFormatters: [
                                                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')), // Restrict to letters and spaces
                                                      TextInputFormatter.withFunction(
                                                            (oldValue, newValue) => TextEditingValue(
                                                          text: newValue.text.toUpperCase(),
                                                          selection: newValue.selection,
                                                        ),
                                                      ),
                                                    ],
                                                  )

                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 15),
                                              child: Container(
                                                width: 100,
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                    hintText: 'Date',
                                                    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                                                    hintStyle: TextStyle(color: Colors.grey),
                                                    border: InputBorder.none,
                                                    enabledBorder: InputBorder.none,
                                                    focusedBorder: InputBorder.none,
                                                  ),
                                                  style: TextStyle(color: Colors.white),
                                                  keyboardType: TextInputType.name,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )


                                    ],
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    value: _isChecked,
                                    onChanged: _toggleCheckbox,
                                    checkColor: Colors.black,
                                  ),
                                  Text("Save info"),
                                ],
                              ),
                              // Buttons
                              Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap:(){
                                        Navigator.of(context).pop();
                                      },
                                      child: Container(
                                        height: 45,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                          color: Colors.grey[300],
                                        ),
                                        child: Center(child: Text("Cancel", style: TextStyle(fontSize: 17))),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: (){
                                        showOrderConfirmedDialog(context);
                                      },
                                      child: Container(
                                        height: 45,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                          color: Colors.blue[800],
                                        ),
                                        child: Center(child: Text("Pay Now", style: TextStyle(color: Colors.white, fontSize: 17))),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )

                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
