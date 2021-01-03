import 'package:flutter/material.dart';
import 'package:flutter_simple_calculator/flutter_simple_calculator.dart';

class CalculatorScreenTwo extends StatefulWidget {
  @override
  _CalculatorScreenTwoState createState() => _CalculatorScreenTwoState();
}

class _CalculatorScreenTwoState extends State<CalculatorScreenTwo> {
  double _currentValue = 0;
  @override
  Widget build(BuildContext context) {
    var calc = SimpleCalculator(
        value: _currentValue,
        hideExpression: false,
        hideSurroundingBorder: true,
        onChanged: (key, value, expression) {
          setState(() {
            _currentValue = value;
          });
          print("$key\t$value\t$expression");
        },
        onTappedDisplay: (value, details) {
          print("$value\t${details.globalPosition}");
        });
    return Center(
      child: Padding(
        padding: EdgeInsets.only(bottom: 400),
        child: OutlineButton(
          child: Text(_currentValue.toString()),
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (BuildContext context) {
                  return Container(
                      height: MediaQuery.of(context).size.height * 0.75,
                      child: calc);
                });
          },
        ),
      ),
    );
  }
}
