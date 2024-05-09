// import 'dart:developer';

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_template/core/local_cache/local_cache.dart';
import 'package:flutter_template/core/router/src/error_page.dart';
import 'package:flutter_template/core/router/src/router_provider.dart';
import 'package:flutter_template/features/home_page/presentation/home_page.dart';
import 'package:flutter_template/features/login_screen/presentation/login_screen.view.dart';
import 'package:flutter_template/features/splash_screen/presentation/splash_screen.view.dart';

// import 'package:berger_msfa/local_cache/cache_tags.dart';

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey(debugLabel: 'root');

final routerProvider = Provider<GoRouter>((ref) {
  final router = ref.watch(routerNotifierProvider)..init();

  return GoRouter(
    navigatorKey: _rootNavigator,
    debugLogDiagnostics: true,
    //     BuildConfig.instance.environment != Environment.PRODUCTION,
    refreshListenable: router,
    routes: [
      GoRoute(
        path: SplashScreen.path,
        name: SplashScreen.name,
        builder: (BuildContext context, GoRouterState state) =>
            const SplashScreen(),
      ),
      GoRoute(
        path: LoginScreen.path,
        name: LoginScreen.name,
        builder: (BuildContext context, GoRouterState state) => LoginScreen(),
      ),
      GoRoute(
        path: HomeScreen.path,
        name: HomeScreen.name,
        builder: (BuildContext context, GoRouterState state) => HomeScreen(),
      ),
    ],
    // initialLocation: HomePage.path,
    initialLocation: SplashScreen.path,
    errorPageBuilder: router._errorPageBuilder,
    redirect: (context, state) {
      final loggedIn = router.isLoggedIn;
      final routeInQ = router.nonAuthedList.contains(state.matchedLocation);
      log(
        'loggedIn : $loggedIn || routeInQ : $routeInQ',
        name: '------------------|',
      );

      if (loggedIn) {
        return null;
      } else {
        if (routeInQ) {
          return null;
        } else {
          return LoginScreen.path;
          // return null;
        }
      }
      // return null;
    },
  );
});

class RouterNotifier extends ChangeNotifier {
  RouterNotifier(this._ref) {
    _isLoggedIn = _ref.watch(hiveProvider).token.isNotEmpty;
  }
  final Ref _ref;

  void init() {
    _ref.watch(hiveProvider).getCacheBox().watch().listen((BoxEvent event) {
      if (event.key == KCacheTags.token || event.deleted) {
        _isLoggedIn = _ref.watch(hiveProvider).token.isNotEmpty;
        log(_isLoggedIn.toString(), name: "LOGGED IN");
        notifyListeners();
      }
    });
  }

  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  List<String> nonAuthedList = [
    SplashScreen.path,
    LoginScreen.path,
    HomeScreen.path,
    '/nonAuthPage1',
    '/nonAuthPage2',
    '/nonAuthPage3',
    '/nonAuthPage4',
  ];

  Page<void> _errorPageBuilder(BuildContext context, GoRouterState state) =>
      MaterialPage(
        key: state.pageKey,
        child: Scaffold(
          body: ErrorPage(
            state: state,
          ),
        ),
      );
}
