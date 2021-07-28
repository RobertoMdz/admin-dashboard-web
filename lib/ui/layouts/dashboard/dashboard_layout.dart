import 'package:flutter/material.dart';

import '../../shared/side_bar.dart';

class DashboardLayout extends StatelessWidget {
  final Widget child;
  const DashboardLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEDF1F2),
      body: Row(
        children: [
          SideBar(),
          Expanded(child: child),
        ],
      ),
    );
  }
}
