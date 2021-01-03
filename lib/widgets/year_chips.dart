import 'package:flutter/material.dart';
import 'package:reahu_pdfproduct/providers/app_provider.dart';
import 'package:provider/provider.dart';

class YearChip extends StatelessWidget {
  YearChip({this.choiceTitle, this.choiceValue, this.choiceSelected});

  final String choiceTitle;
  final int choiceValue;
  final bool choiceSelected;
  @override
  Widget build(BuildContext context) {
    dynamic unselectedLabel = TextStyle(color: Color(0xFF8DD7F7));
    dynamic selectedLabel = TextStyle(color: Colors.white);
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: ChoiceChip(
        selected: choiceSelected,
        label: Text(
          choiceTitle,
          style: TextStyle(fontSize: 14, fontFamily: "Kano"),
        ),
        labelStyle: choiceSelected == false ? unselectedLabel : selectedLabel,
        pressElevation: 5.0,
        selectedColor: Color(0xFF8DD7F7),
        disabledColor: Colors.white,
        backgroundColor: Colors.white,
        elevation: 1.5,
        autofocus: true,
        onSelected: (bool) => {appProvider.choiceValue = choiceValue},
      ),
    );
  }
}
