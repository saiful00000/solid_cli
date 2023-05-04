import 'dart:io';
import 'package:path/path.dart' as path;

class DirectoryPaths {
  DirectoryPaths._();

  /// holds all low level directory paths for a SOLID structured flutter project
  static final solidPathMap = {
    'screens': path.join('.', 'lib', 'screens'),
    'models': path.join('.', 'lib', 'models'),
    'services': path.join('.', 'lib', 'services'),
    'widgets': path.join('.', 'lib', 'widgets'),
    'utils': path.join('.', 'lib', 'utils'),
    'routes': path.join('.', 'lib', 'routes'),
    'repositories': path.join('.', 'lib', 'repositories'),
    'resources': path.join('.', 'lib', 'resources'),
  };

  /// holds screen level directory paths
  static Map<String, String> screenPathMap({required String screenName}) =>
      {
        'screen': path.join('${solidPathMap['screens']}', screenName, 'ui'),
        'controller':
        path.join('${solidPathMap['screens']}', screenName, 'controller'),
        'widget': path.join('${solidPathMap['screens']}', screenName, 'widget'),
      };

  /// holds service level directory paths
  static Map<String, String> servicePathMap({required String serviceName}) =>
      {
        'service': path.join('${solidPathMap['services']}', serviceName),
      };

  /// holds repository level directory paths
  static Map<String, String> repositoryPathMap(
      {required String repositoryName}) =>
      {
        'repository':
        path.join('${solidPathMap['repositories']}', repositoryName),
      };

  /// --------------------------------------------------------------------------
  /// Holds directory paths for a clean architecture with SOLID principle in
  /// in mind
  static final cleanSolidPathMap = {
    'data': path.join('.', 'lib', 'data'),
    'domain': path.join('.', 'lib', 'domain'),
    'application': path.join('.', 'lib', 'application'),
    'presentation': path.join('.', 'lib', 'presentation'),
    'utils': path.join('.', 'lib', 'utils'),
    'widgets': path.join('.', 'lib', 'widgets'),
  };

  /// holds directory paths for data layer
  static final cleanDataDirectoriesPaths = {
    /// infrastructure
    'infrastructure': path.join(cleanSolidPathMap['data']!, 'infrastructure'),

    /// data source
    'data_source': path.join(cleanSolidPathMap['data']!, 'datasource'),
    'local': path.join(cleanSolidPathMap['data']!, 'datasource', 'local'),
    'remote': path.join(cleanSolidPathMap['data']!, 'datasource', 'remote'),

    /// repository
    'repository': path.join(cleanSolidPathMap['data']!, 'repository'),

    /// Services
    'services': path.join(cleanSolidPathMap['data']!, 'services'),
  };

  /// holds directory paths for domain layer
  static final cleanDomainDirectoryPaths = {
    'models': path.join(cleanSolidPathMap['domain']!, 'models'),
    'repository': path.join(cleanSolidPathMap['domain']!, 'repository'),
    'services': path.join(cleanSolidPathMap['domain']!, 'services'),
  };

  /// holds directory paths for application layer
  static final cleanApplicationDirectoryPaths = {
    'controllers': path.join(cleanSolidPathMap['application']!, 'controllers'),
    'usecases': path.join(cleanSolidPathMap['application']!, 'usecases'),
  };

  /// holds directory paths for presentation layer
  static final cleanPresentationDirectoryPaths = {
    'screens': path.join(cleanSolidPathMap['presentation']!, 'screens'),
    'widgets': path.join(cleanSolidPathMap['presentation']!, 'widgets'),
    'resource': path.join(cleanSolidPathMap['presentation']!, 'resources'),
  };

  static Map<String, String> getCleanScreenSpecificPaths(String screenName) {
    final screenBasePath = cleanPresentationDirectoryPaths['screens']!;
    final controllerBasePath = cleanApplicationDirectoryPaths['controllers']!;
    return {
      'screen': path.join(screenBasePath, screenName, 'ui'),
      'widget': path.join(screenBasePath, screenName, 'widget'),
      'controller': path.join(controllerBasePath, screenName),
    };
  }

  static final cleanInitDirectoryPathsList = [
    cleanDataDirectoriesPaths,
    cleanDomainDirectoryPaths,
    cleanApplicationDirectoryPaths,
    cleanPresentationDirectoryPaths,
  ];
}
