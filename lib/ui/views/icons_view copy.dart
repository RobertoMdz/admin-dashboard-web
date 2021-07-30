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
      ],
    ));
  }
}
