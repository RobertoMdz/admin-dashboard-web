import 'package:admin_dashboard/models/category.dart';
import 'package:flutter/material.dart';

class CategoriesDataTableSource extends DataTableSource {
  final List<Categoria> categories;
  CategoriesDataTableSource(this.categories);

  @override
  DataRow getRow(int index) {
    final category = this.categories[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(
          Text(category.id),
        ),
        DataCell(
          Text(category.nombre),
        ),
        DataCell(
          Text(category.usuario.nombre),
        ),
        DataCell(Row(
          children: [
            IconButton(icon: Icon(Icons.edit), onPressed: () {}),
            IconButton(icon: Icon(Icons.delete), onPressed: () {}),
          ],
        )),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => categories.length;

  @override
  int get selectedRowCount => 0;
}
