import 'package:ecommerce/tile.dart';
import 'package:flutter/material.dart';

class TimeTile extends StatefulWidget {
  const TimeTile({super.key});

  @override
  State<TimeTile> createState() => _TimeTileState();
}

class _TimeTileState extends State<TimeTile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Track Order',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.close,color: Colors.black87,),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: ListView(
          children: [
            Tile(
              isFirst: true,
              isLast: false,
              isFPast: true,
              eventCard: Text("Your Order has Placed",
                style: TextStyle(color: Colors.white,
                    fontWeight: FontWeight.bold,fontSize: 17),),
            ),
            Tile(
              isFirst: false,
              isLast: false,
              isFPast: false,
              eventCard: Text("Your Order has Shipped",
                style: TextStyle(color: Colors.white,
                    fontWeight: FontWeight.bold,fontSize: 17),),
            ),
            Tile(
              isFirst: false,
              isLast: true,
              isFPast: false,
              eventCard: Text("Order Received",
                style: TextStyle(color: Colors.white,
                    fontWeight: FontWeight.bold,fontSize: 17),),
            ),
          ],
        ),
      ),
    );
  }
}
