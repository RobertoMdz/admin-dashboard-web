import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:flutter/material.dart';

class LinksBar extends StatelessWidget {
  const LinksBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        color: Colors.black,
        height: size.height * 0.05,
        child: Wrap(children: [
          LinkText(text: 'About'),
          LinkText(text: 'Help Center'),
          LinkText(text: 'Privacy'),
          LinkText(text: 'Terms of service'),
          LinkText(text: 'Ads info'),
          LinkText(text: 'Status'),
          LinkText(text: 'Careers'),
          LinkText(text: 'Resources'),
          LinkText(text: 'Marketing'),
          LinkText(text: 'Status'),
          LinkText(text: 'Careers'),
          LinkText(text: 'Resources'),
          LinkText(text: 'Marketing'),
        ]));
  }
}
