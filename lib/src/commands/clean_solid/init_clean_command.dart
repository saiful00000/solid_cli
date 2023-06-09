import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:solid_cli/src/res/directori_paths.dart';

class InitCleanCommand extends Command<int> {
  InitCleanCommand({required Logger logger}) : _logger = logger;

  @override
  String get description => 'Initialize solid principle with clean '
      'architectural design pattern.';

  @override
  String get name => 'init-clean';

  final Logger _logger;

  @override
  Future<int> run() async {
    var output = 'Initialized SOLID with clean architecture.';

    DirectoryPaths.cleanInitDirectoryPathsList.forEach((pathMap) {
      pathMap.values.forEach((pathString) {
        Directory(pathString).createSync(recursive: true);
      });
    });


    _logger.success(output);
    return ExitCode.success.code;
  }
}
