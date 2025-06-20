import 'package:go_router/go_router.dart';
import 'package:pos_flutter/src/providers/auth_provider.dart';
import 'package:pos_flutter/src/views/home/home_view.dart';
import 'package:pos_flutter/src/views/iteame/iteame_category.dart';
import 'package:pos_flutter/src/views/login/login_view.dart';
import 'package:pos_flutter/src/views/order/orderall/order_all.dart';
import 'package:pos_flutter/src/views/pagecategory/page_category.dart';
import 'package:pos_flutter/src/views/table/table_view.dart';
import 'package:provider/provider.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        final auth = Provider.of<AuthProvider>(context);
        return auth.isLoggedIn ? const PageCategory() : const LoginView();
      },
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: '/order',
      builder: (context, state) => const OrderAll(),
    ),
    GoRoute(
      path: '/table',
      builder: (context, state) => const TableView(),
    ),
    GoRoute(
      path: '/iteamecategory',
      builder: (context, state) => const IteameCategory(),
    ),
  ],
);
