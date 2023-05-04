import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:solid_cli/src/res/directori_paths.dart';
import 'package:solid_cli/src/utils/file_util.dart';
import 'package:solid_cli/src/utils/project_type_util.dart';
import 'package:solid_cli/src/validators/init_validator.dart';

class CreateCleanCommand extends Command<int> {
  CreateCleanCommand(
      {required Logger logger, required InitValidator initValidator})
      : _logger = logger,
        _initValidator = initValidator {
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
        'model',
        abbr: 'm',
        help: '',
      )
      ..addFlag(
        'repository',
        abbr: 'r',
        help: '',
      )
      ..addFlag(
        'service',
        help: '',
      );
  }

  @override
  String get description => 'Create screen, controller, repository, widget, '
      'service, repository and more, specific to clean architecture';

  @override
  String get name => 'create-clean';

  /// used for logging messages to the console
  final Logger _logger;

  /// Validator to validate project initialization
  final InitValidator _initValidator;

  @override
  Future<int> run() async {
    try {
      var initialized = _initValidator.validateInitialization(
        type: ProjectType.cleanSolid,
      );

      if(!initialized){
        return ExitCode.cantCreate.code;
      }

      if (argResults?['screen'] == true) {
        return _createScreen(argResults?.rest.first);
      } else if (argResults?['controller'] == true) {
        return _createController(argResults?.rest.first);
      } else if (argResults?['model'] == true) {
        return _createModel(argResults?.rest.first);
      } else if (argResults?['repository'] == true) {
        return _createRepository(argResults?.rest.first);
      } else if (argResults?['service'] == true) {
        return _createService(argResults?.rest.first);
      }
    } catch (error, stck) {
      _logger
        ..err(error.toString())
        ..err(stck.toString());
    }
    return ExitCode.noPerm.code;
  }

  int _createScreen(String? screenName) {
    if (screenName == null || screenName.isEmpty) {
      _logger.err(
        'No name provided. Please provide name of your screen.'
        ' ex: solid create-clean --screen screen_name',
      );
    }

    DirectoryPaths.getCleanScreenSpecificPaths(screenName!)
        .forEach((key, directoryPath) {
      Directory(directoryPath).createSync(recursive: true);
      if (key != 'widget') {
        createDartFile(
          directoryPath: directoryPath,
          fileName: '${screenName}_$key',
          fileContents: '',
        );
      }
    });

    _logger.success(
      '$screenName screen created successfully.',
    );

    return ExitCode.success.code;
  }

  int _createController(String? controllerName) {
    if (controllerName == null || controllerName.isEmpty) {
      _logger.err(
        'No name provided. Please provide name of your controller.'
        ' ex: solid create-clean --controller controller_name',
      );
    }

    DirectoryPaths.getCleanControllerSpecificPaths(controllerName!)
        .forEach((key, value) {
      Directory(value).createSync(recursive: true);
      createDartFile(
        directoryPath: value,
        fileName: '${controllerName}_$key',
        fileContents: '',
      );
    });

    _logger.success(
      '$controllerName controller created successfully.',
    );

    return ExitCode.success.code;
  }

  int _createModel(String? modelName) {
    if (modelName == null || modelName.isEmpty) {
      _logger.err('No name provided. Please provide name of your controller.'
          ' ex: solid create-clean --controller controller_name,');
    }

    DirectoryPaths.getCleanModelSpecificPaths(modelName!).forEach((key, value) {
      Directory(value).createSync(recursive: true);
      createDartFile(
        directoryPath: value,
        fileName: '${modelName}_$key',
        fileContents: '',
      );
    });

    _logger.success(
      '$modelName model created successfully.',
    );

    return ExitCode.success.code;
  }

  int _createRepository(String? repositoryName) {
    if (repositoryName == null || repositoryName.isEmpty) {
      _logger.err(
          'No name provided. Please provide name of your repository. ex: solid create-clean --repository repository_name');
    }

    DirectoryPaths.getCleanRepositorySpecificPaths(repositoryName!)
        .forEach((key, directoryPath) {
      Directory(directoryPath).createSync(recursive: true);
      createDartFile(
        directoryPath: directoryPath,
        fileName: '${repositoryName}_$key',
        fileContents: '',
      );
    });

    _logger.success(
      '$repositoryName repository created successfully.',
    );

    return ExitCode.success.code;
  }

  int _createService(String? serviceName) {
    if (serviceName == null || serviceName.isEmpty) {
      _logger.err(
          'No name provided. Please provide name of your service. ex: solid create-clean --service');
    }

    DirectoryPaths.getCleanServiceSpecificPaths(serviceName!)
        .forEach((key, directoryPath) {
      Directory(directoryPath).createSync(recursive: true);
      createDartFile(
        directoryPath: directoryPath,
        fileName: '${serviceName}_$key',
        fileContents: '',
      );
    });

    _logger.success(
      '$serviceName service created successfully.',
    );

    return ExitCode.success.code;
  }
}
