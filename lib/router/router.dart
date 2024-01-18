// ignore_for_file: public_member_api_docs, sort_constructors_first
class AppRouter {
  String name;
  String path;
  AppRouter({
    required this.name,
    required this.path,
  });
}

class Routes {
  static AppRouter navigation = AppRouter(name: "root", path: '/');
  static AppRouter homescreen =
      AppRouter(name: "homescreen", path: "/homescreen");
  static AppRouter staticsscreen =
      AppRouter(name: "staticsscreen", path: "/staticsscreen");
  static AppRouter planningscreen =
      AppRouter(name: "planningscreen", path: "/planning");
  static AppRouter settingscreen =
      AppRouter(name: "settingscreen", path: "/settingscreen");
}
