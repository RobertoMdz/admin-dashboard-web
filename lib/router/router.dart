import 'package:fluro/fluro.dart';

import 'admin_handlers.dart';
import 'dashboard_handlers.dart';
import 'no_page_found_handlers.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static String rootRoute = '/';

  // Auth routes
  static String loginRoute = '/auth/login';
  static String registerRoute = '/auth/register';

  // Dashboard routes
  static String dashboardRoute = '/dashboard';
  static String iconsRoute = '/dashboard/icons';
  static String categoriesRoute = '/dashboard/categories';

  static String customersRoute = '/dashboard/customers';
  static String customerRoute = '/dashboard/customers/:uid';

  static void configureRoutes() {
    router.define(rootRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(loginRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(registerRoute,
        handler: AdminHandlers.register, transitionType: TransitionType.none);

    // Dashboard
    router.define(dashboardRoute,
        handler: DashboardHandlers.dashboard,
        transitionType: TransitionType.none);

    router.define(iconsRoute,
        handler: DashboardHandlers.icons, transitionType: TransitionType.none);

    router.define(categoriesRoute,
        handler: DashboardHandlers.categories,
        transitionType: TransitionType.none);

    router.define(customersRoute,
        handler: DashboardHandlers.customers,
        transitionType: TransitionType.none);
    router.define(customerRoute,
        handler: DashboardHandlers.customer,
        transitionType: TransitionType.none);

    // 404
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }
}
