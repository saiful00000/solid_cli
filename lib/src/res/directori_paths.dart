import 'dart:io';
import 'package:path/path.dart' as path;

class DirectoryPaths{
  DirectoryPaths._();

  static final solidPathMap = {
    'screens': path.join('.','lib','screens'),
    'models': path.join('.','lib','models'),
    'services': path.join('.','lib','services'),
    'widgets': path.join('.','lib','widgets'),
    'utils': path.join('.','lib','utils'),
    'routes': path.join('.','lib','routes'),
    'repositories': path.join('.','lib','repositories'),
    'resources': path.join('.','lib','resources'),
  };

  static Map<String, String> screenPathMap({required String screenName}) => {
    'screen': path.join('${solidPathMap['screens']}', screenName, 'ui'),
    'controller': path.join('${solidPathMap['screens']}',screenName,'controller'),
    'widget': path.join('${solidPathMap['screens']}',screenName,'widget'),
  };

}
