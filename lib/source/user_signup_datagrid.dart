import 'package:cageconnectdashboard/models/user_signup.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

// --- 2. Custom DataGridSource for Reusability ---
class SignupDataSource extends DataGridSource {
  List<DataGridRow> _signupDataGridRows = [];

  // Constructor: Takes the list of data and maps it to DataGridRow objects
  SignupDataSource({required List<UserSignup> signupData}) {
    _signupDataGridRows = signupData.map<DataGridRow>((user) {
      return DataGridRow(
        cells: [
          DataGridCell<String>(columnName: 'user', value: user.user),
          DataGridCell<String>(columnName: 'email', value: user.email),
          DataGridCell<String>(
            columnName: 'joinedDate',
            value: user.joinedDate,
          ),
          DataGridCell<String>(columnName: 'status', value: user.status),
        ],
      );
    }).toList();
  }

  @override
  List<DataGridRow> get rows => _signupDataGridRows;

  // --- CUSTOM ROW & CELL WIDGET LOGIC ---
  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    final int index = _signupDataGridRows.indexOf(row);
    final bool isEven = index % 2 == 0;

    // 1. Define alternate row color
    final Color rowColor = isEven ? Colors.white : Colors.grey.shade50;

    return DataGridRowAdapter(
      color: rowColor, // Apply custom row background color
      cells: row.getCells().map<Widget>((dataGridCell) {
        // Determine Status cell color
        final bool isStatusColumn = dataGridCell.columnName == 'status';
        final Color statusColor = dataGridCell.value == 'Active'
            ? Colors.green.shade700
            : Colors.red.shade700;

        // 2. Load custom widget (Text) in the cell
        return Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            dataGridCell.value.toString(),
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: isStatusColumn ? FontWeight.bold : FontWeight.normal,
              color: isStatusColumn ? statusColor : Colors.black87,
            ),
          ),
        );
      }).toList(),
    );
  }
}
