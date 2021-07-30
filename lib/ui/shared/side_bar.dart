import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:admin_dashboard/ui/shared/group_menu_title.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum DrawerMenuOption { vacancies, profile, none }

class SideBar extends StatelessWidget {
  void navigateTo({required String route}) {
    NavigationService.navigateTo(route);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DrawerHeader(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.bubble_chart_outlined,
                    color: Color(0xff7A6BF5),
                  ),
                  Text(
                    'Admin',
                    style: GoogleFonts.montserratAlternates(
                      fontSize: 20,
                      fontWeight: FontWeight.w200,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            GroupMenuTitle(title: 'Main'),
            _DrawerListTile(
              menuOption: DrawerMenuOption.vacancies,
              title: "Dashboard",
              isActive: true,
              icon: Icons.compass_calibration_outlined,
              onTap: (menuOption) {
                navigateTo(route: Flurorouter.dashboardRoute);
              },
            ),
            _DrawerListTile(
              menuOption: DrawerMenuOption.vacancies,
              title: "Orders",
              isActive: false,
              icon: Icons.shopping_cart_outlined,
              onTap: (menuOption) {},
            ),
            _DrawerListTile(
              menuOption: DrawerMenuOption.vacancies,
              title: "Analytics",
              isActive: false,
              icon: Icons.analytics_outlined,
              onTap: (menuOption) {},
            ),
            _DrawerListTile(
              menuOption: DrawerMenuOption.vacancies,
              title: "Categories",
              isActive: false,
              icon: Icons.category_outlined,
              onTap: (menuOption) {},
            ),
            _DrawerListTile(
              menuOption: DrawerMenuOption.vacancies,
              title: "Products",
              isActive: false,
              icon: Icons.integration_instructions,
              onTap: (menuOption) {},
            ),
            _DrawerListTile(
              menuOption: DrawerMenuOption.vacancies,
              title: "Discounts",
              isActive: false,
              icon: Icons.local_offer_outlined,
              onTap: (menuOption) {},
            ),
            _DrawerListTile(
              menuOption: DrawerMenuOption.vacancies,
              title: "Customers",
              isActive: false,
              icon: Icons.supervised_user_circle_outlined,
              onTap: (menuOption) {},
            ),
            const SizedBox(height: 10),
            GroupMenuTitle(title: 'UI elements'),
            _DrawerListTile(
              menuOption: DrawerMenuOption.vacancies,
              title: "Icons",
              isActive: false,
              icon: Icons.eleven_mp,
              onTap: (menuOption) {
                navigateTo(route: Flurorouter.iconsRoute);
              },
            ),
            _DrawerListTile(
              menuOption: DrawerMenuOption.vacancies,
              title: "Marketing",
              isActive: false,
              icon: Icons.ramen_dining,
              onTap: (menuOption) {},
            ),
            _DrawerListTile(
              menuOption: DrawerMenuOption.vacancies,
              title: "Campaing",
              isActive: false,
              icon: Icons.dinner_dining,
              onTap: (menuOption) {},
            ),
            _DrawerListTile(
              menuOption: DrawerMenuOption.vacancies,
              title: "Log out",
              isActive: false,
              icon: Icons.exit_to_app_outlined,
              onTap: (menuOption) {},
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerListTile extends StatelessWidget {
  const _DrawerListTile({
    Key? key,
    required this.menuOption,
    required this.title,
    required this.icon,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final bool isActive;
  final Function(DrawerMenuOption) onTap;
  final DrawerMenuOption menuOption;

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);

    return ListTile(
      selected: isActive,
      selectedTileColor: Colors.white10,
      onTap: () => onTap(menuOption),
      horizontalTitleGap: 0.0,
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        title,
        style: appTheme.textTheme.bodyText2!.copyWith(
          color: Colors.white70,
        ),
      ),
    );
  }
}
