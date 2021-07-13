import 'package:flutter/material.dart';

import 'router/router.dart';
import 'ui/layouts/auth/auth_layout.dart';

void main() {
  Flurorouter.configureRoutes();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/',
      onGenerateRoute: (routeSettings) =>
          Flurorouter.router.generator(routeSettings),
      builder: (_, child) {
        return AuthLayout(
          child: child!,
        );
      },
    );
  }
}
