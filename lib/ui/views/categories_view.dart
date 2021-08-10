import 'package:flutter/material.dart';

import '../../datatables/categories_data_source.dart';
import '../buttons/custom_icon_button.dart';
import '../labels/custom_labels.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  _CategoriesViewState createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  void initState() {
    super.initState();
  }

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
        PaginatedDataTable(
          rowsPerPage: _rowsPerPage,
          header: Text(
            'Categorias disppnibles',
            maxLines: 2,
          ),
          actions: [
            CustomIconButton(onPressed: () {}, text: 'Nuevo', icon: Icons.add)
          ],
          onRowsPerPageChanged: (value) {
            setState(() {
              _rowsPerPage = value ?? 10;
            });
          },
          columns: [
            DataColumn(label: Text('ID')),
            DataColumn(label: Text('Categoría')),
            DataColumn(label: Text('Creado por')),
            DataColumn(label: Text('Acciones')),
          ],
          source: CategoriesDataTableSource(),
        ),
      ],
    ));
  }
}
