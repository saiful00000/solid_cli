import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:solid_cli/src/res/directori_paths.dart';

/// {@template init_command}
///
/// `solid init`
/// A [Command] to initialize solid directory structure
/// {@endtemplate}
class InitCommand extends Command<int> {
  /// {@macro init_command}
  InitCommand({
    required Logger logger,
  }) : _logger = logger;

  @override
  String get description => 'Initialize solid principle.';

  @override
  String get name => 'init';

  final Logger _logger;

  @override
  Future<int> run() async {
    var output = 'Initialized SOLID.';
    DirectoryPaths.solidPathMap.forEach((key, pathStr) {
      Directory(pathStr).createSync(recursive: true);
    });
    _logger.success(output);
    return ExitCode.success.code;
  }
}
