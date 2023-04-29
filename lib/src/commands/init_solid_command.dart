import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';

/// {@template sample_command}
///
/// `solid sample`
/// A [Command] to exemplify a sub command
/// {@endtemplate}
class InitSOLIDCommand extends Command<int> {
  /// {@macro sample_command}
  InitSOLIDCommand({
    required Logger logger,
  }) : _logger = logger;

  @override
  String get description => 'Initialize solid principle.';

  @override
  String get name => 'init-solid';

  final Logger _logger;

  @override
  Future<int> run() async {
    var output = 'Initialized SOLID.';
    _logger.info(output);
    return ExitCode.success.code;
  }
}
