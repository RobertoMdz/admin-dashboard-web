import 'package:admin_dashboard/models/category.dart';
import 'package:flutter/material.dart';

class CategoriesDataTableSource extends DataTableSource {
  final List<Categoria> categories;
  final BuildContext context;

  CategoriesDataTableSource(this.categories, this.context);

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
            IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  print('editando: $category');
                }),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                final dialog = AlertDialog(
                  title: Text('Eliminar'),
                  content: Text(
                      'Este elemento se eliminará permanentemente ${category.nombre}'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancelar'),
                    ),
                    TextButton(onPressed: () {}, child: Text('Eliminar'))
                  ],
                );

                showDialog(context: context, builder: (_) => dialog);
              },
            ),
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
