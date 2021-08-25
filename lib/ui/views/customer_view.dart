import 'package:admin_dashboard/models/usuario.dart';
import 'package:admin_dashboard/providers/customers_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../cards/white_card.dart';
import '../labels/custom_labels.dart';

class CustomerView extends StatefulWidget {
  final String uid;
  const CustomerView({Key? key, required this.uid}) : super(key: key);

  @override
  _CustomerViewState createState() => _CustomerViewState();
}

class _CustomerViewState extends State<CustomerView> {
  Usuario? user;

  @override
  void initState() {
    super.initState();
    final usersProvider =
        Provider.of<CustomersProvider>(context, listen: false);
    usersProvider.getCustomerById(widget.uid).then((userFound) => setState(() {
          user = userFound;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        Text(
          'User view',
          style: CustomLabels.h1,
        ),
        const SizedBox(height: 10),
        if (user == null)
          WhiteCard(
            child: Container(
              height: 400,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          )
      ],
    ));
  }
}
