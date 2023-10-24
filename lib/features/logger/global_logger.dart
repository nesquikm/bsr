import 'package:fancy_logger/fancy_logger.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'global_logger.g.dart';

@Riverpod(keepAlive: true)
class GlobalLogger extends _$GlobalLogger {
  @override
  Future<FancyLogger> build() async {
    final fancyLogger = FancyLogger();

    await fancyLogger.init(
      {
        Level.ALL: 10,
      },
    );

    return fancyLogger;
  }
}
