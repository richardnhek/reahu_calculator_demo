import 'package:flutter/material.dart';
import 'package:reahu_pdfproduct/providers/app_provider.dart';
import 'package:provider/provider.dart';
import 'package:reahu_pdfproduct/widgets/calculator_button.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return SafeArea(
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 12, right: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CalculatorButton(
                  calculatorTitle: "Premium Calculator",
                  calculatorImg: AssetImage("assets/insurance.png"),
                  calculatorDesc: "Calculate your plan",
                  calculatorOnTap: () => {
                        appProvider.activeTabIndex = 1,
                        Navigator.of(context).pushNamed('/main_flow')
                      }),
              CalculatorButton(
                calculatorTitle: "Ordinary Calculator",
                calculatorImg: AssetImage("assets/calculator.png"),
                calculatorDesc: "Simple calculator",
                calculatorOnTap: () => {
                  appProvider.activeTabIndex = 2,
                  Navigator.of(context).pushNamed('/main_flow')
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
