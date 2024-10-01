import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'data_table_controller.dart';

class DataTableDemo extends StatelessWidget {
  final DataTableController controller = Get.put(DataTableController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic Row Data in Table Format'),
      ),
      body: Container(
        color: Colors.white,
        child: PaginatedDataTable(
            header: Text('Data Table Example'),
            rowsPerPage: 4,
            columns: [
              DataColumn(label: Text('Number')),
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Age')),
              DataColumn(label: Text('Job')),
              DataColumn(label: Text('Action')),
            ],
            source: CustomDataSource(controller), // Pass the controller to the data source
          ),

      ),
    );
  }
}

class CustomDataSource extends DataTableSource {
  final DataTableController controller;

  CustomDataSource(this.controller);

  @override
  DataRow? getRow(int index) {
    if (index >= controller.rows.length) return null; // Handle index out of bounds
    final row = controller.rows[index];

    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(row.number.toString())),
        DataCell(Text(row.name)),
        DataCell(Text(row.age.toString())),
        DataCell(Text(row.job)),
        DataCell(
          ElevatedButton(
            onPressed: () => controller.onRowAction(row.name), // Use the controller action
            child: Text('Action'),
          ),
        ),
      ],
    );
  }

  @override
  int get rowCount => controller.rows.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
