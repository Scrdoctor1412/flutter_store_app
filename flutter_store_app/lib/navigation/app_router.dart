import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_store_app/core/configs/di.dart';
import 'package:flutter_store_app/ui/authentication/bloc/auth_bloc.dart';
import 'package:flutter_store_app/ui/authentication/screens/login_screen.dart';
import 'package:flutter_store_app/ui/authentication/screens/register_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

part 'route_paths.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> rootNavigationKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');

  static final router = GoRouter(
    initialLocation: RoutePaths.login,
    navigatorKey: rootNavigationKey,
    // redirect: (context, state) {
    //   return RoutePaths.login;
    // },
    routes: [
      GoRoute(
        path: RoutePaths.login,
        pageBuilder: (context, state) {
          return NoTransitionPage(
            key: state.pageKey,
            child: BlocProvider(
              create: (context) => sl<AuthBloc>(),
              child: LoginScreen(),
            ),
          );
        },
      ),
      GoRoute(
        path: RoutePaths.register,
        // builder: (context, state) {
        //   return RegisterScreen();
        // },
        pageBuilder: (context, state) {
          return SwipeablePage(
            key: state.pageKey,
            builder: (context) => BlocProvider(
              create: (context) => sl<AuthBloc>(),
              child: RegisterScreen(),
            ),
          );
        },
      ),
      // StatefulShellRoute.indexedStack(
      //   branches: [],
      // ),
    ],
  );
}
