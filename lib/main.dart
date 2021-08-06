import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'api/CafeApi.dart';
import 'providers/auth_provider.dart';
import 'providers/side_navbar_notifier_provider.dart';
import 'router/router.dart';
import 'services/local_storage.dart';
import 'services/navigation_service.dart';
import 'ui/layouts/auth/auth_layout.dart';
import 'ui/layouts/dashboard/dashboard_layout.dart';
import 'ui/layouts/splash/splash_layout.dart';

void main() async {
  await LocalStorage.configurePrefs();
  CafeApi.configureDio();
  Flurorouter.configureRoutes();

  runApp(AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SideNavbarNotifierProvier(),
        )
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/',
      navigatorKey: NavigationService.navigatorKey,
      onGenerateRoute: (routeSettings) =>
          Flurorouter.router.generator(routeSettings),
      builder: (_, child) {
        final authProvider = Provider.of<AuthProvider>(context);

        if (authProvider.authStatus == AuthStatus.checking) {
          return SplashLayout();
        } else if (authProvider.authStatus == AuthStatus.authenticated) {
          return DashboardLayout(
            child: child!,
          );
        } else {
          return AuthLayout(child: child!);
        }
      },
      theme: ThemeData.light().copyWith(
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: MaterialStateProperty.all(
            Colors.grey.withOpacity(0.5),
          ),
        ),
        canvasColor: const Color(0xFF092044),
      ),
    );
  }
}
