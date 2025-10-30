// user_table.dart (or equivalent Flutter widget file)

import 'package:cageconnectdashboard/models/user_signup.dart';
import 'package:flutter/material.dart';

class RecentUserSignupsTable extends StatelessWidget {
  // 1. Declare the final field to hold the data
  final List<UserSignup> signups;

  // 2. Modify the constructor to require the data list
  const RecentUserSignupsTable({
    super.key,
    required this.signups, // The data is now passed in here
  });

  @override
  Widget build(BuildContext context) {
    // Data is accessed directly from the field, not generated inside the build method

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Recent User Signups',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columnSpacing: 40,
              columns: const [
                DataColumn(
                  label: Text(
                    'User',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Email',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Joined Date',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Status',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
              // Use the parameterized 'signups' list
              rows: signups.map<DataRow>((signup) {
                return DataRow(
                  cells: <DataCell>[
                    DataCell(Text(signup.user)),
                    DataCell(Text(signup.email)),
                    DataCell(Text(signup.joinedDate)),
                    DataCell(
                      Text(
                        signup.status,
                        style: TextStyle(
                          color: signup.isActive
                              ? Colors.green[700]
                              : Colors.red[700],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
