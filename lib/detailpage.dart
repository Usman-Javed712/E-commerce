import 'package:ecommerce/logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DiscriptionPage extends StatelessWidget {

  String itemName;

  String itemPrice;

  String itemImage;
  String description;
  String vari1;
  String vari2;
  String vari3;
  String discounted;
  String rating;
  String rate;

  DiscriptionPage({super.key,
    required this.itemPrice,
    required this.itemName,
    required this.itemImage,
    required this.description,
    required this.vari1,
    required this.vari2,
    required this.vari3,
    required this.discounted,
    required this.rating,
    required this.rate
  });


  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(builder: (context,value,child){
      return Scaffold(
        backgroundColor: Colors.grey[200],
        body: SafeArea(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 420,
                    color: Colors.grey[200],
                    child: Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        itemImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Container(
                      height: 60,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: (){
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.white
                                ),
                                child: Center(child: Icon(Icons.arrow_back_ios_new)),
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      Provider.of<AppModel>(context,listen: false).
                                      addItemToFav(itemImage,itemName,itemPrice,description,discounted);
                                    },
                                    child: Container(
                                      height: 45,
                                      width: 45,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: Colors.white
                                      ),
                                      child: Center(child: Icon(Icons.favorite,color: Colors.red,)),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Container(
                                    height: 45,
                                    width: 45,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.white
                                    ),
                                    child: Center(child: Icon(Icons.ios_share)),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20)
                      ),
                      color: Colors.white
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(itemName,style: TextStyle(
                                  color: Colors.black,fontSize: 30,fontWeight: FontWeight.w500
                              ),),
                              Container(
                                height: 40,
                                width: 90,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.red
                                ),
                                child: Center(child: Text("% On sale",style: TextStyle(color: Colors.white),)),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 45,
                              width: 90,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                      width: 1
                                  )
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.star,color: Colors.yellow,size: 25,),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(rating,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold))
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              height: 45,
                              width: 90,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                      width: 1
                                  )
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.thumb_up,color: Color(0xFF19C463),size: 25,),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(rate,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(description,style: TextStyle(
                            fontSize: 16,fontWeight: FontWeight.w500
                        ),),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 70,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 1
                                  )
                              ),
                              child: Center(child: Text(vari1,style: TextStyle(
                                  fontSize: 20
                              ),)),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 40,
                              width: 90,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 1
                                  )
                              ),
                              child: Center(child: Text(vari2,style: TextStyle(
                                  fontSize: 20
                              ),)),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 40,
                              width: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 1
                                  )
                              ),
                              child: Center(child: Text(vari3,style: TextStyle(
                                  fontSize: 20
                              ),)),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        Container(
                          height: 70,
                          color: Colors.transparent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "\$" + discounted,
                                      style: TextStyle(
                                        fontSize: 20,
                                        decoration: TextDecoration.lineThrough,
                                        decorationThickness: 2,
                                      ),
                                    ),

                                    Text("\$"+itemPrice.toString()+".00",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: (){
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: 
                                    Container(
                                      height: 80,
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                        color: Color(0xFF19C463),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(50),
                                              color: Color(0xFF19C463),
                                            ),
                                            child: Center(child: Icon(Icons.done,color: Colors.white,)),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text("Successfully added to cart",style: TextStyle(fontSize: 20),)
                                        ],
                                      ),
                                    ),
                                      dismissDirection: DismissDirection.down,
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor: Colors.transparent,
                                      elevation: 0,
                                      margin: EdgeInsets.only(
                                        bottom: MediaQuery.of(context).size.height-120,
                                        left: 10,
                                        right: 10
                                      ),
                                    )
                                  );
                                  Provider.of<AppModel>(context,listen: false).
                                  addItemToCart(itemImage,itemName,itemPrice);
                                },
                                child: Container(
                                  height: 60,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color(0xFF19C463),
                                  ),
                                  child: Center(child: Text("Add to Cart",style: TextStyle(color: Colors.white,
                                      fontSize: 25,fontWeight: FontWeight.w500),)),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
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
}
