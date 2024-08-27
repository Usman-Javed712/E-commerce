import 'package:ecommerce/cards.dart';
import 'package:ecommerce/orderhistory.dart';
import 'package:ecommerce/track.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Profile",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 292,
            width: double.infinity,
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                Container(
                  height: 170,
                  width: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey[200]
                  ),
                  child: Center(child: Icon(Icons.person,size: 100,)),
                  // child: Image.asset("assets.images/profile.png",
                  // fit: BoxFit.fill,),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("John Doe",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
              ],
            ),
          ),
          Container(
            height: 410,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.grey[200],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25)
              )
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                ListTile(
                  leading: Icon(Icons.person,color: Colors.grey[500],size: 25,),
                  title: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text("Edit Profile",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey[500],size: 20,),
                ),
                ListTile(
                  leading: Icon(Icons.location_on,color: Colors.grey[500],size: 25,),
                  title: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text("Shopping Address",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey[500],size: 20,),
                ),
                ListTile(
                  leading: Icon(Icons.favorite_outline,color: Colors.grey[500],size: 25,),
                  title: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text("WishList",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey[500],size: 20,),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OrderHistory()));
                  },
                  child: ListTile(
                    leading: Icon(Icons.history_edu,color: Colors.grey[500],size: 25,),
                    title: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text("Order History",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey[500],size: 20,),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.notifications_none_outlined,color: Colors.grey[500],size: 25,),
                  title: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text("Notification",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey[500],size: 20,),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Cards()));
                  },
                  child: ListTile(
                    leading: Icon(Icons.credit_card,color: Colors.grey[500],size: 25,),
                    title: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text("Cards",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey[500],size: 20,),
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}
