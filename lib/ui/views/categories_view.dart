import 'package:flutter/material.dart';

import '../cards/white_card.dart';
import '../labels/custom_labels.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        Text(
          'Categories',
          style: CustomLabels.h1,
        ),
        const SizedBox(height: 10),
        WhiteCard(
          title: 'Categories Titulo',
          child: Text('Hola'),
        )
      ],
    ));
  }
}
