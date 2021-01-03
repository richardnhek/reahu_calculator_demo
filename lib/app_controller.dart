import 'package:flutter/material.dart';
import 'package:reahu_pdfproduct/main_flow.dart';
import 'package:reahu_pdfproduct/screens/excel_sheet_screen.dart';
import 'screens/pdf_screen.dart';
import 'screens/home_screen.dart';
import 'screens/splash_screen.dart';

class AppController extends StatefulWidget {
  @override
  _AppControllerState createState() => _AppControllerState();
}

class _AppControllerState extends State<AppController> {
  final Map<String, Widget> routes = {
    "/": SplashScreen(),
    "/main_flow": MainFlow(),
    "/home": HomeScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: "/",
        onGenerateRoute: (RouteSettings settings) {
          Route screen;
          switch (settings.name) {
            case "/excel_screen":
              {
                Map<String, dynamic> args = settings.arguments;
                int premium = args["premiumNum"];
                int fund = args["fundNum"];
                screen = MaterialPageRoute(
                  settings: settings,
                  builder: (_) => ExcelSheetScreen(
                    defaultCellVal: premium,
                    fundCellVal: fund,
                  ),
                );
                break;
              }
            case "/pdf_screen":
              {
                screen = MaterialPageRoute(
                  settings: settings,
                  builder: (_) => PDFScreen(
                      // defaultCellVal: premium,
                      // fundCellVal: fund,
                      ),
                );
                break;
              }

            default:
              {
                screen = MaterialPageRoute(
                  settings: settings,
                  builder: (BuildContext context) {
                    return routes[settings.name];
                  },
                );
                break;
              }
          }
          return screen;
        });
  }
}
