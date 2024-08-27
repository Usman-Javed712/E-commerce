import 'package:ecommerce/favitems.dart';
import 'package:ecommerce/logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavPage extends StatefulWidget {
  const FavPage({super.key});

  @override
  State<FavPage> createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(builder: (context,value,child){
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("Favorites",style: TextStyle
            (fontSize: 25,fontWeight: FontWeight.bold),),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: value.favtItems.isEmpty? Center(
          child: Container(
            child: Image.asset(
              'assets/images/empty.png',
              height: 400,
              width: 400,),
          ),
        ) :ListView.builder(
            itemCount: value.favtItems.length,
            itemBuilder: (context,index){
              return Favitems(
                imagePath: value.favtItems[index][0],
                namePath: value.favtItems[index][1],
                pricePath: value.favtItems[index][2],
                onPressed: (){
                  Provider.of<AppModel>
                    (context, listen: false).removeItemFromFav(index);
                },
              );
            }),
      );
    });
  }
}
