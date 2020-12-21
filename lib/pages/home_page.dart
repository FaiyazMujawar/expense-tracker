import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../components/custom_floating_action_button.dart';
import '../components/amount.dart';
import '../components/transaction_tile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    setExpenses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Consumer(
            builder: (context, transactions, child) => ListView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                SizedBox(
                  height: size.width * 0.4,
                  width: size.width,
                  child: Amount(
                    title: 'Total Balance',
                    amount:
                        transactions.totalIncome - transactions.totalExpense,
                    color: Colors.purple.shade500,
                    icon: MaterialIcons.account_balance_wallet,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: size.width * 0.4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Amount(
                          title: 'Income',
                          amount: transactions.totalIncome,
                          color: Colors.green.shade600,
                          icon: MaterialIcons.arrow_downward,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Amount(
                          title: 'Expense',
                          amount: transactions.totalExpense,
                          color: Colors.red.shade600,
                          icon: MaterialIcons.arrow_upward,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'RECENT TRANSACTIONS',
                  style: GoogleFonts.robotoCondensed(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ...transactions.latestTransactions
                    .map(
                      (transaction) => Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TransactionTile(
                          title: transaction['title'],
                          date: transaction['date'],
                          amount: transaction['amount'].toDouble(),
                        ),
                      ),
                    )
                    .toList(),
              ],
            ),
          ),
        ),
        floatingActionButton: CustomFloatingActionButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  void setExpenses() async {}
}
