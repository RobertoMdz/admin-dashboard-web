import 'package:flutter/material.dart';

import 'widgets/background_twitter.dart';
import 'widgets/custom_title.dart';
import 'widgets/links_bar.dart';

class AuthLayout extends StatelessWidget {
  final Widget child;
  const AuthLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Scrollbar(
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            (size.width > 1000)
                ? _DesktopBody(child: child)
                : _MobileBody(child: child),
            LinksBar(),
          ],
        ),
      ),
    );
  }
}

class _MobileBody extends StatelessWidget {
  final Widget child;
  const _MobileBody({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          CustomTitle(),
          Container(
            width: double.infinity,
            height: 420,
            child: child,
          ),
          Container(
            width: double.infinity,
            height: 300,
            child: BackgroundTwitter(),
          )
        ],
      ),
    );
  }
}

class _DesktopBody extends StatelessWidget {
  final Widget child;
  const _DesktopBody({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height * 0.95,
      color: Colors.black,
      child: Row(
        children: [
          Expanded(child: BackgroundTwitter()),
          Container(
            width: 500,
            height: double.infinity,
            color: Colors.black,
            child: Column(
              children: [
                const SizedBox(height: 20),
                CustomTitle(),
                const SizedBox(height: 40),
                Expanded(child: child)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
