import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:router_demo/bottom_navigation.dart';
import 'package:router_demo/pages/home_page.dart';
import 'package:router_demo/pages/service_page.dart';
import 'package:router_demo/pages/profile_page.dart';
import 'package:router_demo/pages/information_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) =>
          BottomNavigationBarScaffold(child: child),
      routes: [
        GoRoute(
          path: '/',
          parentNavigatorKey: _shellNavigatorKey,
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: '/services',
          parentNavigatorKey: _shellNavigatorKey,
          builder: (context, state) => const ServicePage(),
        ),
        GoRoute(
          path: '/profile',
          parentNavigatorKey: _shellNavigatorKey,
          builder: (context, state) => const Profilepage(),
          routes: [
            GoRoute(
              path: 'login',
              parentNavigatorKey: _shellNavigatorKey,
              builder: (context, state) => const ProfileInfoPage(),
            ),
          ],
        ),
      ],
    ),
  ],
);
