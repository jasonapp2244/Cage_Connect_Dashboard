import 'package:flutter/material.dart';

class UsersWebView extends StatelessWidget {
  const UsersWebView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
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
                    horizontal: 16,
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
            const SizedBox(height: 24),
            // Table
            Expanded(
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
                  children: [
                    // Table Header
                    TableRow(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        border: Border(
                          bottom: BorderSide(color: Colors.grey.shade200),
                        ),
                      ),
                      children: const [
                        _TableHeader('User'),
                        _TableHeader('Role'),
                        _TableHeader('Email'),
                        _TableHeader('Status'),
                        _TableHeader('Subscription'),
                        _TableHeader('Joined Date'),
                        _TableHeader('Action'),
                      ],
                    ),
                    // Table Rows
                    ..._buildTableRows(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<TableRow> _buildTableRows() {
    final users = [
      _UserData(
        'Mike Johnson',
        'Promoter',
        'mikej@gmail.com',
        'Active',
        'Free',
        '05 Sep 2025',
      ),
      _UserData(
        'Sarah Lee',
        'Fighter',
        'sarahlee@yahoo.com',
        'Active',
        'Premium',
        '28 Aug 2025',
      ),
      _UserData(
        'Ahmed Khan',
        'Promoter',
        'ahmedkhan@gmail.com',
        'In-active',
        'Free',
        '01 Sep 2025',
      ),
      _UserData(
        'David Miller',
        'Fighter',
        'david.miller@gmail.com',
        'Active',
        'Premium',
        '15 Aug 2025',
      ),
      _UserData(
        'Emily Chen',
        'Promoter',
        'emily.chen@outlook.com',
        'Active',
        'Free',
        '20 Aug 2025',
      ),
      _UserData(
        'James Wilson',
        'Fighter',
        'jamesw@gmail.com',
        'In-active',
        'Premium',
        '10 Aug 2025',
      ),
    ];

    return users
        .map(
          (user) => TableRow(
            decoration: BoxDecoration(
              color: users.indexOf(user) % 2 == 0
                  ? Colors.white
                  : Colors.grey.shade50,
              border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
            ),
            children: [
              _TableCell(Text(user.name)),
              _TableCell(Text(user.role)),
              _TableCell(Text(user.email)),
              _TableCell(_StatusBadge(user.status)),
              _TableCell(_SubscriptionBadge(user.subscription)),
              _TableCell(Text(user.joinedDate)),
              _TableCell(_ActionButtons()),
            ],
          ),
        )
        .toList();
  }
}

class _FilterPill extends StatelessWidget {
  final String text;
  final bool isSelected;

  const _FilterPill({required this.text, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
          fontSize: 14,
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
      padding: const EdgeInsets.all(16.0),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
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
    return Padding(padding: const EdgeInsets.all(16.0), child: child);
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
      ),
    );
  }
}

class _ActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(Icons.visibility_outlined, color: Colors.grey.shade600),
          onPressed: () {},
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          iconSize: 20,
        ),
        //   const SizedBox(width: 8),
        IconButton(
          icon: Icon(Icons.delete_outline, color: Colors.grey.shade600),
          onPressed: () {},
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          iconSize: 20,
        ),
      ],
    );
  }
}

class _UserData {
  final String name;
  final String role;
  final String email;
  final String status;
  final String subscription;
  final String joinedDate;

  _UserData(
    this.name,
    this.role,
    this.email,
    this.status,
    this.subscription,
    this.joinedDate,
  );
}
