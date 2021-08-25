import 'package:admin_dashboard/models/usuario.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:flutter/material.dart';

class CustomersDataTableSource extends DataTableSource {
  final List<Usuario> customers;
  //final BuildContext context;

  CustomersDataTableSource(this.customers);

  @override
  DataRow getRow(int index) {
    final customer = this.customers[index];
    final image =
        Image(image: AssetImage('assets/no-image.jpg'), width: 35, height: 35);
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
