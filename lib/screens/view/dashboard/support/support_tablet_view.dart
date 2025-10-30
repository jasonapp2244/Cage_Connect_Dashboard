import 'package:flutter/material.dart';

class SupportTabletView extends StatefulWidget {
  const SupportTabletView({super.key});

  @override
  State<SupportTabletView> createState() => _SupportTabletViewState();
}

class _SupportTabletViewState extends State<SupportTabletView> {
  final ScrollController _horizontalScrollController = ScrollController();

  final List<SupportModel> _supportTickets = [
    SupportModel(
      ticketId: 'TK-1001',
      user: 'Mike Johnson',
      subject: 'Payment not reflecting in account',
      category: 'Payment Issue',
      priority: 'Active',
      status: ' Open',
      createdOn: '01 Oct 2025',
    ),
    SupportModel(
      ticketId: 'TK-1001',
      user: 'Mike Johnson',
      subject: 'Payment not reflecting in account',
      category: 'Payment Issue',
      priority: 'Active',
      status: ' Open',
      createdOn: '01 Oct 2025',
    ),
    SupportModel(
      ticketId: 'TK-1001',
      user: 'Mike Johnson',
      subject: 'Payment not reflecting in account',
      category: 'Payment Issue',
      priority: 'Medium',
      status: ' Open',
      createdOn: '01 Oct 2025',
    ),
  ];

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
            // Header Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffED1C24),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Export CSV',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 250,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search by Event Name / ID',
                          border: InputBorder.none,
                          icon: Icon(Icons.search, color: Colors.grey.shade600),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
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
                            ),
                          ),
                          const Text(
                            'Latest',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
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
              ],
            ),

            const SizedBox(height: 25),

            // Table with Horizontal Scroll
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
                    width: 1000,
                    child: Table(
                      columnWidths: const {
                        0: FixedColumnWidth(100),
                        1: FixedColumnWidth(140),
                        2: FixedColumnWidth(180),
                        3: FixedColumnWidth(130),
                        4: FixedColumnWidth(100),
                        5: FixedColumnWidth(100),
                        6: FixedColumnWidth(120),
                      },
                      border: TableBorder.symmetric(
                        inside: BorderSide(color: Colors.grey.shade200),
                        outside: BorderSide(color: Colors.grey.shade300),
                      ),
                      children: [
                        _buildTableHeader(),
                        ..._buildTableRows(_supportTickets),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TableRow _buildTableHeader() {
    return TableRow(
      decoration: BoxDecoration(color: Colors.grey.shade100),
      children: const [
        _TableHeaderCell('Ticket ID'),
        _TableHeaderCell('User'),
        _TableHeaderCell('Subject'),
        _TableHeaderCell('Category'),
        _TableHeaderCell('Priority'),
        _TableHeaderCell('Status'),
        _TableHeaderCell('Created On'),
      ],
    );
  }

  List<TableRow> _buildTableRows(List<SupportModel> tickets) {
    return tickets.map((ticket) {
      return TableRow(
        decoration: BoxDecoration(
          color: tickets.indexOf(ticket).isEven
              ? Colors.white
              : Colors.grey.shade50,
        ),
        children: [
          _buildTableCell(ticket.ticketId),
          _buildTableCell(ticket.user),
          _buildTableCell(ticket.subject),
          _buildTableCell(ticket.category),
          _buildStatusCellPriority(ticket.priority),
          _buildStatusCell(ticket.status),
          _buildTableCell(ticket.createdOn),
        ],
      );
    }).toList();
  }

  Widget _buildTableCell(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      child: Text(
        text,
        style: const TextStyle(fontSize: 13, color: Color(0xff060606)),
      ),
    );
  }

  Widget _buildStatusCell(String status) {
    final isOpen = status.toLowerCase() == 'open';
    final isProgress = status.toLowerCase() == 'in progress';
    final isClosed = status.toLowerCase() == 'closed';

    Color statusColor;

    if (isOpen) {
      statusColor = Colors.green;
    } else if (isProgress) {
      statusColor = Colors.purple;
    } else if (isClosed) {
      statusColor = Colors.red;
    } else {
      statusColor = Colors.green;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      child: Text(
        status,
        style: TextStyle(
          color: statusColor,
          fontWeight: FontWeight.w600,
          fontSize: 13,
        ),
      ),
    );
  }
}

Widget _buildStatusCellPriority(String status) {
  final isActive = status.toLowerCase() == 'Active';
  final isMedium = status.toLowerCase() == 'Medium';

  Color statusColor;

  if (isActive) {
    statusColor = Color(0xff34A853);
  } else if (isActive) {
    statusColor = Color(0xffED1C24);
  } else if (isMedium) {
    statusColor = Color(0xffF0901F);
  } else {
    statusColor = Colors.green;
  }

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
    child: Text(
      status,
      style: TextStyle(
        color: statusColor,
        fontWeight: FontWeight.w600,
        fontSize: 13,
      ),
    ),
  );
}

class _TableHeaderCell extends StatelessWidget {
  final String text;
  const _TableHeaderCell(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 13,
          color: Color(0xff060606),
        ),
      ),
    );
  }
}

class SupportModel {
  final String ticketId;
  final String user;
  final String subject;
  final String category;
  final String priority;
  final String status;
  final String createdOn;

  SupportModel({
    required this.ticketId,
    required this.user,
    required this.subject,
    required this.category,
    required this.priority,
    required this.status,
    required this.createdOn,
  });
}
