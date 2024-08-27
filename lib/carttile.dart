import 'package:ecommerce/logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CartTile extends StatefulWidget {
  String imagePath;
  String namePath;
  String pricePath;
  void Function()? onPressed;
  final int index;
  CartTile({super.key,required this.imagePath,
    required this.namePath,required this.pricePath,required this.onPressed,
    required this.index,});

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {

  int one =1;
  late int price;
  int? productprice;

  void numChange(String operation) {
    setState(() {
      if (operation == '-') {
        if (one > 0) {
          one -= 1;
        }
      } else if (operation == '+') {
        one += 1;
      }
      updatePrice();
    });
  }



  void updatePrice() {
    setState(() {
      productprice =(one*int.parse(widget.pricePath)).toInt();
    });
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<AppModel>(context, listen: false)
          .pricelist(widget.pricePath, widget.index);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(builder: (context,value,child){
      return Column(
        children: [
          Container(
            height: 130,
            width: double.infinity,
            color: Colors.transparent,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey[300],
                    ),
                    child: Image.asset(widget.imagePath),
                  ),
                ),
                Expanded(
                    child: Column(
                      children: [
                        Container(
                          height: 55,
                          color: Colors.transparent,
                          child: ListTile(
                            title: Text(widget.namePath,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                            subtitle: Text("1 TB"),
                            trailing: Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: GestureDetector(
                                  onTap: widget.onPressed,
                                  child: Icon(Icons.close)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              productprice != null ? "\$${productprice.toString()}" : ("\$"+widget.pricePath),
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              child: GestureDetector(
                                onTap: () {
                                  numChange("-");
                                  if (productprice != null) {
                                    Provider.of<AppModel>(context, listen: false)
                                        .pricelist(productprice.toString(), widget.index);
                                  }
                                },
                                child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            width: 1
                                        )
                                    ),
                                    child: Center(
                                        child: Text("-",style: TextStyle(fontSize: 25)))),
                              ),),
                            SizedBox(
                              width: 15,
                            ),
                            Text(one.toString(),style: TextStyle(fontSize: 20),),
                            SizedBox(
                              width: 15,
                            ),
                            GestureDetector(
                              onTap: () {
                                numChange("+");
                                if (productprice != null) {
                                  Provider.of<AppModel>(context, listen: false)
                                      .pricelist(productprice.toString(),widget.index);
                                }
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    width: 1,
                                    color: Color(0xFF19C463),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "+",
                                    style: TextStyle(fontSize: 20, color: Color(0xFF19C463)),
                                  ),
                                ),
                              ),
                            ),

                          ],
                        )
                      ],
                    )
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Divider(
              thickness: 1,
            ),
          )
        ],
      );
    });
  }
}
