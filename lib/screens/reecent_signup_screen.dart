import 'package:cageconnectdashboard/models/user_signup.dart';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

// --- 2. Custom DataGridSource for UserSignup ---
class SignupDataSource extends DataGridSource {
  List<DataGridRow> _signupDataGridRows = [];

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

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    final int index = _signupDataGridRows.indexOf(row);
    final bool isEven = index % 2 == 0;
    final Color rowColor = isEven ? Colors.white : Colors.grey.shade50;

    return DataGridRowAdapter(
      color: rowColor,
      cells: row.getCells().map<Widget>((cell) {
        final bool isStatusColumn = cell.columnName == 'status';
        final Color statusColor = cell.value == 'Active'
            ? Colors.green.shade700
            : Colors.red.shade700;

        return Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            cell.value.toString(),
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
