import 'package:expense_tracker/components/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';
import 'add_transaction_page.dart';
import 'overview_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  PageController _pageController;
  @override
  void initState() {
    _pageController = new PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          HomePage(),
          OverviewPage(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _currentIndex,
        onChange: (index) {
          setState(
            () {
              _currentIndex = index;
              _pageController.animateToPage(
                index,
                duration: Duration(milliseconds: 200),
                curve: Curves.easeIn,
              );
            },
          );
        },
        navItems: <CustomBottomNavigationBarItem>[
          CustomBottomNavigationBarItem(
            icon: Icons.house_rounded,
            title: 'Home',
            color: Colors.purple,
          ),
          CustomBottomNavigationBarItem(
            icon: Icons.pie_chart,
            title: 'Brief',
            color: Colors.orange,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () async {
          bool value = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddTransactionPage(),
                ),
              ) ??
              false;
          if (value)
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Transaction added!'),
                duration: Duration(seconds: 2),
              ),
            );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
