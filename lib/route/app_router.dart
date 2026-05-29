import 'package:flutter/material.dart';
import 'package:flutter_second/models/user_info.dart';
import 'package:flutter_second/route/app_routes.dart';
import 'package:flutter_second/screens/container_with_row_and_column.dart';
import 'package:flutter_second/widgets/error_page.dart';
import 'package:flutter_second/screens/home_screen.dart';
import 'package:flutter_second/screens/main_screen.dart';
import 'package:flutter_second/screens/product_screen.dart';
import 'package:flutter_second/screens/register_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final router = GoRouter(
    errorBuilder: (context, state) {
      return ErrorPage();
    },
    routes: <RouteBase>[
      GoRoute(
        path: AppRoutes.mainScreen,
        builder: (BuildContext context, GoRouterState state) {
          return MainScreen();
        },
        routes: <RouteBase>[
          GoRoute(
            path: AppRoutes.productscreen,
            builder: (BuildContext context, GoRouterState state) {
              return ProductScreen();
            },
          ),
          GoRoute(
            path: AppRoutes.homescreen,
            builder: (BuildContext context, GoRouterState state) {
              return const HomeScreen();
            },
          ),
          GoRoute(
            path: AppRoutes.containerscreen,
            builder: (BuildContext context, GoRouterState state) {
              return const ContainerWithRowAndColumn();
            },
          ),
          GoRoute(
            path: AppRoutes.register,
            builder: (BuildContext context, GoRouterState state) {
              final userinfo = state.extra as UserInfo;
              return RegisterScreen(userInfo: userinfo);
            },
          ),
        ],
      ),
    ],
  );
}
