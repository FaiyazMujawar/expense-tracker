import 'package:flutter/material.dart';

class OptionTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const OptionTile({
    Key key,
    this.title,
    this.icon,
    this.color,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: color,
          ),
          SizedBox(
            width: 30,
          ),
          Text(
            title,
          )
        ],
      ),
    );
  }
}
