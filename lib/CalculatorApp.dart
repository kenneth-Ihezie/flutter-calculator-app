import 'package:calculator_app/Theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'CalculatorScreen.dart';
import 'ResultScreen.dart';

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator",
      theme: defaultTargetPlatform == TargetPlatform.iOS
          ? KIOSTheme : KDefaultTheme,
      home: CalculatorScreen(),
      routes: <String, WidgetBuilder>{
        '/a': (BuildContext context) => NewScreen()
      },
    );
  }
}
