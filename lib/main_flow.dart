import 'package:flutter/material.dart';
import 'screens/calculator_screen_one.dart';
import 'screens/calculator_screen_two.dart';
import 'screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'screens/pdf_screen.dart';
import 'providers/app_provider.dart';

class MainFlow extends StatefulWidget {
  @override
  _MainFlowState createState() => _MainFlowState();
}

class _MainFlowState extends State<MainFlow> {
  final tabs = [
    HomeScreen(),
    CalculatorScreenOne(),
    CalculatorScreenTwo(),
    PDFScreen()
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);
    void onTappedBar(int index) {
      setState(() {
        appProvider.activeTabIndex = index;
      });
    }

    return Scaffold(
      body: IndexedStack(
        index: appProvider.activeTabIndex,
        children: tabs,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.16),
              spreadRadius: 1.0,
              blurRadius: 15.0)
        ]),
        height: 70.0,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: false,
            onTap: onTappedBar,
            currentIndex: appProvider.activeTabIndex,
            showSelectedLabels: false,
            unselectedItemColor: Color(0xFF49475A),
            selectedItemColor: Color(0xFF494750),
            iconSize: 25.0,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shield),
                label: 'CalculatorOne',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.calculate), label: "CalculatorTwo"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.picture_as_pdf), label: 'PDF')
            ],
          ),
        ),
      ),
    );
  }
}
