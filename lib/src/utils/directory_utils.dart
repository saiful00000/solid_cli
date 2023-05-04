import 'dart:io';

import 'package:solid_cli/src/res/directori_paths.dart';

bool isInitialized() {
  for (var path in DirectoryPaths.solidPathMap.values) {
    final exist = Directory(path).existsSync();
    if (exist == false) {
      return false;
    }
  }
  return true;
}

bool isCleanInitialized() {
  for (var path in DirectoryPaths.cleanSolidPathMap.values) {
    final exist = Directory(path).existsSync();
    if (exist == false) {
      return false;
    }
  }

  return true;
}
