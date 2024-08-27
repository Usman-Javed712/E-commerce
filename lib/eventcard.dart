import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final child;
  const EventCard({super.key,required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25),
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color:  Color(0xFF19C463),
      ),
      child: child,
    );
  }
}
