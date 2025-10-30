import 'package:cageconnectdashboard/models/event_view.dart';
import 'package:flutter/material.dart';

class EventMobileView extends StatefulWidget {
  const EventMobileView({super.key});

  @override
  State<EventMobileView> createState() => _EventMobileViewState();
}

class _EventMobileViewState extends State<EventMobileView> {
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Filter Pills
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _FilterPill(text: 'All', isSelected: true),
                  const SizedBox(width: 12),
                  _FilterPill(text: 'Mobile', isSelected: false),
                  const SizedBox(width: 12),
                  _FilterPill(text: 'Desktop', isSelected: false),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Sort Dropdown
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Sort by: Latest',
                      style: TextStyle(fontSize: 14, color: Color(0xff060606)),
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
            ),
            const SizedBox(height: 16),
            // Table with Horizontal Scroll and Scrollbar
            Expanded(
              child: Column(
                children: [
                  // Scrollable table content
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
                              770, // Total width of all columns (120+80+160+90+110+110+100)
                          child: Column(
                            children: [
                              // Header Row
                              _TableHeaderRow(),
                              // Table Rows
                              ...List.generate(
                                _users.length,
                                (index) => _MobileTableRow(
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
          SizedBox(width: 120, child: _TableHeader('Event Title')),
          SizedBox(width: 80, child: _TableHeader('Organizer')),
          SizedBox(width: 160, child: _TableHeader('Category')),
          SizedBox(width: 90, child: _TableHeader('Date & Time')),
          SizedBox(width: 110, child: _TableHeader('Status')),

          SizedBox(width: 100, child: _TableHeader('Action')),
        ],
      ),
    );
  }
}

class _MobileTableRow extends StatelessWidget {
  final EventView user;
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
          SizedBox(width: 120, child: _TableCell(Text(user.eventTitle))),
          SizedBox(width: 80, child: _TableCell(Text(user.organizer))),
          SizedBox(width: 160, child: _TableCell(Text(user.category))),
          SizedBox(
            width: 90,
            child: _TableCell(_StatusBadge(user.dateAndTime)),
          ),
          SizedBox(
            width: 110,
            child: _TableCell(_SubscriptionBadge(user.status)),
          ),

          SizedBox(width: 100, child: _TableCell(_ActionButtons())),
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
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 14.0),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 12,
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
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
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
        fontSize: 12,
      ),
    );
  }
}

class _SubscriptionBadge extends StatelessWidget {
  final String subscription;

  const _SubscriptionBadge(this.subscription);

  @override
  Widget build(BuildContext context) {
    final isPremium = subscription == 'Premium';
    return Text(
      subscription,
      style: TextStyle(
        color: isPremium ? Colors.orange : const Color(0xff060606),
        fontWeight: FontWeight.w500,
        fontSize: 12,
      ),
    );
  }
}

class _ActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(
            Icons.visibility_outlined,
            color: Colors.grey.shade600,
            size: 18,
          ),
          onPressed: () {},
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
          visualDensity: VisualDensity.compact,
        ),
        const SizedBox(width: 4),
        IconButton(
          icon: Icon(
            Icons.delete_outline,
            color: Colors.grey.shade600,
            size: 18,
          ),
          onPressed: () {},
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
          visualDensity: VisualDensity.compact,
        ),
      ],
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
