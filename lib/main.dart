import 'package:ecommerce/bottombar.dart';
import 'package:ecommerce/homepage.dart';
import 'package:ecommerce/logic.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

void main() async {

  await Hive.initFlutter();
  var box = await Hive.openBox('myBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context)=> AppModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: NavPage(),
      ),
    );
  }
}


