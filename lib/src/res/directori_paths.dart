import 'dart:io';
import 'package:path/path.dart' as path;

class DirectoryPaths{
  DirectoryPaths._();

  /// holds all low level directory paths for a SOLID structured flutter project
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

  /// holds screen level directory paths
  static Map<String, String> screenPathMap({required String screenName}) => {
    'screen': path.join('${solidPathMap['screens']}', screenName, 'ui'),
    'controller': path.join('${solidPathMap['screens']}',screenName,'controller'),
    'widget': path.join('${solidPathMap['screens']}',screenName,'widget'),
  };

  /// holds service level directory paths
  static Map<String, String> servicePathMap({required String serviceName}) => {
    'service': path.join('${solidPathMap['services']}', serviceName),
  };

  /// holds repository level directory paths
  static Map<String, String> repositoryPathMap({required String repositoryName}) => {
    'repository': path.join('${solidPathMap['repositories']}', repositoryName),
  };

}
