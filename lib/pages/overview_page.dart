// import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../models/Transaction.dart';
import '../theme.dart';
import '../constants.dart';
import '../data/database.dart';

class OverviewPage extends StatefulWidget {
  @override
  _OverviewPageState createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  // Random _random = new Random();
  int _touchedIndex = 0;
  double total;
  bool isLoading;
  bool isMonthly;
  Transactions db;
  Map<String, double> categories;
  @override
  void initState() {
    isLoading = true;
    isMonthly = true;
    categories = {};
    db = new Transactions();
    initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    if (!isMonthly) {
                      setState(() {
                        isMonthly = true;
                      });
                      initData();
                    }
                  },
                  child: Container(
                    width: isMonthly ? 130 : 115,
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 15.0,
                    ),
                    margin: const EdgeInsets.all(8.0),
                    decoration: isMonthly ? kTitleBoxDecoration : null,
                    child: Center(child: Text('This month')),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (isMonthly) {
                      setState(() {
                        isMonthly = false;
                      });
                      initData();
                    }
                  },
                  child: Container(
                    width: !isMonthly ? 130 : 80,
                    padding: const EdgeInsets.all(8.0),
                    decoration: !isMonthly ? kTitleBoxDecoration : null,
                    child: Center(child: Text('All time')),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Center(
                child: isLoading
                    ? CircularProgressIndicator()
                    : /* total == 0
                        ? Center(
                            child: Text(
                              'No expenses to show!',
                              style: kInfoTextStyle,
                            ),
                          )
                        : */
                    PieChart(
                        PieChartData(
                          // Todo: Implement chart touch.
                          pieTouchData:
                              PieTouchData(touchCallback: (pieTouchResponse) {
                            setState(() {
                              if (pieTouchResponse.touchInput
                                      is FlLongPressEnd ||
                                  pieTouchResponse.touchInput is FlPanEnd) {
                                _touchedIndex = -1;
                              } else {
                                _touchedIndex =
                                    pieTouchResponse.touchedSectionIndex;
                              }
                            });
                          }),
                          borderData: FlBorderData(show: false),
                          centerSpaceRadius: 20,
                          sections: getSections(),
                        ),
                      ),
              ),
            ),
            GridView.count(
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 3.8,
              shrinkWrap: true,
              children: kCategories
                  .map(
                    (category) => ListTile(
                      dense: true,
                      horizontalTitleGap: 0,
                      leading: Container(
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: category.elementAt(2),
                        ),
                      ),
                      title: Text(category.elementAt(0)),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
              child: Text(
                'Expense By Category',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GridView.count(
              padding: const EdgeInsets.all(8.0),
              crossAxisCount: 2,
              physics: NeverScrollableScrollPhysics(),
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              shrinkWrap: true,
              children: getExpenseByCategory(),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> getSections() {
    List<dynamic> category;
    final List<PieChartSectionData> sections = [];

    int index = 0;
    double percentage = 0;
    if (total == 0) {
      sections.add(
        PieChartSectionData(
          radius: 105,
          color: Colors.blue.shade100,
          value: 1,
          title: 'No expense',
        ),
      );
    } else
      for (String key in categories.keys) {
        category = getCategory(key);
        percentage = (categories[key] / total) * 100;
        sections.add(
          PieChartSectionData(
            radius: _touchedIndex == index ? 105 : 100,
            color: category.elementAt(2),
            value: categories[key],
            title: percentage > 4 ? '${percentage.toStringAsFixed(1)}%' : '',
            titleStyle: TextStyle(
              fontSize: _touchedIndex == index ? 11 : 10,
            ),
          ),
        );
      }
    return sections;
  }

  List<Widget> getExpenseByCategory() {
    List<Widget> expenses = [];
    List<dynamic> category;
    for (String key in categories.keys) {
      category = getCategory(key);
      expenses.add(
        Container(
          decoration: BoxDecoration(
            color: category.elementAt(2).withOpacity(0.15),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                category.elementAt(1),
                size: 30,
                color: category.elementAt(2),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                total != 0
                    ? '${((categories[key] / total) * 100).toStringAsFixed(1)}%'
                    : '0%',
                style: kInfoTextStyle.copyWith(
                  fontSize: 11,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                '₹${categories[key].toStringAsFixed(1)}',
                style: kAmountTextStyle.copyWith(
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ),
      );
    }
    return expenses;
  }

  /// Initiate the transactions data.
  void initData() async {
    setState(() {
      isLoading = true;
    });
    List<TransactionData> data = [];
    if (isMonthly) {
      var now = new DateTime.now();
      data = await db.getAllTransactionsSince(
        new DateTime(now.year, now.month, 1).millisecondsSinceEpoch,
      );
    } else
      data = await db.getAllTransactions();
    // for (var i = 0; i < (isMonthly ? 20 : 50); i++) {
    //   data.add(
    //     new TransactionData(
    //       title: getRandomString(5),
    //       category: kCategories.elementAt(_random.nextInt(6)).elementAt(0),
    //       description: getRandomString(10),
    //       amount: _random.nextDouble() * 100,
    //       timeStamp: _random.nextInt(16999999),
    //     ),
    //   );
    // }
    for (var category in kCategories) categories[category.elementAt(0)] = 0;
    total = 0;
    for (var item in data) {
      if (item.amount < 0) {
        categories[item.category] =
            categories[item.category] + item.amount.abs();
        total += item.amount.abs();
      }
    }

    setState(() {
      isLoading = false;
    });
  }

  // var _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

  // String getRandomString(int length) => String.fromCharCodes(
  //       Iterable.generate(
  //         length,
  //         (_) => _chars.codeUnitAt(
  //           _random.nextInt(_chars.length),
  //         ),
  //       ),
  //     );
}
