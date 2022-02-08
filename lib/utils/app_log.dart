import 'dart:developer' as developer;

mixin AppLog {
  void log(String msg, {String? func, String? tag, Object? error}) =>
      developer.log(
        '[${func ?? ''}]${tag == null ? '' : '($tag)'} $msg',
        name: '$runtimeType',
        time: DateTime.now(),
        error: error,
        stackTrace: error != null ? StackTrace.current : null,
      );
  void logIn(String func, [String? tag]) => log('in.', func: func, tag: tag);
  void logOut(String func, [String? tag]) => log('out.', func: func, tag: tag);
}
