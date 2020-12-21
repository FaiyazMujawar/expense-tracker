import 'package:expense_tracker/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'add_transaction.dart';

class CustomFloatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: RaisedButton(
        elevation: 5,
        padding: const EdgeInsets.all(15),
        shape: kRoundedButton,
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              MaterialIcons.add,
              color: Colors.white,
            ),
            SizedBox(
              width: 10,
            ),
            FittedBox(
              child: Text(
                'NEW TRANSACTION',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            builder: (context) => AddTransaction(),
          );
        },
      ),
    );
  }
}
