import 'package:flutter/material.dart';

import '../theme.dart';

class LabelledTextBox extends StatelessWidget {
  final String label;
  final String hintText;
  final Function action;
  final int maxLines;
  final TextInputType keyboardType;
  final Function validator;

  const LabelledTextBox({
    Key key,
    @required this.label,
    @required this.hintText,
    this.action,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    this.validator,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              label,
              style: kInputLabelTextStyle,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          TextFormField(
            keyboardType: keyboardType,
            maxLines: maxLines,
            validator: validator,
            decoration: kInputDecorationStyle,
            onChanged: action,
          ),
        ],
      ),
    );
  }
}
