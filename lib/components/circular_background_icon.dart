import 'package:flutter/material.dart';

class CircularBackGroundIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double size;

  const CircularBackGroundIcon({Key key, this.icon, this.color, this.size = 8})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(size),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: color,
        size: size * 3,
      ),
    );
  }
}
