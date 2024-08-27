import 'package:ecommerce/logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Favitems extends StatelessWidget {
  String imagePath;
  String namePath;
  String pricePath;
  void Function()? onPressed;
  Favitems({super.key,
    required this.imagePath,
    required this.namePath,
    required this.pricePath,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(builder: (context,value,child){
      return Column(
        children: [
          Container(
            height: 170,
            width: double.infinity,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey
                    ),
                    child: Align(
                        alignment: Alignment.center,
                        child: Image.asset(imagePath)),
                  ),
                ),
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Container(
                            height: 50,
                            child: ListTile(
                              title: Text(namePath,style: TextStyle(fontSize: 20,color: Colors.black),),
                              trailing: GestureDetector(
                                  onTap: onPressed,
                                  child: Icon(Icons.close,size: 20,)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text("\$"+pricePath.toString()+".00",style: TextStyle(fontSize: 20,color: Colors.black)),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: GestureDetector(
                            onTap: (){
                              Provider.of<AppModel>(context,listen: false).
                              addItemToCart(imagePath,namePath,pricePath);
                            },
                            child: Container(
                              height: 50,
                              width: 180,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xFF19C463),
                              ),
                              child: Center(child: Text("Buy Now",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
                            ),
                          ),
                        )
                      ],
                    )
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              thickness: 1,
            ),
          )
        ],
      );
    });
  }
}
