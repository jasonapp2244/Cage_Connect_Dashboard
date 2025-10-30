import 'package:flutter/material.dart';

class EventsWebView extends StatefulWidget {
  const EventsWebView({super.key});

  @override
  State<EventsWebView> createState() => _EventsWebViewState();
}

class _EventsWebViewState extends State<EventsWebView> {
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
          SizedBox(width: 140, child: _TableHeader('Events Title')),
          SizedBox(width: 90, child: _TableHeader('Organizer')),
          SizedBox(width: 180, child: _TableHeader('Category')),
          SizedBox(width: 100, child: _TableHeader('Date & Time')),
          SizedBox(width: 120, child: _TableHeader('Status')),

          SizedBox(width: 120, child: _TableHeader('Action')),
        ],
      ),
    );
  }
}

class _TabletTableRow extends StatelessWidget {
  final _UserData user;
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
            child: _TableCell(
              Text(user.eventTitle, style: const TextStyle(fontSize: 13)),
            ),
          ),
          SizedBox(
            width: 90,
            child: _TableCell(
              Text(user.organizer, style: const TextStyle(fontSize: 13)),
            ),
          ),
          SizedBox(
            width: 180,
            child: _TableCell(
              Text(user.category, style: const TextStyle(fontSize: 13)),
            ),
          ),
          SizedBox(
            width: 100,
            child: _TableCell(
              Text(user.dateAndTime, style: const TextStyle(fontSize: 13)),
            ),
          ),
          SizedBox(width: 120, child: _TableCell(_StatusBadge(user.status))),
          SizedBox(width: 120, child: _TableCell(_ActionButtons())),
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

class _TableHeader extends StatelessWidget {
  final String text;

  const _TableHeader(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 14.0),
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

class _TableCell extends StatelessWidget {
  final Widget child;

  const _TableCell(this.child);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      child: child,
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final String status;

  const _StatusBadge(this.status);

  @override
  Widget build(BuildContext context) {
    final isActive = status == 'Active';
    return Text(
      status,
      style: TextStyle(
        color: isActive ? Colors.green : Colors.red,
        fontWeight: FontWeight.w500,
        fontSize: 13,
      ),
    );
  }
}

// Removed unused _SubscriptionBadge after aligning table columns

class _ActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(
            Icons.visibility_outlined,
            color: Colors.grey.shade600,
            size: 20,
          ),
          onPressed: () {},
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
        const SizedBox(width: 8),
        IconButton(
          icon: Icon(
            Icons.delete_outline,
            color: Colors.grey.shade600,
            size: 20,
          ),
          onPressed: () {},
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
      ],
    );
  }
}

final _users = [
  _UserData(
    'Blood Donation Camp',
    'Mike Johnson',
    'mikej@gmail.com',
    '12 Sep 2025, 10:00 AM',
    'Active',
  ),
  _UserData(
    'Eye Checkup Driv',
    'Sarah Lee',
    'mikej@gmail.com',
    '15 Sep 2025, 2:00 PM',
    'In-active',
  ),
  _UserData(
    'Blood Donation Camp',
    'Mike Johnson',
    'mikej@gmail.com',
    '12 Sep 2025, 10:00 AM',
    'Active',
  ),
  _UserData(
    'Eye Checkup Driv',
    'Sarah Lee',
    'mikej@gmail.com',
    '15 Sep 2025, 2:00 PM',
    'In-active',
  ),
  _UserData(
    'Blood Donation Camp',
    'Mike Johnson',
    'mikej@gmail.com',
    '12 Sep 2025, 10:00 AM',
    'Active',
  ),
  _UserData(
    'Eye Checkup Driv',
    'Sarah Lee',
    'mikej@gmail.com',
    '15 Sep 2025, 2:00 PM',
    'In-active',
  ),
];

class _UserData {
  final String eventTitle;
  final String organizer;
  final String category;
  final String dateAndTime;
  final String status;

  _UserData(
    this.eventTitle,
    this.organizer,
    this.category,
    this.dateAndTime,
    this.status,
  );
}
