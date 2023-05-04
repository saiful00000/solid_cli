import 'dart:io';

import 'package:mason_logger/mason_logger.dart';
import 'package:solid_cli/src/res/app_strings.dart';
import 'package:solid_cli/src/res/directori_paths.dart';
import 'package:solid_cli/src/utils/project_type_util.dart';

class InitValidator {
  InitValidator({required Logger logger}) : _logger = logger;

  final Logger _logger;

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

  bool validateInitialization({required ProjectType type}) {
    switch (type) {
      case ProjectType.none:
        return false;
      case ProjectType.solid:
        if (isInitialized()) {
          return true;
        } else {
          if (isCleanInitialized()) {
            _logger.warn(
              '''
Your project is initialized with Clean architecture. Please do command for clean architecture.
Or see documentation on ${AppStrings.documentationUrl}''',
            );
          } else {
            _logger.warn(
              '''
You must initialize you project before try to creating resources.
Or see documentation on ${AppStrings.documentationUrl}''',
            );
          }
          return false;
        }
      case ProjectType.cleanSolid:
        if (isCleanInitialized()) {
          return true;
        } else {
          if (isInitialized()) {
            _logger.warn(
              '''
Your project is initialized with basic SOLID architecture. Please do command for SOLID architecture.
Or see documentation on ${AppStrings.documentationUrl}''',
            );
          } else {
            _logger.warn(
              '''
You must initialize you project before try to creating resources.
Or see documentation on ${AppStrings.documentationUrl}''',
            );
          }
          return false;
        }
    }
  }
}
