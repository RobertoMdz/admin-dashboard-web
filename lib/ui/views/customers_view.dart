import 'package:admin_dashboard/providers/customers_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../datatables/customers_data_source.dart';
import '../labels/custom_labels.dart';

class CustomersView extends StatelessWidget {
  const CustomersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customersProvider = Provider.of<CustomersProvider>(context);
    final customersDataSource =
        CustomersDataTableSource(customersProvider.customers);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            'Customers view',
            style: CustomLabels.h1,
          ),
          const SizedBox(height: 10),
          PaginatedDataTable(
            sortAscending: customersProvider.ascending,
            sortColumnIndex: customersProvider.sortColumnIndex,
            columns: [
              DataColumn(label: Text('Avatar')),
              DataColumn(
                label: Text('Nombre'),
                onSort: (index, _) {
                  customersProvider.sortColumnIndex = index;
                  customersProvider.sort<String>((user) => user.nombre);
                },
              ),
              DataColumn(
                label: Text('Email'),
                onSort: (index, _) {
                  customersProvider.sortColumnIndex = index;
                  customersProvider.sort<String>((user) => user.correo);
                },
              ),
              DataColumn(label: Text('UID')),
              DataColumn(label: Text('Acciones')),
            ],
            onPageChanged: (page) {
              print('page: $page');
            },
            source: customersDataSource,
          )
        ],
      ),
    );
  }
}
