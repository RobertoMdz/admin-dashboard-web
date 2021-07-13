import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:flutter/material.dart';

class LinksBar extends StatelessWidget {
  const LinksBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.black,
      height: size.height * 0.07,
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          LinkText(
            text: 'About',
            onTap: () {},
          ),
          LinkText(
            text: 'Help Center',
            onTap: () {},
          ),
          LinkText(
            text: 'Privacy',
            onTap: () {},
          ),
          LinkText(
            text: 'Terms of service',
            onTap: () {},
          ),
          LinkText(
            text: 'Ads info',
            onTap: () {},
          ),
          LinkText(
            text: 'Status',
            onTap: () {},
          ),
          LinkText(
            text: 'Careers',
            onTap: () {},
          ),
          LinkText(
            text: 'Resources',
            onTap: () {},
          ),
          LinkText(
            text: 'Marketing',
            onTap: () {},
          ),
          LinkText(
            text: 'Status',
            onTap: () {},
          ),
          LinkText(
            text: 'Careers',
            onTap: () {},
          ),
          LinkText(
            text: 'Resources',
            onTap: () {},
          ),
          LinkText(
            text: 'Marketing',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
