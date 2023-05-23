import 'package:solid_cli/src/utils/file_util.dart';

class CodeContents {
  CodeContents._();

  static String getScreenContent({
    required String screenName,
    required String controllerName,
  }) {
    return '''
import '../controller/$controllerName.dart';
import 'package:flutter/material.dart';

class ${fileNameToClassName(screenName)} extends StatefulWidget {
  const ${fileNameToClassName(screenName)}({Key? key}) : super(key: key);

  @override
  State<${fileNameToClassName(screenName)}> createState() => _${fileNameToClassName(screenName)}State();
}

class _${fileNameToClassName(screenName)}State extends State<${fileNameToClassName(screenName)}> {

  /// Object of a controller 
  /// to separate businesses logic from UI logic
  ${fileNameToClassName(controllerName)}? _controller;

  @override
  void initState() {
  
    /// initialize the controller before use
    _controller = ${fileNameToClassName(controllerName)}(context: context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

    ''';
  }

  static String getControllerContent({required String controllerName}) {
    return '''
import 'package:flutter/material.dart';

class ${fileNameToClassName(controllerName)} {
  final BuildContext context;

  ${fileNameToClassName(controllerName)}({required this.context});

  /// TODO: implement your custom methods
}
    ''';
  }

  static String getRepositoryClassContent({
    required String fileName,
    required String interfaceName,
  }) {
    return """
import '$interfaceName.dart';

class ${fileNameToClassName(fileName)} extends ${fileNameToClassName(interfaceName)} {
  @override
  void exampleMethod() {
    // TODO: implement exampleMethod
  }

}
    """;
  }

  static String getRepositoryInterfaceContent({required String interfaceName}) {
    return '''
abstract class ${fileNameToClassName(interfaceName)} {
  void exampleMethod();
}
''';
  }
}
