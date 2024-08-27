import 'package:ecommerce/eventcard.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class Tile extends StatefulWidget {
  final bool isFirst;
  final bool isLast;
  final bool isFPast;
  final Widget eventCard;

  Tile({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.isFPast,
    required this.eventCard
  });

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    Color tileColor = widget.isFPast ? Color(0xFF19C463) : Colors.grey;

    return SizedBox(
      height: 250,
      child: TimelineTile(
        isFirst: widget.isFirst,
        isLast: widget.isLast,
        beforeLineStyle: LineStyle(color: tileColor),

        indicatorStyle: IndicatorStyle(
            width: 30,
            color: tileColor,
            iconStyle: IconStyle(
                iconData: Icons.done,
                color: widget.isFPast ? Colors.white : Colors.black
            )
        ),
        endChild: EventCard(
          child: widget.eventCard,
        ),
      ),
    );
  }
}
