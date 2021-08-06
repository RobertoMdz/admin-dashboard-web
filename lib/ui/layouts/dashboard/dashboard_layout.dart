import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/side_navbar_notifier_provider.dart';
import '../../shared/navbar.dart';
import '../../shared/side_bar.dart';

class DashboardLayout extends StatelessWidget {
  final Widget child;
  const DashboardLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: context.read<SideNavbarNotifierProvier>().scaffoldKey,
      drawer: SideBar(),
      backgroundColor: Color(0xffEDF1F2),
      body: Row(
        children: [
          if (size.width >= 700) SideBar(),
          Expanded(
            child: Column(
              children: [
                Navbar(),
                Expanded(
                    child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: child,
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
