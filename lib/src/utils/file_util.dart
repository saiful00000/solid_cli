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

String fileNameToClassName(String fileName) {
  final words = fileName.split('_');

  for (var i = 0; i < words.length; i++) {
    final word = words[i];
    final firstLetter = word.substring(0, 1).toUpperCase();
    final remainingLetters = word.substring(1);
    words[i] = '$firstLetter$remainingLetters';
  }

  return words.join();
}
