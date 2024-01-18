import 'package:e_learning/features/home/homescreen.dart';
import 'package:e_learning/features/planning/planningscreen.dart';
import 'package:e_learning/features/setting/settingscreen.dart';
import 'package:e_learning/features/statics/staticsscreen.dart';
import 'package:e_learning/router/router.dart';
import 'package:e_learning/screen/navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

final _rootNavigationKey = GlobalKey<NavigatorState>();
final _shellNavigationKey = GlobalKey<NavigatorState>();

final router = GoRouter(
    navigatorKey: _rootNavigationKey,
    initialLocation: Routes.homescreen.path,
    routes: [
      ShellRoute(
          parentNavigatorKey: _rootNavigationKey,
          navigatorKey: _shellNavigationKey,


          pageBuilder: (context, state, child) {
            int index = 0;
            if (state.fullPath == Routes.homescreen.path) {
              index = 0;
            } else if (state.fullPath == Routes.staticsscreen.path) {
              index = 1;
            } else if (state.fullPath == Routes.planningscreen.path) {
              index = 2;
            } else if (state.fullPath == Routes.settingscreen.path) {
              index = 3;
            }


            return CupertinoPage(child: Navigation(selectedIndex: index, child: child));
          },
          routes: [
            GoRoute(
              parentNavigatorKey: _shellNavigationKey,
              path: Routes.homescreen.path,
              name: Routes.homescreen.name,
              pageBuilder: (context, state) {
                return const CupertinoPage(child: HomeScreen());
              },
            ),
            GoRoute(
              parentNavigatorKey: _shellNavigationKey,
              path: Routes.staticsscreen.path,
              name: Routes.staticsscreen.name,
              pageBuilder: (context, state) {
                return const CupertinoPage(child: StaticsScreen());
              },
            ),
            GoRoute(
              parentNavigatorKey: _shellNavigationKey,
              path: Routes.planningscreen.path,
              name: Routes.planningscreen.name,
              pageBuilder: (context, state) {
                return const CupertinoPage(child: PlanningScreen());
              },
            ),
            GoRoute(
              parentNavigatorKey: _shellNavigationKey,
              path: Routes.settingscreen.path,
              name: Routes.settingscreen.name,
              pageBuilder: (context, state) {
                return const CupertinoPage(child: SettingScreen());
              },
            ),
          ])
    ]);
