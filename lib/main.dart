import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/TransactionsContext.dart';
import 'pages/home_page.dart';
// import 'pages/add_transaction_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TransactionsContext(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Tracker',
      // home: AddTransactionPage(),
      home: HomePage(),
    );
  }
}
