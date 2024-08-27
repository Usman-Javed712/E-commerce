import 'package:ecommerce/cart.dart';
import 'package:ecommerce/logic.dart';
import 'package:ecommerce/searchtile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with SingleTickerProviderStateMixin {

  late TabController _outerTabController;

  late AppModel myClass = AppModel();


  @override
  void initState() {
    super.initState();
    final myClass = Provider.of<AppModel>(context, listen: false);
    print("Shop Items: ${myClass.shopItems}");
    print("Mobile Items: ${myClass.mobileItems}");
    print("Head Items: ${myClass.headItems}");

    _allItems = [...myClass.shopItems, ...myClass.mobileItems, ...myClass.headItems];
    print("All Items: $_allItems");
    print("Total number of items in All Items: ${_allItems.length}");

    _founditems = _allItems;

    _outerTabController = TabController(length: 3, vsync: this);
  }



  @override
  void dispose() {
    _outerTabController.dispose();
    super.dispose();
  }

  List<dynamic> _founditems = [];
  List<dynamic> _allItems = [];

  void _runFilter(String enteredKeyword) {
    List<dynamic> results = [];

    if (enteredKeyword.isEmpty) {
      results = _allItems;
    } else {
      results = _allItems.where((item) {
        return item[1].toString().toLowerCase().contains(enteredKeyword.toLowerCase());
      }).toList();
    }

    setState(() {
      _founditems = results;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(builder: (context, value, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                    height: 80,
                    width: double.infinity,
                    child: Row(
                      children: [
                        SizedBox(width: 150),
                        Text(
                          "Search",
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(width: 90),
                        Stack(
                          alignment: Alignment.topRight,
                          children: [
                            GestureDetector(
                              onTap: (){
                                Navigator.of(context).push
                                  (MaterialPageRoute(builder: (context)=>Cart()));
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(width: 0.9, color: Colors.grey),
                                ),
                                child: Center(child: Icon(Icons.shopping_cart_outlined)),
                              ),
                            ),
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
                  Container(
                    height: 50,
                    width: double.infinity,
                    child: TextField(
                      onChanged: (value) => _runFilter(value),
                      decoration: InputDecoration(
                        hintText: 'Search',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                      ),
                    ),
                  ),
                  TabBar(
                    controller: _outerTabController,
                    dividerColor: Colors.white,
                    indicatorColor: Colors.white,
                    labelPadding: EdgeInsets.zero,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    indicatorPadding: EdgeInsets.all(2),
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xFF19C463),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    tabs: [
                      Tab(
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(width: 1, color: Colors.grey),
                          ),
                          child: Center(child: Text("All")),
                        ),
                      ),
                      Tab(
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(width: 1, color: Colors.grey),
                          ),
                          child: Center(child: Text("Smartphone")),
                        ),
                      ),
                      Tab(
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(width: 1, color: Colors.grey),
                          ),
                          child: Center(child: Text("Headphones")),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 600,
                    child: TabBarView(
                      controller: _outerTabController,
                      children: [
                        Container(
                          height: 610,
                          child: ListView.builder(
                            itemCount: _founditems.length,
                            itemBuilder: (context, index) {
                              return SearchTile(
                                imagePath: _founditems[index][2],
                                namemagePath: _founditems[index][1],
                                pricePath: _founditems[index][0],
                              );
                            },
                          ),
                        ),
                        Container(
                          height: 610,
                          child: ListView.builder(
                            itemCount: value.mobileItems.length,
                            itemBuilder: (context, index) {
                              return SearchTile(
                                imagePath: value.mobileItems[index][2],
                                namemagePath: value.mobileItems[index][1],
                                pricePath: value.mobileItems[index][0],
                              );
                            },
                          ),
                        ),
                        Container(
                          height: 610,
                          child: ListView.builder(
                            itemCount: value.headItems.length,
                            itemBuilder: (context, index) {
                              return SearchTile(
                                imagePath: value.headItems[index][2],
                                namemagePath: value.headItems[index][1],
                                pricePath: value.headItems[index][0],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
