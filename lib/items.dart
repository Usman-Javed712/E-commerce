import 'package:flutter/material.dart';

class Items extends StatelessWidget {

  String itemName;
  String itemPrice;
  String itemImage;
  void Function()? onPressed;
  Items({super.key,required this.itemPrice,required this.itemName,required this.itemImage,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: 200,
          width: 180,
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[200],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    itemImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              SizedBox(
                height: 5,
              ),
              Text(itemName,style: TextStyle(color: Colors.grey[400],
                  fontSize: 17),),
              SizedBox(
                height: 5,
              ),
              Text("\$"+itemPrice.toString()+".00",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,
                  fontSize: 19))
            ],
          ),
        ),
      ),
    );
  }
}
