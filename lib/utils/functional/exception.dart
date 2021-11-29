import 'dart:async';

Future<T> runCatching<T>(
  FutureOr<T> Function() func, {
  required FutureOr<T> Function(Exception e) onFail,
  FutureOr<T> Function(dynamic e)? oncatch,
}) async {
  try {
    return await func();
  } on Exception catch (e) {
    return await onFail(e);
  } catch (e) {
    if (oncatch == null) {
      rethrow;
    } else {
      return oncatch(e);
    }
  }
}
