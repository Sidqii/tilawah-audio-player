part of 'app_pages.dart';

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const LIST = '/list';
  static const FILTER = '/filter';
}

abstract class AppRoutes {
  AppRoutes._();
  static const HOME = _Paths.HOME;
  static const LIST = _Paths.LIST;
  static const FILTER = _Paths.FILTER;
}
