import 'dart:io';

class DirectoryPaths{
  DirectoryPaths._();

  static final solidPathMap = {
    'screens': replaceAsExpected(path: './lib/screens'),
    'models': replaceAsExpected(path: './lib/models'),
    'services': replaceAsExpected(path: './lib/ services'),
    'widgets': replaceAsExpected(path: './lib/widgets'),
    'utils': replaceAsExpected(path: './lib/utils'),
    'routes': replaceAsExpected(path: './lib/routes'),
    'repositories': replaceAsExpected(path: './lib/repositories'),
    'resources': replaceAsExpected(path: './lib/resources'),
  };


  static String replaceAsExpected({required String path, String? replaceChar}) {
    return path;
    if (path.contains('\\')) {
      if (Platform.isLinux || Platform.isMacOS) {
        return path.replaceAll('\\', '/');
      } else {
        return path;
      }
    } else if (path.contains('/')) {
      if (Platform.isWindows) {
        return path.replaceAll('/', '\\\\');
      } else {
        return path;
      }
    } else {
      return path;
    }
  }

}
