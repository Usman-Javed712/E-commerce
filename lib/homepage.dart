import 'package:ecommerce/cart.dart';
import 'package:ecommerce/detailpage.dart';
import 'package:ecommerce/items.dart';
import 'package:ecommerce/logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _outerTabController;

  @override
  void initState() {
    super.initState();
    _outerTabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _outerTabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(builder: (context,value,child){
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                height: 60,
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Discover",style: TextStyle(color: Colors.black87,
                          fontSize: 25,fontWeight: FontWeight.w500),),
                      Stack(
                        alignment: Alignment.topRight,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).push
                                (MaterialPageRoute(builder: (context)=>Cart()));
                            },
                            child: Container(
                              height: 53,
                              width: 53,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.white,
                                  border: Border.all(
                                      width: 0.7
                                  )
                              ),
                              child: Center(child: Icon(Icons.shopping_bag_outlined)),
                            ),
                          ),
                          value.cartItems.isEmpty?
                          Container():
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Color(0xFF19C463)
                            ),
                            child: Center(child: Text(value.cartItems.length.toString(),style: TextStyle(color: Colors.white),)),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 18,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Icon(Icons.search,size:35,),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 185,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFF19C463),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20,top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Clearance",style: TextStyle(color: Colors.white,
                                fontSize: 35,fontWeight: FontWeight.w400),),
                            Text("Sale",style: TextStyle(color: Colors.white,
                                fontSize: 35,fontWeight: FontWeight.w400),),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 40,
                              width: 130,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.white
                              ),
                              child: Center(
                                child: Text("% Up to 50%",style: TextStyle(
                                    color: Colors.green,fontSize: 18,fontWeight: FontWeight.w400
                                ),),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 200,
                      width: 170,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        image: DecorationImage(
                          image: AssetImage("assets/images/cover.png"),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Categories",style: TextStyle(color: Colors.black,
                        fontWeight: FontWeight.bold,fontSize: 23),),
                    Text("See all",style: TextStyle(color: Color(0xFF19C463),fontSize: 20))
                  ],
                ),
              ),
              TabBar(
                controller: _outerTabController,
                dividerColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20),
                unselectedLabelColor: Colors.black,
                indicatorPadding: EdgeInsets.zero,
                labelPadding: EdgeInsets.only(left: 5),
                labelColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF19C463),
                ),
                tabs: [
                  Tab(
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 1,
                            color: Colors.grey,
                          )
                      ),
                      child: Align(
                          alignment: Alignment.center,
                          child: Text('All',style: TextStyle(fontSize: 16,),)),
                    ),
                  ),
                  Tab(
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 1,
                            color: Colors.grey,
                          )
                      ),
                      child: Align(
                          alignment: Alignment.center,
                          child: Text('SmartPhones',style: TextStyle(fontSize: 16,),)),
                    ),
                  ),
                  Tab(
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 1,
                            color: Colors.grey,
                          )
                      ),
                      child: Align(
                          alignment: Alignment.center,
                          child: Text('Headphones',style: TextStyle(fontSize: 16,),)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                child: Container(
                  child: TabBarView(
                    controller: _outerTabController,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Container(
                            color: Colors.transparent,
                            child: Consumer<AppModel>(
                              builder:  (context,value,child){
                                return GridView.builder
                                  (gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 1/1.3
                                ),
                                    itemCount: value.shopItems.length,
                                    itemBuilder: (context,index){
                                      return Items(
                                        itemPrice: value.shopItems[index][0],
                                        itemName: value.shopItems[index][1],
                                        itemImage: value.shopItems[index][2],
                                        onPressed: (){
                                          Navigator.of(context).push(
                                              MaterialPageRoute(builder:
                                                  (context) => DiscriptionPage(
                                                itemPrice: value.shopItems[index][0],
                                                itemName: value.shopItems[index][1],
                                                itemImage: value.shopItems[index][2],
                                                description: value.shopItems[index][3],
                                                vari1: value.shopItems[index][4],
                                                vari2: value.shopItems[index][5],
                                                vari3: value.shopItems[index][6],
                                                discounted: value.shopItems[index][7],
                                                rating: value.shopItems[index][8],
                                                rate: value.shopItems[index][9],
                                              ))

                                          );
                                        },
                                      );
                                    });
                              },
                            )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Container(
                          color: Colors.transparent,
                          child: Consumer<AppModel>(
                            builder:  (context,value,child){
                              return GridView.builder
                                (gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 1/1.3
                              ),
                                  itemCount: value.mobileItems.length,
                                  itemBuilder: (context,index){
                                    return Items(
                                      itemPrice: value.mobileItems[index][0],
                                      itemName: value.mobileItems[index][1],
                                      itemImage: value.mobileItems[index][2],
                                      onPressed: (){
                                        Navigator.of(context).push(
                                            MaterialPageRoute(builder:
                                                (context) => DiscriptionPage(
                                              itemPrice: value.mobileItems[index][0],
                                              itemName: value.mobileItems[index][1],
                                              itemImage: value.mobileItems[index][2],
                                              description: value.mobileItems[index][3],
                                              vari1: value.mobileItems[index][4],
                                              vari2: value.mobileItems[index][5],
                                              vari3: value.mobileItems[index][6],
                                              discounted: value.mobileItems[index][7],
                                              rating: value.mobileItems[index][8],
                                              rate: value.mobileItems[index][9],
                                            ))

                                        );
                                      },
                                    );
                                  });
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Container(
                          color: Colors.transparent,
                          child: Consumer<AppModel>(
                            builder:  (context,value,child){
                              return GridView.builder
                                (gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 1/1.3
                              ),
                                  itemCount: value.headItems.length,
                                  itemBuilder: (context,index){
                                    return Items(
                                      itemPrice: value.headItems[index][0],
                                      itemName: value.headItems[index][1],
                                      itemImage: value.headItems[index][2],
                                      onPressed: (){
                                        Navigator.of(context).
                                        push(MaterialPageRoute(builder: (context)=> DiscriptionPage(
                                          itemPrice: value.headItems[index][0],
                                          itemName: value.headItems[index][1],
                                          itemImage: value.headItems[index][2],
                                          description: value.headItems[index][3],
                                          vari1: value.headItems[index][4],
                                          vari2: value.headItems[index][5],
                                          vari3: value.headItems[index][5],
                                          discounted: value.headItems[index][7],
                                          rating: value.headItems[index][8],
                                          rate: value.headItems[index][9],
                                        )));
                                      },

                                    );
                                  });
                            },
                          ),
                        ),
                      ),
                    ],
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
