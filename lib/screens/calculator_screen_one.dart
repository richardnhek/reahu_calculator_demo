import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:reahu_pdfproduct/widgets/custom_text_field.dart';
import 'package:reahu_pdfproduct/widgets/year_chips.dart';
import 'package:reahu_pdfproduct/providers/app_provider.dart';
import 'package:provider/provider.dart';

class CalculatorScreenOne extends StatefulWidget {
  @override
  _CalculatorScreenOneState createState() => _CalculatorScreenOneState();
}

class _CalculatorScreenOneState extends State<CalculatorScreenOne> {
  TextEditingController currentAgeController = new TextEditingController();
  TextEditingController premiumPayableController = new TextEditingController();
  int fundAmountResult;
  final pdf = pw.Document();
  final file = File(
      "/storage/emulated/0/Android/data/com.reahu.reahu_pdfproduct/files/test.pdf");

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    showAlertDialog(BuildContext context) {
      AlertDialog alert = AlertDialog(
        // contentPadding: EdgeInsets.all(10),
        title: Center(
            child: Container(
          child: Text(
            "Not Eligible",
            style: TextStyle(
                fontFamily: "Biko", fontSize: 20, fontWeight: FontWeight.bold),
          ),
        )),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(
            height: 40,
          ),
          Center(
              child: Text(
            "Not Allowed For Individual" + "\n" + "Under 18 Years Old",
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: "Kano", fontSize: 16),
          )),
        ]),
        actions: [
          FlatButton(
            child: Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      );

      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.white,
        // appBar: AppBar(
        //   backgroundColor: Color(0xFF8DD7F7),
        //   shape: ContinuousRectangleBorder(
        //     borderRadius: const BorderRadius.only(
        //         bottomLeft: Radius.circular(10.0),
        //         bottomRight: Radius.circular(10.0)),
        //   ),
        //   automaticallyImplyLeading: false,
        //   elevation: 5,
        //   centerTitle: true,
        //   title: Text(
        //     "Premium Calculator",
        //     style: TextStyle(
        //         fontSize: 24, fontFamily: "Biko", color: Colors.white),
        //   ),
        // ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 110),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Fund Amount",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        fontFamily: "Kano"),
                  ),
                ),
                CustomTextField(
                  formLabel: "Current Age",
                  formInputType: TextInputType.number,
                  formController: currentAgeController,
                ),
                CustomTextField(
                  formLabel: "Premium Payable",
                  formInputType: TextInputType.number,
                  formController: premiumPayableController,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 10, left: 10),
                  child: Text(
                    "Policy Term",
                    style: TextStyle(fontFamily: "Kano", fontSize: 18),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    YearChip(
                      choiceTitle: "15 Years",
                      choiceSelected:
                          appProvider.choiceValue == 15 ? true : false,
                      choiceValue: 15,
                    ),
                    YearChip(
                      choiceTitle: "20 Years",
                      choiceSelected:
                          appProvider.choiceValue == 20 ? true : false,
                      choiceValue: 20,
                    ),
                    YearChip(
                      choiceTitle: "25 Years",
                      choiceSelected:
                          appProvider.choiceValue == 25 ? true : false,
                      choiceValue: 25,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Container(
                    width: double.maxFinite,
                    height: 50,
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: RaisedButton(
                      onPressed: () => {
                        setState(() {
                          appProvider.defaultCellValue =
                              getPremium(premiumPayableController.text);
                          appProvider.fundAmount = getFundAmount(
                              getPremium(premiumPayableController.text),
                              appProvider.choiceValue);
                        }),
                        if (getAge(currentAgeController.text) >= 18)
                          {
                            appProvider.activeTabIndex = 3,
                            Navigator.of(context).pushNamed("/main_flow")
                          }
                        else
                          {showAlertDialog(context)}
                      },
                      elevation: 2.5,
                      textColor: Colors.white,
                      color: Color(0xFF8DD7F9),
                      child: Text(
                        "Calculate & Generate PDF",
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Kano",
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Container(
                    width: double.maxFinite,
                    height: 50,
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: RaisedButton(
                      onPressed: () => {
                        setState(() {
                          currentAgeController.clear();
                          premiumPayableController.clear();
                          appProvider.choiceValue = 15;
                        })
                      },
                      elevation: 2.5,
                      textColor: Colors.white,
                      color: Colors.redAccent.shade100,
                      child: Text(
                        "Reset",
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Kano",
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  int getFundAmount(int p, int y) {
    fundAmountResult = (y * p) + (y * 500 * 41);
    return fundAmountResult;
  }

  int getAge(String age) {
    var ageNum = int.parse(age);
    return ageNum;
  }

  int getPremium(String premium) {
    var premiumNum = int.parse(premium);
    return premiumNum;
  }
}
