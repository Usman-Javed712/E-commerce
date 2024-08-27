import 'package:ecommerce/logic.dart';
import 'package:ecommerce/ordertile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({super.key});

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {


  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(builder: (context,value,child){
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(child: Icon(Icons.arrow_back)),
                    ),
                  ),
                  SizedBox(
                    width: 90,
                  ),
                  Text("YOUR ORDERS",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20),),
                  SizedBox(
                    width: 90,
                  ),
                  GestureDetector(
                    onTap: (){
                      Provider.of<AppModel>(context,listen: false).clearorders();
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 1,
                          color: Colors.grey
                        )
                      ),
                      child: Center(child: Text("Clear")),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),

              Container(
                height: 600,
                child: ListView.builder(
                  itemCount: value.myOrders.length,
                    itemBuilder: (context,index){
                    return OrderTile(
                        imagePath: value.myOrders[index][0],
                        namePath: value.myOrders[index][1],
                        pricePath: value.myOrders[index][2]
                    );
                    }),
              )
            ],
          ),
        ),
      );
    });
  }
}
