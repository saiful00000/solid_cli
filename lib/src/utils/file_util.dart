import 'dart:io';

void createDartFile(
    {required String directoryPath,
    required String fileName,
    required String fileContents}) {
  final currentDir = Directory.current;
  final file = File(
    '$directoryPath/$fileName.dart',
  )..writeAsStringSync(
      fileContents,
    );
}
