import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/features/error/error_page.dart';
import 'package:mobile/features/home/pages/home_page.dart';
import 'package:mobile/features/login/pages/login.dart';
import 'package:mobile/features/login/provider/login_provider.dart';
import 'package:mobile/local_storage/local_storage.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
      ],
      child: MaterialApp.router(
        routerConfig: _router,
      ),
    );
  }
}

final GoRouter _router = GoRouter(
  errorBuilder: (context, state) => ErrorPage(goException: state.error),
  debugLogDiagnostics: true,
  redirect: (context, state) async {
    if (await LocalSecureStorage.read(AUTH_TOKEN) != null) {
      // LocalSecureStorage.delete();
      return HomePage.routeName;
    } else {
      return LoginPage.routeName;
    }
  },
  routes: <RouteBase>[
    GoRoute(
      path: HomePage.routeName,
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
    ),
    GoRoute(
      path: LoginPage.routeName,
      builder: (BuildContext context, GoRouterState state) {
        return const LoginPage();
      },
    ),
  ],
);
