import 'package:admin_dashboard/ui/layouts/auth/widgets/background_twitter.dart';
import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        _DesktopBody(),
      ],
    ));
  }
}

class _DesktopBody extends StatelessWidget {
  const _DesktopBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height,
      color: Colors.red,
      child: Row(
        children: [
          BarckgroundTwitter(),
          Container(
            width: 500,
            height: double.infinity,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
