import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/side_navbar_notifier_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/views/categories_view.dart';
import 'package:admin_dashboard/ui/views/customer_view.dart';
import 'package:admin_dashboard/ui/views/customers_view.dart';
import 'package:admin_dashboard/ui/views/icons_view.dart';
import 'package:admin_dashboard/ui/views/login_view.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

import '../ui/views/dashboard_view.dart';

class DashboardHandlers {
  static Handler dashboard = Handler(
    handlerFunc: (context, params) {
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideNavbarNotifierProvier>(context, listen: false)
          .setCurrentPageUrl(Flurorouter.dashboardRoute);
      if (authProvider.authStatus == AuthStatus.authenticated)
        return DashboardView();
      else
        return LoginView();
    },
  );

  static Handler icons = Handler(
    handlerFunc: (context, params) {
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideNavbarNotifierProvier>(context, listen: false)
          .setCurrentPageUrl(Flurorouter.iconsRoute);
      if (authProvider.authStatus == AuthStatus.authenticated)
        return IconsView();
      else
        return LoginView();
    },
  );

  static Handler categories = Handler(
    handlerFunc: (context, params) {
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideNavbarNotifierProvier>(context, listen: false)
          .setCurrentPageUrl(Flurorouter.categoriesRoute);
      if (authProvider.authStatus == AuthStatus.authenticated)
        return CategoriesView();
      else
        return LoginView();
    },
  );

  static Handler customers = Handler(
    handlerFunc: (context, params) {
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideNavbarNotifierProvier>(context, listen: false)
          .setCurrentPageUrl(Flurorouter.customersRoute);
      if (authProvider.authStatus == AuthStatus.authenticated)
        return CustomersView();
      else
        return LoginView();
    },
  );

  static Handler customer = Handler(
    handlerFunc: (context, params) {
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideNavbarNotifierProvier>(context, listen: false)
          .setCurrentPageUrl(Flurorouter.customerRoute);

      if (authProvider.authStatus ==
          AuthStatus.authenticated) if (params['uid']?.first != null) {
        return CustomerView(uid: params['uid']!.first);
      } else {
        return CustomersView();
      }
      else
        return LoginView();
    },
  );
}
