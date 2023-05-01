import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:path/path.dart' as path;
import 'package:solid_cli/src/res/directori_paths.dart';
import 'package:solid_cli/src/utils/file_util.dart';

class CreateCommand extends Command<int> {
  CreateCommand({required Logger logger}) : _logger = logger {
    argParser
      ..addFlag(
        'screen',
        negatable: false,
        abbr: 's',
        help: 'Create a screen contains controller and other necessary things',
      );
      // ..addFlag(
      //   'service',
      //   negatable: false,
      //   abbr: 'svc',
      //   help: '''
      //         Create a service module consists of an
      //         interface and an implementation class.
      //         ''',
      // );
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
        return _createScreen(argResults?.rest.first);
      }
    } catch (error, stck) {
      print('$error');
      print('$stck');
    }

    return ExitCode.noPerm.code;
  }

  int _createScreen(String? screenName) {

    if (screenName == null || screenName.isEmpty) {
      _logger.err('No name provided. ex: solid create --screen name');
      return ExitCode.noPerm.code;
    }

    /// create screen related directories
    DirectoryPaths.screenPathMap(screenName: screenName).forEach((key, value) {
      Directory(value).createSync(recursive: true);
        if(key != 'widget'){
          createDartFile(
            directoryPath: value,
            fileName: '${screenName}_$key',
            fileContents: '',
          );
        }
    });

    return ExitCode.success.code;
  }

}
