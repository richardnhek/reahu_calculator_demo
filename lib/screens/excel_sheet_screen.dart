import 'dart:io';
import 'dart:typed_data';

import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as dartWidget;

class ExcelSheetScreen extends StatefulWidget {
  ExcelSheetScreen({this.defaultCellVal, this.fundCellVal});

  final int defaultCellVal;
  final int fundCellVal;

  @override
  _ExcelSheetScreenState createState() => _ExcelSheetScreenState();
}

class _ExcelSheetScreenState extends State<ExcelSheetScreen> {
  dartWidget.Document pdf = dartWidget.Document();

  @override
  void initState() {
    super.initState();
    initializeConversion();
  }

  void initializeConversion() async {
    await changeValueExcel();
    await Future.delayed(const Duration(milliseconds: 3000));
  }

  Future changeValueExcel() async {
    Directory appDocDir = await getExternalStorageDirectory();
    String appDocPath = appDocDir.path;
    print(appDocPath);
    ByteData data =
        await rootBundle.load("assets/excelsheets/exstructure.xlsx");
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);
    Sheet sheetObj = excel['Sheet1'];
    //Premium Payable Cells
    CellStyle defaultCellStyle = CellStyle(
        fontFamily: "Kano",
        bold: false,
        fontSize: 14,
        verticalAlign: VerticalAlign.Center,
        horizontalAlign: HorizontalAlign.Center);
    var cell1 = sheetObj.cell(CellIndex.indexByString('B3'));
    var cell2 = sheetObj.cell(CellIndex.indexByString('B4'));
    var cell3 = sheetObj.cell(CellIndex.indexByString('B5'));
    cell1.cellStyle = defaultCellStyle;
    cell2.cellStyle = defaultCellStyle;
    cell3.cellStyle = defaultCellStyle;
    cell1.value = widget.defaultCellVal;
    cell2.value = widget.defaultCellVal;
    cell3.value = widget.defaultCellVal;
    //

    //Total Fund Amount Cell
    CellStyle fundCellStyle = CellStyle(
        fontFamily: "Kano",
        bold: true,
        fontSize: 18,
        verticalAlign: VerticalAlign.Center,
        horizontalAlign: HorizontalAlign.Center);
    var fundCell = sheetObj.cell(CellIndex.indexByString('C6'));
    fundCell.value = widget.fundCellVal;
    fundCell.cellStyle = fundCellStyle;
    //

    //Save Changes Made in Excel
    excel.encode().then((onValue) {
      File(join(
          "/storage/emulated/0/Android/data/com.reahu.reahu_pdfproduct/files/excel_sheet.xlsx"))
        ..createSync(recursive: true)
        ..writeAsBytesSync(onValue);
    });
    //

    for (var table in excel.tables.keys) {
      print(table); //sheet Name
      print(excel.tables[table].maxCols);
      print(excel.tables[table].maxRows);
      for (var row in excel.tables[table].rows) {
        print("$row");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        width: 100,
        color: Colors.white,
        child: FloatingActionButton(
            onPressed: () => {
                  setState(() {}),
                }));
  }
}
