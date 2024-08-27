import 'package:flutter/material.dart';

class OrderTile extends StatelessWidget {

  String imagePath;
  String namePath;
  String pricePath;
  OrderTile({super.key,required this.imagePath,required this.namePath,required this.pricePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 120,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey[200],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Image.asset(imagePath),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10,left: 20),
                  child: Text(namePath,style: TextStyle(color: Colors.black,fontSize: 25),),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10,left: 20),
                  child: Text("\$"+pricePath,style: TextStyle(color: Colors.black,fontSize: 25),),
                ),
              ],
            )
          ],
        ),
      ),
    );;
  }
}
