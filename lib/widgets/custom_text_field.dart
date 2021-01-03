import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({this.formLabel, this.formInputType, this.formController});

  final String formLabel;
  final TextInputType formInputType;
  final TextEditingController formController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
      child: TextFormField(
        strutStyle: StrutStyle(fontSize: 16, height: 2),
        textAlignVertical: TextAlignVertical.bottom,
        cursorHeight: 25,
        controller: formController,
        decoration: InputDecoration(
            isDense: true,
            labelText: formLabel,
            labelStyle: TextStyle(
                fontFamily: "Kano",
                fontSize: 18,
                color: Colors.black.withOpacity(0.9))),
        keyboardType: formInputType,
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontFamily: "Biko",
        ),
        autovalidateMode: AutovalidateMode.always,
      ),
    );
  }
}
