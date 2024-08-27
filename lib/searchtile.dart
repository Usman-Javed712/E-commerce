import 'package:ecommerce/logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchTile extends StatelessWidget {
  String imagePath;
  String namemagePath;
  String pricePath;
  SearchTile({super.key,
  required this.imagePath,
    required this.namemagePath,
    required this.pricePath
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(builder: (context,value,child){
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          height: 290,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[200],
          ),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    height: 190,
                    width: double.infinity,
                    child: Image.asset(imagePath),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: Colors.grey
                          ),
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: Icon(Icons.favorite_outlined,
                        color: Colors.red,),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Divider(
                  thickness: 1,
                ),
              ),
              ListTile(
                title: Text(namemagePath,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                subtitle: Text("\$"+pricePath,style: TextStyle(fontSize: 18)),
                trailing: GestureDetector(
                  child: GestureDetector(
                    onTap: (){
                      Provider.of<AppModel>(context,listen: false).
                      addItemToCart(imagePath, namemagePath, pricePath);
                    },
                    child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                                width: 1,
                                color: Colors.grey
                            )
                        ),
                        child: Center(child: Icon(Icons.add,size: 30,color: Color(0xFF19C463),))),
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
