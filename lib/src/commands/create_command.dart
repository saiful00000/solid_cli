import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:solid_cli/src/res/directori_paths.dart';
import 'package:solid_cli/src/utils/file_util.dart';

class CreateCommand extends Command<int> {
  CreateCommand({required Logger logger}) : _logger = logger {
    argParser.addFlag(
      'screen',
      negatable: false,
      abbr: 's',
      help: 'Create a screen contains controller and other necessary things',
    );
  }

  final Logger _logger;

  @override
  String get description => 'Create scree, service, or others';

  @override
  String get name => 'create';

  @override
  Future<int> run() async {
    try {
      if (argResults?['screen'] == true) {
        final fileName = argResults?.rest.first;

        if(fileName == null || fileName.isEmpty){
          _logger.err('No name provided. ex: solid create --screen name');
          return ExitCode.noPerm.code;
        }

        /// fist create directories for a screen
        final rootPath = DirectoryPaths.solidPathMap['screens'] ?? '';
        final uiPath = '$rootPath/ui';
        final controllerPath = '$rootPath/controller';
        final widgetPath = '$rootPath/widget';
        Directory(uiPath).createSync(recursive: true);
        Directory(controllerPath).createSync(recursive: true);
        Directory(widgetPath).createSync(recursive: true);

        createDartFile(
          directoryPath: uiPath,
          fileName: '${fileName}_screen',
        );

        createDartFile(
          directoryPath: controllerPath,
          fileName: '${fileName}_controller',
        );
      }
      return ExitCode.success.code;
    } catch (error, stck) {
      print('$error');
      print('$stck');
      return ExitCode.noPerm.code;
    }
  }
}
