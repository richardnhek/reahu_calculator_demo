import 'package:flutter/material.dart';

class AllYearChip extends StatelessWidget {
  AllYearChip({this.choiceSelected});
  final bool choiceSelected;

  @override
  Widget build(BuildContext context) {
    dynamic unselectedLabel = TextStyle(color: Color(0xFF8DD7F7));
    dynamic selectedLabel = TextStyle(color: Colors.white);

    return Padding(
      padding: EdgeInsets.only(left: 10, bottom: 10, right: 10),
      child: ChoiceChip(
        selected: choiceSelected,
        label: Text(
          "All Years",
          style: TextStyle(fontSize: 14, fontFamily: "Kano"),
        ),
        labelStyle: choiceSelected == false ? unselectedLabel : selectedLabel,
        pressElevation: 5.0,
        selectedColor: Color(0xFF8DD7F7),
        disabledColor: Colors.white,
        backgroundColor: Colors.white,
        elevation: 2.5,
        autofocus: true,
        onSelected: (bool) => {},
      ),
    );
  }
}
