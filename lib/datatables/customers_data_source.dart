import 'package:flutter/material.dart';

import '../models/usuario.dart';
import '../services/navigation_service.dart';

class CustomersDataTableSource extends DataTableSource {
  final List<Usuario> customers;
  //final BuildContext context;

  CustomersDataTableSource(this.customers);

  @override
  DataRow getRow(int index) {
    final customer = this.customers[index];
    final image = (customer.img == null)
        ? Image(
            image: AssetImage('no-image.jpg'),
            height: 35,
            width: 35,
          )
        : FadeInImage.assetNetwork(
            placeholder: 'loader.gif',
            image: customer.img!,
            width: 35,
            height: 35);

    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(image),
        DataCell(
          Text('Nombre ${customer.nombre}'),
        ),
        DataCell(
          Text('Email ${customer.correo}'),
        ),
        DataCell(
          Text('UID ${customer.uid}'),
        ),
        DataCell(
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => NavigationService.replaceTo(
              '/dashboard/customers/${customer.uid}',
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => customers.length;

  @override
  int get selectedRowCount => 0;
}
