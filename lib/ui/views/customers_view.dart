import 'package:flutter/material.dart';

import '../../datatables/customers_data_source.dart';
import '../labels/custom_labels.dart';

class CustomersView extends StatelessWidget {
  const CustomersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customersDataSource = CustomersDataTableSource();
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
            columns: [
              DataColumn(label: Text('Avatar')),
              DataColumn(label: Text('Nombre')),
              DataColumn(label: Text('Email')),
              DataColumn(label: Text('UID')),
              DataColumn(label: Text('Acciones')),
            ],
            source: customersDataSource,
          )
        ],
      ),
    );
  }
}
