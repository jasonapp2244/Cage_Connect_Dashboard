import 'package:cageconnectdashboard/models/event_view.dart';
import 'package:cageconnectdashboard/widgets/custom_action_button.dart';
import 'package:cageconnectdashboard/widgets/custom_status.dart';
import 'package:cageconnectdashboard/widgets/custom_table_cell.dart';
import 'package:cageconnectdashboard/widgets/custom_table_header.dart';
import 'package:flutter/material.dart';

class EventTabletView extends StatefulWidget {
  const EventTabletView({super.key});

  @override
  State<EventTabletView> createState() => _EventTabletViewState();
}

class _EventTabletViewState extends State<EventTabletView> {
  final ScrollController _horizontalScrollController = ScrollController();

  @override
  void dispose() {
    _horizontalScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Filter and Sort Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Filter Pills
                Row(
                  children: [
                    _FilterPill(text: 'All', isSelected: true),
                    const SizedBox(width: 12),
                    _FilterPill(text: 'Mobile', isSelected: false),
                    const SizedBox(width: 12),
                    _FilterPill(text: 'Desktop', isSelected: false),
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
                          width: 900, // Tablet table width
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

class _FilterPill extends StatelessWidget {
  final String text;
  final bool isSelected;

  const _FilterPill({required this.text, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xffED1C24) : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? const Color(0xffED1C24) : Colors.grey.shade300,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.grey.shade600,
          fontSize: 13,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
    );
  }
}

final _users = [
  EventView(
    'Blood Donation Camp',
    'Mike Johnson',
    'mikej@gmail.com',
    '12 Sep 2025, 10:00 AM',
    'Active',
    '2-05-2025',
  ),
  EventView(
    'Eye Checkup Driv',
    'Sarah Lee',
    'mikej@gmail.com',
    '15 Sep 2025, 2:00 PM',
    'In-active',
    '2-05-2025',
  ),
];
