import 'package:flutter/material.dart';

import 'circular_background_icon.dart';
import '../theme.dart';

class ColoredTitle extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;

  const ColoredTitle({
    Key key,
    this.icon,
    this.title,
    this.color,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: color.withOpacity(0.1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null)
            CircularBackGroundIcon(
              icon: icon,
              color: color,
              size: 6.5,
            ),
          SizedBox(
            width: 8,
          ),
          Text(
            title,
            style: kAmountTitleTextStyle,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
