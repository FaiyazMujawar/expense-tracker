import 'package:flutter/material.dart';

final List<Map<String, dynamic>> kOptions = [
  {
    'LifeStyle': Icon(
      Icons.weekend,
      color: Colors.pink.shade900,
    ),
  },
  {
    'Education': Icon(
      Icons.school_rounded,
      color: Colors.blueGrey,
    ),
  },
  {
    'Healthcare': Icon(
      Icons.healing_rounded,
      color: Colors.redAccent.shade700,
    ),
  },
  {
    'Travel Expenses': Icon(
      Icons.directions_boat_rounded,
      color: Colors.blueAccent.shade400,
    ),
  },
  {
    'Food & Beverages': Icon(
      Icons.fastfood_rounded,
      color: Colors.yellow.shade700,
    ),
  },
  {
    'Other': Icon(
      Icons.attach_money_rounded,
      color: Colors.green.shade600,
    ),
  },
];

final List<List<dynamic>> kCategories = [
  [
    'LifeStyle',
    Icons.weekend,
    Colors.pink.shade900,
  ],
  [
    'Education',
    Icons.school_rounded,
    Colors.blueGrey,
  ],
  [
    'Healthcare',
    Icons.healing_rounded,
    Colors.redAccent.shade700,
  ],
  [
    'Travel Expenses',
    Icons.directions_boat_rounded,
    Colors.blueAccent.shade400,
  ],
  [
    'Food & Beverages',
    Icons.fastfood_rounded,
    Colors.yellow.shade700,
  ],
  [
    'Other',
    Icons.attach_money_rounded,
    Colors.green.shade600,
  ],
];

List<dynamic> getCategory(String title) {
  for (var category in kCategories) {
    if (category.elementAt(0) == title) return category;
  }
  return null;
}

const List<String> _months = [
  'Jan',
  'Feb',
  'Mar',
  'April',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sept',
  'Oct',
  'Nov',
  'Dec',
];

String getMonth(int timeStamp) {
  int month = new DateTime.fromMillisecondsSinceEpoch(timeStamp).month;
  var today = new DateTime.now();
  if (today.month == month) return 'This Month';
  if (today.month == month - 1) return 'Last Month';
  return _months[month - 1];
}

String getDate(int timeStamp, [asDay = false]) {
  var date = new DateTime.fromMillisecondsSinceEpoch(timeStamp);
  if (asDay) return '${date.day} ${_months[date.month - 1]}, ${date.year}';
  var today = new DateTime.now();
  int diff = today.difference(date).inDays;
  if (diff == 0) return 'Today';
  if (diff == 1) return 'Yesterday';
  return '${date.day} ${_months[date.month - 1]}, ${date.year}';
}
