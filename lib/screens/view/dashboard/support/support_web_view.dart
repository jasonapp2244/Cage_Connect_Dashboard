import 'package:cageconnectdashboard/models/support_ticket_model.dart';
import 'package:cageconnectdashboard/screens/responsive/responsive.dart';
import 'package:cageconnectdashboard/screens/view/dashboard/support/support_tablet_view.dart';
import 'package:cageconnectdashboard/utils/colors.dart';
import 'package:cageconnectdashboard/widgets/custom_action_button.dart';
import 'package:cageconnectdashboard/widgets/custom_filter_pill.dart';
import 'package:cageconnectdashboard/widgets/custom_status.dart';
import 'package:cageconnectdashboard/widgets/custom_table_cell.dart';
import 'package:cageconnectdashboard/widgets/custom_table_header.dart';
import 'package:flutter/material.dart';

class SupportWebView extends StatefulWidget {
  const SupportWebView({super.key});

  @override
  State<SupportWebView> createState() => _SupportWebViewState();
}

class _SupportWebViewState extends State<SupportWebView> {
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
            //  _buildHeaderSection(adaptive),
            //  const SizedBox(height: 20),
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
                          width: MediaQuery.of(context).size.width - 40,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
          Expanded(flex: 3, child: CustomHeaderCell(text: 'Ticket ID')),
          Expanded(flex: 2, child: CustomHeaderCell(text: 'User')),
          Expanded(flex: 3, child: CustomHeaderCell(text: 'Subject')),
          Expanded(flex: 2, child: CustomHeaderCell(text: 'Category')),
          Expanded(flex: 2, child: CustomHeaderCell(text: 'Priority')),
          Expanded(flex: 2, child: CustomHeaderCell(text: 'Status')),
          Expanded(flex: 2, child: CustomHeaderCell(text: 'Created On')),
          Expanded(flex: 2, child: CustomHeaderCell(text: 'Action')),
        ],
      ),
    );
  }
}

class _TabletTableRow extends StatelessWidget {
  final SupportTicketModel user;
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
          Expanded(
            flex: 3,
            child: CustomTableCell(
              Text(user.ticketId, style: const TextStyle(fontSize: 13)),
            ),
          ),
          Expanded(
            flex: 2,
            child: CustomTableCell(
              Text(user.user, style: const TextStyle(fontSize: 13)),
            ),
          ),
          Expanded(
            flex: 3,
            child: CustomTableCell(
              Text(user.subject, style: const TextStyle(fontSize: 13)),
            ),
          ),
          Expanded(
            flex: 2,
            child: CustomTableCell(
              Text(user.category, style: const TextStyle(fontSize: 13)),
            ),
          ),
          Expanded(
            flex: 2,
            child: CustomTableCell(CustomStatusBadge(user.priority)),
          ),
          Expanded(
            flex: 2,
            child: CustomTableCell(CustomStatusBadge(user.status)),
          ),
          Expanded(
            flex: 2,
            child: CustomTableCell(
              Text(
                user.createdOn,
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.textColor,
                ),
              ),
            ),
          ),
          Expanded(flex: 2, child: Icon(Icons.delete_outline)),
        ],
      ),
    );
  }
}

final _users = [
  SupportTicketModel(
    ticketId: 'TK-1001',
    user: 'Mike Johnson',
    subject: 'Payment not reflecting in account',
    category: 'Payment issue',
    priority: 'Active',
    status: 'Open',
    createdOn: '01 Sep 2025',
  ),
];
