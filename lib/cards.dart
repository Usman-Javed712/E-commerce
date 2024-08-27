import 'package:ecommerce/cardtile.dart';
import 'package:ecommerce/logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Cards extends StatefulWidget {
  const Cards({super.key});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {

  bool obsecure = true;

  void showText() {
    setState(() {
      obsecure = !obsecure;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap:(){
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey[200]
                          ),
                          child: Center(child: Icon(Icons.arrow_back)),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text("Your Cards",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),
                      SizedBox(
                        width: 100,
                      ),
                      GestureDetector(
                        onTap: showText,
                        child: Container(
                          height: 40,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blue,
                          ),
                          child: Center(child: Text("Reveal",style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold),)),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 500,
                  child: Consumer<AppModel>(builder: (context,value,child){
                    return ListView.builder(
                        itemCount: value.addcard.length,
                        itemBuilder: (context,index){
                          return CardTile(
                              obsecure: obsecure,
                              number:value.addcard[index][0],
                              name: value.addcard[index][1],
                              date: value.addcard[index][2],
                              cvv: value.addcard[index][3]
                          );
                        });
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
