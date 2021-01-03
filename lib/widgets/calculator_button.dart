import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  CalculatorButton(
      {this.calculatorTitle,
      this.calculatorImg,
      this.calculatorDesc,
      this.calculatorOnTap});

  final String calculatorTitle;
  final AssetImage calculatorImg;
  final String calculatorDesc;
  final Function calculatorOnTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: 160,
      height: 160,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.16),
                spreadRadius: 5,
                blurRadius: 5)
          ]),
      child: GestureDetector(
        onTap: calculatorOnTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(calculatorTitle,
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Kano",
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF8DD7F7))),
            Image(
              image: calculatorImg,
              width: 60,
              height: 60,
            ),
            Text(
              calculatorDesc,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: "Kano",
                  fontStyle: FontStyle.italic,
                  color: Colors.black.withOpacity(0.5)),
            )
          ],
        ),
      ),
    );
  }
}
