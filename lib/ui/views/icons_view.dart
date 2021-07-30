import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:flutter/material.dart';

import '../labels/custom_labels.dart';

class IconsView extends StatelessWidget {
  const IconsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        Text(
          'Icons view',
          style: CustomLabels.h1,
        ),
        const SizedBox(height: 10),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
          children: [
            WhiteCard(
              width: 130,
              title: 'person',
              child: Center(
                child: Icon(Icons.person),
              ),
            ),
            WhiteCard(
              width: 130,
              title: 'alarm',
              child: Center(
                child: Icon(Icons.alarm),
              ),
            ),
            WhiteCard(
              width: 130,
              title: 'login',
              child: Center(
                child: Icon(Icons.login),
              ),
            ),
            WhiteCard(
              width: 130,
              title: 'alarm',
              child: Center(
                child: Icon(Icons.alarm),
              ),
            )
          ],
        )
      ],
    ));
  }
}
