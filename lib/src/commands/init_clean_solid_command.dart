import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';

class InitCleanSOLIDCommand extends Command<int> {
  InitCleanSOLIDCommand({required Logger logger}) : _logger = logger;

  @override
  String get description => 'Initialize solid principle with clean '
      'architectural design pattern.';

  @override
  String get name => 'init-clean-solid';

  final Logger _logger;

  @override
  Future<int> run() async {
    var output = 'Initialized SOLID with clean architecture.';
    _logger.info(output);
    return ExitCode.success.code;
  }
}
