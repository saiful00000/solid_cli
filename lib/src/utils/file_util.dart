import 'dart:io';

void createDartFile({required String directoryPath, required String fileName}) {
  final currentDir = Directory.current;
  final file = File('$directoryPath/$fileName.dart');
  file.writeAsStringSync(
    """
void main() {\n  print('Hello, world!');\n}\n""",
  );
  print('Dart file created successfully.');
}

// String getDartFileName(String str){
//   String name = '';
//   final wordList = str.split('_');
//   for(var word in wordList){
//     name += capFirst(word);
//   }
//   return name;
// }
//
// String capFirst(String str){
//   String word = '';
//
// }