import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:flutter/widgets.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:reahu_pdfproduct/providers/app_provider.dart';
import 'package:reahu_pdfproduct/screens/pdf_screen_ui.dart';
import 'package:provider/provider.dart';

class PDFScreen extends StatefulWidget {
  @override
  _PDFScreenState createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> {
  @override
  void initState() {
    super.initState();
    getPDF();
  }

  final pdf = pw.Document();
  final file = File(
      "/storage/emulated/0/Android/data/com.reahu.reahu_pdfproduct/files/test.pdf");

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    int defaultCellVal = appProvider.defaultCellValue;
    int choiceCellVal = appProvider.choiceValue;
    int fundCellVal = appProvider.fundAmount;
    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Container(
                child: pw.Column(children: [
              pw.Center(
                child: pw.Text("Calculated Total Fund",
                    style: pw.TextStyle(
                      fontSize: 22,
                      fontWeight: pw.FontWeight.bold,
                    )),
              ),
              pw.SizedBox(height: 25),
              pw.Center(
                child: pw.Table(
                    border: pw.TableBorder.ex(
                        horizontalInside: pw.BorderSide(),
                        verticalInside: pw.BorderSide(),
                        bottom: pw.BorderSide(),
                        left: pw.BorderSide(),
                        right: pw.BorderSide(),
                        top: pw.BorderSide()),
                    defaultVerticalAlignment:
                        pw.TableCellVerticalAlignment.middle,
                    children: [
                      pw.TableRow(children: [
                        pw.Center(
                          child: pw.Text("Year No.",
                              textAlign: pw.TextAlign.center,
                              style: pw.TextStyle(
                                  fontSize: 14,
                                  fontBold: pw.Font.timesBold(),
                                  fontWeight: pw.FontWeight.bold)),
                        ),
                        pw.Center(
                          child: pw.Text("Premium Payable",
                              textAlign: pw.TextAlign.center,
                              style: pw.TextStyle(
                                  fontSize: 14,
                                  fontBold: pw.Font.timesBold(),
                                  fontWeight: pw.FontWeight.bold)),
                        ),
                        pw.Center(
                          child: pw.Text("Total Fund Amount",
                              textAlign: pw.TextAlign.center,
                              style: pw.TextStyle(
                                  fontSize: 14,
                                  fontBold: pw.Font.timesBold(),
                                  fontWeight: pw.FontWeight.bold)),
                        )
                      ]),
                      pw.TableRow(children: [
                        pw.Center(
                          child: pw.Text("1",
                              textAlign: pw.TextAlign.center,
                              style: pw.TextStyle(fontSize: 12)),
                        ),
                        pw.Center(
                          child: pw.Text("$defaultCellVal",
                              style: pw.TextStyle(fontSize: 12)),
                        ),
                        pw.Center(
                            child:
                                pw.Text("-", style: pw.TextStyle(fontSize: 12)))
                      ]),
                      pw.TableRow(children: [
                        pw.Center(
                          child: pw.Text("2",
                              textAlign: pw.TextAlign.center,
                              style: pw.TextStyle(fontSize: 12)),
                        ),
                        pw.Center(
                          child: pw.Text("$defaultCellVal",
                              style: pw.TextStyle(fontSize: 12)),
                        ),
                        pw.Center(
                            child:
                                pw.Text("-", style: pw.TextStyle(fontSize: 12)))
                      ]),
                      pw.TableRow(children: [
                        pw.Center(
                          child: pw.Text("3",
                              textAlign: pw.TextAlign.center,
                              style: pw.TextStyle(fontSize: 12)),
                        ),
                        pw.Center(
                          child: pw.Text("$defaultCellVal",
                              style: pw.TextStyle(fontSize: 12)),
                        ),
                        pw.Center(
                            child:
                                pw.Text("-", style: pw.TextStyle(fontSize: 12)))
                      ]),
                      pw.TableRow(
                          verticalAlignment:
                              pw.TableCellVerticalAlignment.middle,
                          children: [
                            pw.Center(
                              child: pw.Text("$choiceCellVal",
                                  textAlign: pw.TextAlign.center,
                                  style: pw.TextStyle(fontSize: 12)),
                            ),
                            pw.Center(
                              child: pw.Text(
                                  "${defaultCellVal * choiceCellVal}",
                                  textAlign: pw.TextAlign.center,
                                  style: pw.TextStyle(fontSize: 12)),
                            ),
                            pw.Center(
                                child: pw.Text("$fundCellVal",
                                    textAlign: pw.TextAlign.center,
                                    style: pw.TextStyle(fontSize: 12)))
                          ]),
                    ]),
              )
            ])),
          ); // Center
        }));
    return PDFScreenUI();
  }

  Future getPDF() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    savePDF(file, pdf);
  }

  Future savePDF(File file, pw.Document pdf) async {
    await file.writeAsBytes(pdf.save());
  }
}
