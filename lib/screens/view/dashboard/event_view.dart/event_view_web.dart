import 'package:cageconnectdashboard/models/event_view.dart';
import 'package:cageconnectdashboard/screens/responsive/responsive.dart';
import 'package:cageconnectdashboard/utils/colors.dart';
import 'package:cageconnectdashboard/widgets/custom_action_button.dart';
import 'package:cageconnectdashboard/widgets/custom_filter_pill.dart';
import 'package:cageconnectdashboard/widgets/custom_profile.dart';
import 'package:cageconnectdashboard/widgets/custom_searchbar.dart';
import 'package:cageconnectdashboard/widgets/custom_status.dart';
import 'package:cageconnectdashboard/widgets/custom_table_cell.dart';
import 'package:cageconnectdashboard/widgets/custom_table_header.dart';
import 'package:flutter/material.dart';

class EventWebView extends StatefulWidget {
  const EventWebView({super.key});

  @override
  State<EventWebView> createState() => _EventWebViewState();
}

class _EventWebViewState extends State<EventWebView> {
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
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderSection(adaptive),
            const SizedBox(height: 20),
            // Filter and Sort Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Filter Pills
                Row(
                  children: [
                    CustomFilterPill(text: 'All', isSelected: true),
                    const SizedBox(width: 12),
                    CustomFilterPill(text: 'Mobile', isSelected: false),
                    const SizedBox(width: 12),
                    CustomFilterPill(text: 'Desktop', isSelected: false),
                  ],
                ),
                // Sort Dropdown
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const Text(
                        'Sort by: Latest',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff060606),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey.shade600,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Compact Table with Horizontal Scroll
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Scrollbar(
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
                          width:
                              750, // Adjusted table width to match column widths
                          child: Column(
                            children: [
                              // Header Row
                              _TableHeaderRow(),
                              // Table Rows
                              ...List.generate(
                                _users.length,
                                (index) => _TabletTableRow(
                                  user: _users[index],
                                  index: index,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 🧩 HEADER SECTION
// -----------------------
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
        children: [
          CustomHeaderCell(text: 'Events Title', width: 140),
          CustomHeaderCell(text: 'Organizer', width: 90),
          CustomHeaderCell(text: 'Category', width: 180),
          CustomHeaderCell(text: 'Date & Time', width: 100),
          CustomHeaderCell(text: 'Status', width: 120),
          CustomHeaderCell(text: 'Action', width: 120),
        ],
      ),
    );
  }
}

class _TabletTableRow extends StatelessWidget {
  final EventView user;
  final int index;

  const _TabletTableRow({required this.user, required this.index});

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
          SizedBox(
            width: 140,
            child: CustomTableCell(
              Text(user.eventTitle, style: const TextStyle(fontSize: 13)),
            ),
          ),
          SizedBox(
            width: 90,
            child: CustomTableCell(
              Text(user.organizer, style: const TextStyle(fontSize: 13)),
            ),
          ),
          SizedBox(
            width: 180,
            child: CustomTableCell(
              Text(user.category, style: const TextStyle(fontSize: 13)),
            ),
          ),
          SizedBox(
            width: 100,
            child: CustomTableCell(
              Text(user.dateAndTime, style: const TextStyle(fontSize: 13)),
            ),
          ),
          SizedBox(
            width: 120,
            child: CustomTableCell(CustomStatusBadge(user.status)),
          ),
          SizedBox(width: 120, child: CustomTableCell(CustomActionButtons())),
        ],
      ),
    );
  }
}

final _users = [
  EventView(
    'Blood Donation Camp', // eventTitle
    'Mike Johnson', // organizer
    'Health', // category
    '12 Sep 2025, 10:00 AM', // dateAndTime
    'Active', // status
    '05 Sep 2025', // date
  ),
  EventView(
    'Eye Checkup Drive',
    'Sarah Lee',
    'Health',
    '15 Sep 2025, 2:00 PM',
    'In-active',
    '08 Sep 2025',
  ),
];
