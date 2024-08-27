import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardTile extends StatelessWidget {
  bool obsecure;
  String number;
  String name;
  String date;
  String cvv;

  CardTile({super.key, required this.obsecure, required this.number, required this.name, required this.date, required this.cvv});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 230,
        width: 390,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              Color(0xFF3A8DF0),
              Color(0xFF4A67D8),
              Color(0xFF8F63E8),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 25),
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 110,
                      child: Stack(
                        children: [
                          Center(child: Text("VISA", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 28),))
                        ],
                      ),
                    ),
                    Container(
                      height: 35,
                      color: Colors.red,
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Container(
                height: 35,
                padding: EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.transparent),
                ),
                child: Text(
                  number,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    letterSpacing: 2.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25, left: 25),
              child: Container(
                height: 30,
                color: Colors.transparent,
                child: Row(
                  children: [
                    Text("Name", style: TextStyle(color: Colors.white, fontSize: 18),),
                    SizedBox(
                      width: 170,
                    ),
                    Text("Valid Till", style: TextStyle(color: Colors.white, fontSize: 18),)
                  ],
                ),
              ),
            ),
            Container(
              height: 35,
              color: Colors.transparent,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Container(
                      width: 210,
                      child: Text(
                        name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Container(
                      width: 100,
                      child: Text(
                        date,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
