import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reahu_pdfproduct/app_controller.dart';
import 'providers/app_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => AppProvider())],
        child: AppController());
  }
}
