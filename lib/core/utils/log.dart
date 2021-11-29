import 'package:logging/logging.dart';

class Log {
  static Logger log = Logger('default');
  static Logger route = Logger('route');
  static Logger http = Logger('HTTP');
  static Logger db = Logger('Database');
}
