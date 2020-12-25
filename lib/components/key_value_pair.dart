import 'package:flutter/material.dart';

class KeyValuePair extends StatelessWidget {
  final String title;
  final String value;
  final Widget trailing;

  const KeyValuePair({
    Key key,
    this.title,
    this.value,
    this.trailing,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Text(
            '$title:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Container(
              child: Text(value.length > 0 ? value : 'Unavailable'),
            ),
          ),
          if (trailing != null) trailing,
        ],
      ),
    );
  }
}
