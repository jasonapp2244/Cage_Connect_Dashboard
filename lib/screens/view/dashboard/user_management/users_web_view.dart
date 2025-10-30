import 'package:cageconnectdashboard/models/user_data.dart';
import 'package:cageconnectdashboard/screens/responsive/responsive.dart';
import 'package:cageconnectdashboard/utils/colors.dart';
import 'package:cageconnectdashboard/widgets/custom_action_button.dart';
import 'package:cageconnectdashboard/widgets/custom_filter_pill.dart';
import 'package:cageconnectdashboard/widgets/custom_profile.dart';
import 'package:cageconnectdashboard/widgets/custom_searchbar.dart';
import 'package:cageconnectdashboard/widgets/custom_status.dart';
import 'package:cageconnectdashboard/widgets/custom_subscription.dart';
import 'package:cageconnectdashboard/widgets/custom_table_cell.dart';
import 'package:cageconnectdashboard/widgets/custom_table_header.dart';
import 'package:flutter/material.dart';

class UsersWebView extends StatelessWidget {
  const UsersWebView({super.key});

  @override
  Widget build(BuildContext context) {
    var adaptive = Adaptive(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderSection(adaptive),
            const SizedBox(height: 20),
            _buildFilterAndSortSection(),
            const SizedBox(height: 24),
            _buildUsersTable(),
          ],
        ),
      ),
    );
  }

  // -------------------------------
  // 🧩 1. Header Section
  // -------------------------------
  Widget _buildHeaderSection(Adaptive adaptive) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomSearchBar(hintText: 'Search by name, email, or role…'),
          Text(
            'Dashboard',
            style: TextStyle(
              fontSize: adaptive.fontSize(32),
              fontWeight: FontWeight.w900,
              color: AppColors.textColor,
            ),
          ),
          CustomProfileWidget(
            userName: 'Jamiee Dunn',
            userEmail: 'Jamie Dun',
            avatarImagePath: 'assets/images/jamie.png',
          ),
        ],
      ),
    );
  }

  // -------------------------------
  // 🧩 2. Filter + Sort Section
  // -------------------------------
  Widget _buildFilterAndSortSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [_buildFilterPills(), _buildSortDropdown()],
    );
  }

  Widget _buildFilterPills() {
    return Row(
      children: const [
        CustomFilterPill(text: 'All', isSelected: true),
        SizedBox(width: 12),
        CustomFilterPill(text: 'Mobile', isSelected: false),
        SizedBox(width: 12),
        CustomFilterPill(text: 'Desktop', isSelected: false),
      ],
    );
  }

  Widget _buildSortDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const Text(
            'Sort by: ',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xff060606),
              fontWeight: FontWeight.normal,
            ),
          ),
          const Text(
            'Latest',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xff060606),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 8),
          Icon(Icons.keyboard_arrow_down, color: Colors.grey.shade600),
        ],
      ),
    );
  }

  // -------------------------------
  // 🧩 3. Table Section
  // -------------------------------
  Widget _buildUsersTable() {
    return Expanded(
      child: SingleChildScrollView(
        child: Table(
          columnWidths: const {
            0: FlexColumnWidth(2),
            1: FlexColumnWidth(1.5),
            2: FlexColumnWidth(2.5),
            3: FlexColumnWidth(1.5),
            4: FlexColumnWidth(1.5),
            5: FlexColumnWidth(1.5),
            6: FlexColumnWidth(2),
          },
          children: [_buildTableHeader(), ..._buildTableRows()],
        ),
      ),
    );
  }

  TableRow _buildTableHeader() {
    return TableRow(
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      children: [
        CustomHeaderCell(text: 'User', width: 140),
        CustomHeaderCell(text: 'Role', width: 90),
        CustomHeaderCell(text: 'Email', width: 180),
        CustomHeaderCell(text: 'Status', width: 100),
        CustomHeaderCell(text: 'Subscription', width: 120),
        CustomHeaderCell(text: 'Joined Date', width: 130),
        CustomHeaderCell(text: 'Action', width: 110),
      ],
    );
  }

  List<TableRow> _buildTableRows() {
    final users = [
      UserData(
        'Mike Johnson',
        'Promoter',
        'mikej@gmail.com',
        'Active',
        'Free',
        '05 Sep 2025',
      ),
      UserData(
        'Sarah Lee',
        'Fighter',
        'sarahlee@yahoo.com',
        'Active',
        'Premium',
        '28 Aug 2025',
      ),
      UserData(
        'Ahmed Khan',
        'Promoter',
        'ahmedkhan@gmail.com',
        'In-active',
        'Free',
        '01 Sep 2025',
      ),
      UserData(
        'David Miller',
        'Fighter',
        'david.miller@gmail.com',
        'Active',
        'Premium',
        '15 Aug 2025',
      ),
      UserData(
        'Emily Chen',
        'Promoter',
        'emily.chen@outlook.com',
        'Active',
        'Free',
        '20 Aug 2025',
      ),
      UserData(
        'James Wilson',
        'Fighter',
        'jamesw@gmail.com',
        'In-active',
        'Premium',
        '10 Aug 2025',
      ),
    ];

    return users.map((user) {
      final isEven = users.indexOf(user) % 2 == 0;
      return TableRow(
        decoration: BoxDecoration(
          color: isEven ? Colors.white : Colors.grey.shade50,
          border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
        ),
        children: [
          CustomTableCell(Text(user.name)),
          CustomTableCell(Text(user.role)),
          CustomTableCell(Text(user.email)),
          CustomTableCell(CustomStatusBadge(user.status)),
          CustomTableCell(CustomSubscriptionBadge(user.subscription)),
          CustomTableCell(Text(user.joinedDate)),
          CustomTableCell(CustomActionButtons()),
        ],
      );
    }).toList();
  }
}

// -------------------------------
// 🧩 SUPPORTING WIDGETS
// -------------------------------
