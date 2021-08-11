import 'package:flutter/material.dart';

class CustomersDataTableSource extends DataTableSource {
  //final List<Categoria> categories;
  //final BuildContext context;

  CustomersDataTableSource();

  @override
  DataRow getRow(int index) {
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(
          Text('avatar $index'),
        ),
        DataCell(
          Text('Nombre $index'),
        ),
        DataCell(
          Text('Email $index'),
        ),
        DataCell(
          Text('UID $index'),
        ),
        DataCell(
          Text('Acciones $index'),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => 100;

  @override
  int get selectedRowCount => 0;
}
