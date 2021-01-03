import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pdf/widgets.dart' as dartWidget;

class AppProvider extends ChangeNotifier {
  int _activeTabIndex = 0;
  int get activeTabIndex => _activeTabIndex;
  set activeTabIndex(int i) {
    _activeTabIndex = i;
    notifyListeners();
  }

  // bool _finishedLoading = false;
  // bool get finishedLoading => _finishedLoading;
  // set finishedLoading(bool t) {
  //   _finishedLoading = t;
  //   notifyListeners();
  // }

  int _choiceValue = 15;
  int get choiceValue => _choiceValue;
  set choiceValue(int i) {
    _choiceValue = i;
    notifyListeners();
  }

  int _defaultCellValue = 0;
  int get defaultCellValue => _defaultCellValue;
  set defaultCellValue(int i) {
    _defaultCellValue = i;
    notifyListeners();
  }

  int _fundAmount = 0;
  int get fundAmount => _fundAmount;
  set fundAmount(int f) {
    _fundAmount = f;
    notifyListeners();
  }

  dartWidget.Document _pdfDoc;
  dartWidget.Document get pdfDoc => _pdfDoc;
  set pdfDoc(dartWidget.Document doc) {
    pdfDoc = doc;
    notifyListeners();
  }

  Map<Permission, PermissionStatus> _permissions = {
    Permission.notification: PermissionStatus.undetermined,
    Permission.storage: PermissionStatus.undetermined,
  };
  Map<Permission, PermissionStatus> get permissions => _permissions;
  Future<void> requestPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.notification,
      Permission.storage,
    ].request();

    _permissions = statuses;
    print(_permissions);
    notifyListeners();
  }

  void setAppOrientation() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }
}
