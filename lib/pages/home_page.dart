import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../components/amount.dart';
import '../components/transaction_tile.dart';
import '../models/TransactionsContext.dart';
import 'add_transaction_page.dart';
import 'all_transactions.dart';
// import '../components/add_transaction.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Consumer<TransactionsContext>(
            builder: (context, transactions, child) {
              return ListView(
                physics: BouncingScrollPhysics(),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "TODAY'S TRANSACTIONS",
                        style: GoogleFonts.robotoCondensed(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AllTransactionsPage(),
                            ),
                          );
                        },
                        child: Text(
                          'View All',
                          style: TextStyle(
                            color: Colors.purple,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  if (transactions.latestTransactions.length == 0)
                    Container(
                      padding: const EdgeInsets.all(15),
                      child: Center(
                        child: Text(
                          'No transactions',
                          style: TextStyle(
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ),
                    )
                  else
                    ...transactions.latestTransactions
                        .map(
                          (transaction) => Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: TransactionTile(
                              data: transaction,
                            ),
                          ),
                        )
                        .toList(),
                  SizedBox(
                    height: size.height * 0.1,
                  )
                ],
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddTransactionPage(),
              ),
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
