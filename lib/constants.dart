const List<String> _months = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December',
];

Function getMonth = (int timeStamp) {
  int month = new DateTime.fromMillisecondsSinceEpoch(timeStamp).month;
  var today = new DateTime.now();
  if (today.month == month) return 'This Month';
  if (today.month == month - 1) return 'Last Month';
  return _months[month - 1];
};

Function getDate = (int timeStamp, [asDay = false]) {
  var date = new DateTime.fromMillisecondsSinceEpoch(timeStamp);
  if (asDay) return '${date.day} ${_months[date.month - 1]}, ${date.year}';
  var today = new DateTime.now();
  int diff = today.difference(date).inDays;
  if (diff == 0) return 'Today';
  if (diff == 1) return 'Yesterday';
  return '${date.day} ${_months[date.month - 1]}, ${date.year}';
};

main(List<String> args) {
  print(getDate(new DateTime(2020, 12, 24).millisecondsSinceEpoch, false));
}
