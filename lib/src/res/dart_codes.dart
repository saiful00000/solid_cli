class DartCodes {
  DartCodes._();

  static String getScreenCode(String screenName) => '''
import 'package:flutter/material.dart';

class ${screenName}Screen extends StatefulWidget {
  const ${screenName}Screen({Key? key}) : super(key: key);

  @override
  State<${screenName}Screen> createState() => _${screenName}ScreenState();
}

class _${screenName}ScreenState extends State<${screenName}Screen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      
    );
  }
}

''';
// static String screenCode = '''''';
}
