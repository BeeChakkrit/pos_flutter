import 'package:go_router/go_router.dart';
import 'package:pos_flutter/src/providers/auth_provider.dart';
import 'package:pos_flutter/src/views/home/home_view.dart';
import 'package:pos_flutter/src/views/login/login_view.dart';
import 'package:pos_flutter/src/views/table/table_view.dart';
import 'package:provider/provider.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        final auth = Provider.of<AuthProvider>(context);
        return auth.isLoggedIn ? const HomeScreen() : const LoginView();
      },
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/table',
      builder: (context, state) => const TableView(),
    ),
  ],
);
