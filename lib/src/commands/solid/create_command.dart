import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:solid_cli/src/res/directori_paths.dart';
import 'package:solid_cli/src/utils/file_util.dart';
import 'package:solid_cli/src/utils/project_type_util.dart';
import 'package:solid_cli/src/validators/init_validator.dart';

class CreateCommand extends Command<int> {
  CreateCommand({required Logger logger, required InitValidator initValidator})
      : _logger = logger,
        _initValidator = initValidator {
    argParser
      ..addFlag(
        'screen',
        negatable: false,
        abbr: 's',
        help: 'Create a screen contains controller and other necessary things',
      )
      ..addFlag(
        'model',
        negatable: false,
        abbr: 'm',
        help: 'Create a controller',
      )
      ..addFlag(
        'service',
        negatable: false,
        help: '''
              Create a service module consists of an
              interface and an implementation class.
              ''',
      )
      ..addFlag(
        'repository',
        abbr: 'r',
        negatable: false,
        help: '''
              Create a repository module consists of an
              interface and an implementation class.
              ''',
      );
  }

  /// used for logging messages to the console
  final Logger _logger;

  /// Validator to validate project initialization
  final InitValidator _initValidator;

  @override
  String get description => 'Create scree, service, repositories and  others';

  @override
  String get name => 'create';

  @override
  Future<int> run() async {
    try {
      var initialized = _initValidator.validateInitialization(
        type: ProjectType.solid,
      );

      if (!initialized) {
        return ExitCode.cantCreate.code;
      }

      if (argResults?.rest.isEmpty ?? false) {
        _logger.warn('''
Resource name is not given, please provide resource name.
ex: solid create --service service_name
          ''');
        return ExitCode.noInput.code;
      }

      if (argResults?['screen'] == true) {
        return _createScreen(argResults?.rest.first);
      } else if (argResults?['model'] == true) {
        return _createModel(argResults?.rest.first);
      } else if (argResults?['service'] == true) {
        return _createService(argResults?.rest.first);
      } else if (argResults?['repository'] == true) {
        return _createRepository(argResults?.rest.first);
      }
    } catch (error, stck) {
      print('$error');
      print('$stck');
    }

    return ExitCode.noPerm.code;
  }

  /// responsible for creating all necessary directories and dart files
  /// related to a screen module in dart, such like the Screen widget,
  /// a controller file etc.
  int _createScreen(String? screenName) {
    if (screenName == null || screenName.isEmpty) {
      _logger.err('No name provided. ex: solid create --screen name');
      return ExitCode.noPerm.code;
    }

    /// create screen related directories
    DirectoryPaths.screenPathMap(screenName: screenName).forEach(
      (key, value) {
        /// create the directory
        Directory(value).createSync(recursive: true);
        if (key != 'widget') {
          /// create required dart files
          createDartFile(
            directoryPath: value,
            fileName: '${screenName}_$key',
            fileContents: '',
          );
        }
      },
    );

    _logger.success('$screenName screen created successfully.');

    return ExitCode.success.code;
  }

  int _createModel(String? screenName) {
    if (screenName == null || screenName.isEmpty) {
      _logger.err(
          'No name provided. ex: solid create --model model_name');
      return ExitCode.noPerm.code;
    }

    /// create screen related directories
    DirectoryPaths.controllerPathMap(screenName: screenName).forEach(
      (key, value) {
        /// create the directory
        Directory(value).createSync(recursive: true);

        /// create required dart files
        createDartFile(
          directoryPath: value,
          fileName: '${screenName}_$key',
          fileContents: '',
        );
      },
    );

    _logger.success('$screenName model created successfully.');

    return ExitCode.success.code;
  }

  /// creates an Interface and an implementation file required
  /// to represent a service
  int _createService(String? serviceName) {
    if (serviceName == null || serviceName.isEmpty) {
      _logger.err(
        'No name provided for the service. Ex: solid create --service '
        'service_name',
      );
      return ExitCode.noPerm.code;
    }

    DirectoryPaths.servicePathMap(
      serviceName: serviceName,
    ).forEach((key, servicePath) {
      /// create the service directory with provided [serviceName]
      Directory(servicePath).createSync(recursive: true);

      /// create required dart files for the service [serviceName]
      /// create the interface
      createDartFile(
        directoryPath: servicePath,
        fileName: '${serviceName}_interface',
        fileContents: '',
      );

      /// create the implementation file
      createDartFile(
        directoryPath: servicePath,
        fileName: '${serviceName}_service',
        fileContents: '',
      );
    });

    _logger.success('$serviceName service created successfully.');
    return ExitCode.success.code;
  }

  /// creates an Interface and an implementation file required
  /// to represent a repository module
  int _createRepository(String? repositoryName) {
    if (repositoryName == null || repositoryName.isEmpty) {
      _logger.err(
        'No name provided for the repository. Ex: solid create --repository '
        'repository_name',
      );
      return ExitCode.noPerm.code;
    }

    DirectoryPaths.repositoryPathMap(
      repositoryName: repositoryName,
    ).forEach((key, servicePath) {
      /// create the service directory with provided [serviceName]
      Directory(servicePath).createSync(recursive: true);

      /// create required dart files for the service [serviceName]
      /// create the interface
      createDartFile(
        directoryPath: servicePath,
        fileName: '${repositoryName}_repo_interface',
        fileContents: '',
      );

      /// create the implementation file
      createDartFile(
        directoryPath: servicePath,
        fileName: '${repositoryName}_repository',
        fileContents: '',
      );
    });

    _logger.success('$repositoryName repository created successfully.');
    return ExitCode.success.code;
  }
}
