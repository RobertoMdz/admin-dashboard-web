import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/side_navbar_notifier_provider.dart';
import 'search_bar.dart';

class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 5),
        ],
      ),
      child: Row(
        children: [
          if (size.width <= 700)
            IconButton(
              icon: Icon(Icons.menu_outlined),
              onPressed: () {
                context.read<SideNavbarNotifierProvier>().controlMenu();
              },
            ),
          const SizedBox(width: 5),
          if (size.width > 350)
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 250),
              child: SearchBar(
                search: (text) {},
                searchBarHintText: 'Buscar',
              ),
            )
        ],
      ),
    );
  }
}
