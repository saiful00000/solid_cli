import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';

class CreateCleanCommand extends Command<int> {
  CreateCleanCommand({required Logger logger}) : _logger = logger {
    argParser
      ..addFlag(
        'screen',
        abbr: 's',
        help: '',
      )
      ..addFlag(
        'controller',
        abbr: 'c',
        help: '',
      )
      ..addFlag(
        'repository',
        abbr: 's',
        help: '',
      )
      ..addFlag(
        'service',
        abbr: 's',
        help: '',
      );
  }

  @override
  String get description => 'Create screen, controller, repository, widget, '
      'service, repository and more, specific to clean architecture';

  @override
  String get name => 'create-clean';

  final Logger _logger;

  @override
  Future<int> run() async {
    try {
      if (argResults?['screen'] == true) {
        return _createScreen(argResults?.rest.first);
      } else if (argResults?['controller'] == true) {
        return _createController(argResults?.rest.first);
      } else if (argResults?['repository'] == true) {
        return _createRepository(argResults?.rest.first);
      } else if (argResults?['service'] == true) {
        return _createService(argResults?.rest.first);
      }
    } catch (error, stck) {
      print('$error');
      print('$stck');
      _logger.err(error.toString());
    }
    return ExitCode.noPerm.code;
  }

  int _createScreen(String? screenName) {
    return 0;
  }

  int _createController(String? controllerName) {
    return 0;
  }

  int _createRepository(String? repositoryName) {
    return 0;
  }

  int _createService(String? serviceName) {
    return 0;
  }
}
