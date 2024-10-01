import 'package:get/get.dart';
import 'package:reuseable_widget_flutter/re_use_able_widgets/table%20format/table_data_model.dart';

class DataTableController extends GetxController {
  // List of row data
  var rows = <RowData>[
    RowData(1, 'John Doe', 25, 'Developer'),
    RowData(2, 'Jane Smith', 30, 'Designer'),
    RowData(3, 'Alex Johnson', 22, 'Product Manager'),
    RowData(4, 'Emily White', 27, 'Marketing'),
    RowData(5, 'Michael Brown', 35, 'Sales'),
    RowData(6, 'Olivia Davis', 28, 'HR'),
    RowData(7, 'Sophia Wilson', 24, 'Engineer'),
  ].obs; // Make it observable

  void onRowAction(String name) {
    print('Action for $name'); // Placeholder for action logic
  }
}
