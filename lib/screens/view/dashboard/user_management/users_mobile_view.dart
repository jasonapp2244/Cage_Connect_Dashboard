import 'package:cageconnectdashboard/models/user_data.dart';
import 'package:cageconnectdashboard/screens/responsive/responsive.dart';
import 'package:cageconnectdashboard/utils/colors.dart';
import 'package:cageconnectdashboard/widgets/custom_action_button.dart';
import 'package:cageconnectdashboard/widgets/custom_filter_pill.dart';
import 'package:cageconnectdashboard/widgets/custom_profile.dart';
import 'package:cageconnectdashboard/widgets/custom_status.dart';
import 'package:cageconnectdashboard/widgets/custom_subscription.dart';
import 'package:cageconnectdashboard/widgets/custom_table_cell.dart';
import 'package:cageconnectdashboard/widgets/custom_table_header.dart';
import 'package:flutter/material.dart';

class UsersMobileView extends StatefulWidget {
  const UsersMobileView({super.key});

  @override
  State<UsersMobileView> createState() => _UsersMobileViewState();
}

class _UsersMobileViewState extends State<UsersMobileView> {
  final ScrollController _horizontalScrollController = ScrollController();

  @override
  void dispose() {
    _horizontalScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var adaptive = Adaptive(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFilterSection(),
            const SizedBox(height: 16),
            _buildSortSection(adaptive),
            const SizedBox(height: 16),
            Expanded(child: _buildUserTableSection()),
          ],
        ),
      ),
    );
  }

  // --------------------------
  // 🧩 HEADER SECTION
  // --------------------------
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
          Text(
            'Users',
            style: TextStyle(
              fontSize: adaptive.fontSize(32),
              fontWeight: FontWeight.w900,
              color: AppColors.textColor,
            ),
          ),
          const CustomProfileWidget(
            userName: 'Jamiee Dunn',
            userEmail: 'Jamie Dun',
            avatarImagePath: 'assets/images/jamie.png',
          ),
        ],
      ),
    );
  }

  // --------------------------
  // 🏷️ FILTER PILLS SECTION
  // --------------------------
  Widget _buildFilterSection() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: const [
          CustomFilterPill(text: 'All', isSelected: true),
          SizedBox(width: 12),
          CustomFilterPill(text: 'Mobile', isSelected: false),
          SizedBox(width: 12),
          CustomFilterPill(text: 'Desktop', isSelected: false),
        ],
      ),
    );
  }

  // --------------------------
  // ⚙️ SORT DROPDOWN SECTION
  // --------------------------
  Widget _buildSortSection(Adaptive adaptive) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Sort by: ',
                    style: TextStyle(
                      fontSize: adaptive.fontSize(14),
                      color: const Color(0xff060606),
                    ),
                  ),
                  TextSpan(
                    text: 'Latest',
                    style: TextStyle(
                      fontSize: adaptive.fontSize(14),
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              Icons.keyboard_arrow_down,
              color: Colors.grey.shade600,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  // --------------------------
  // 📋 USER TABLE SECTION
  // --------------------------
  Widget _buildUserTableSection() {
    return Scrollbar(
      controller: _horizontalScrollController,
      thumbVisibility: true,
      thickness: 10,
      radius: const Radius.circular(5),
      scrollbarOrientation: ScrollbarOrientation.bottom,
      child: SingleChildScrollView(
        controller: _horizontalScrollController,
        scrollDirection: Axis.horizontal,
        physics: const AlwaysScrollableScrollPhysics(),
        child: SizedBox(
          width: 770,
          child: Column(
            children: [
              const _TableHeaderRow(),
              ...List.generate(
                _users.length,
                (index) => _MobileTableRow(user: _users[index], index: index),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TableHeaderRow extends StatelessWidget {
  const _TableHeaderRow();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        children: const [
          CustomHeaderCell(text: 'User', width: 140),
          CustomHeaderCell(text: 'Role', width: 90),
          CustomHeaderCell(text: 'Email', width: 180),
          CustomHeaderCell(text: 'Status', width: 100),
          CustomHeaderCell(text: 'Subscription', width: 120),
          CustomHeaderCell(text: 'Joined Date', width: 130),
          CustomHeaderCell(text: 'Action', width: 110),
        ],
      ),
    );
  }
}

class _MobileTableRow extends StatelessWidget {
  final UserData user;
  final int index;

  const _MobileTableRow({required this.user, required this.index});

  @override
  Widget build(BuildContext context) {
    final isEven = index % 2 == 0;

    return Container(
      decoration: BoxDecoration(
        color: isEven ? Colors.white : Colors.grey.shade50,
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        children: [
          CustomTableCell(Text(user.name)),
          CustomTableCell(Text(user.role)),
          CustomTableCell(Text(user.email)),
          CustomTableCell(CustomStatusBadge(user.status)),
          CustomTableCell(CustomSubscriptionBadge(user.subscription)),
          CustomTableCell(Text(user.joinedDate)),
          CustomTableCell(CustomActionButtons()),
        ],
      ),
    );
  }
}

//
final _users = [
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
