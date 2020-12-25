import 'package:flutter/material.dart';

// import '../theme.dart';

class LabelledTextBox extends StatelessWidget {
  final String label;
  final String hintText;
  final Function action;
  final int maxLines;
  final TextInputType keyboardType;

  const LabelledTextBox({
    Key key,
    @required this.label,
    @required this.hintText,
    this.action,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
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
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          TextFormField(
            keyboardType: keyboardType,
            maxLines: maxLines,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: Colors.grey.shade100,
                  width: 1.25,
                ),
              ),
            ),
            onChanged: action,
          ),
        ],
      ),
    );
  }
}
