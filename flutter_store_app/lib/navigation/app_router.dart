import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_store_app/core/common/global_values.dart';
import 'package:flutter_store_app/core/configs/di.dart';
import 'package:flutter_store_app/ui/nav/account/screens/account_screen.dart';
import 'package:flutter_store_app/ui/authentication/bloc/auth_bloc.dart';
import 'package:flutter_store_app/ui/authentication/screens/login_screen.dart';
import 'package:flutter_store_app/ui/authentication/screens/register_screen.dart';
import 'package:flutter_store_app/ui/nav/cart/screens/cart_screen.dart';
import 'package:flutter_store_app/ui/nav/favorite/screens/favorite_screen.dart';
import 'package:flutter_store_app/ui/nav/home/screens/home_screen.dart';
import 'package:flutter_store_app/ui/main/screens/main_screen.dart';
import 'package:flutter_store_app/ui/nav/stores/screens/stores_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

part 'route_paths.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> rootNavigationKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');

  static final router = GoRouter(
    initialLocation: RoutePaths.login,
    navigatorKey: rootNavigationKey,
    redirect: (context, state) {
      final isLoggedIn = GlobalValues.isLoggedIn;
      final loggingIn =
          state.matchedLocation == RoutePaths.login ||
          state.matchedLocation == RoutePaths.register;

      if (!isLoggedIn && !loggingIn) {
        return RoutePaths.login;
      }

      if (isLoggedIn && loggingIn) {
        return RoutePaths.main;
      }

      return null;
    },
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => sl<AuthBloc>(),
              ),
            ],
            child: MainScreen(
              child: navigationShell,
            ),
          );
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.main,
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                    key: state.pageKey, // No change
                    child: HomeScreen(),
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.favorite,
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                    key: state.pageKey, // Change
                    child: const FavoriteScreen(),
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.stores,
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                    key: state.pageKey, // Change
                    child: const StoresScreen(),
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.cart,
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                    key: state.pageKey, // Change
                    child: const CartScreen(),
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.account,
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                    key: state.pageKey, // Change
                    child: const AccountScreen(),
                  );
                },
              ),
            ],
          ),
        ],
      ),

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
