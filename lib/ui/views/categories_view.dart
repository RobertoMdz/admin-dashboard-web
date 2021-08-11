import 'package:admin_dashboard/providers/categories_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    Provider.of<CategoriesProvider>(context, listen: false).getCategories();
  }

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<CategoriesProvider>(context).categories;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
            source: CategoriesDataTableSource(categories, context),
          ),
        ],
      ),
    );
  }
}
