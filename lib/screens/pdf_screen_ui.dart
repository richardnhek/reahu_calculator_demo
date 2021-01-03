import 'dart:io';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFScreenUI extends StatefulWidget {
  @override
  _PDFScreenUIState createState() => _PDFScreenUIState();
}

class _PDFScreenUIState extends State<PDFScreenUI> {
  File file = File(
      "/storage/emulated/0/Android/data/com.reahu.reahu_pdfproduct/files/test.pdf");
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    showPDF();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: _isLoading == true
              ? Center(child: CircularProgressIndicator())
              : SafeArea(
                  child: SfPdfViewer.file(
                    file,
                    pageSpacing: 0,
                  ),
                )),
    );
  }

  Future showPDF() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    getPDF();
  }

  Future getDirectory() async {}

  Future getPDF() async {
    file = File(
        "/storage/emulated/0/Android/data/com.reahu.reahu_pdfproduct/files/test.pdf");
    setState(() {
      _isLoading = false;
    });
  }
}
