import 'package:flutter/material.dart';

class SubscriptionsTabletView extends StatefulWidget {
  const SubscriptionsTabletView({super.key});

  @override
  State<SubscriptionsTabletView> createState() =>
      _SubscriptionsTabletViewState();
}

class _SubscriptionsTabletViewState extends State<SubscriptionsTabletView> {
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
              ],
            ),
            const SizedBox(height: 20),
            // KPI Cards
            Row(
              children: [
                Expanded(
                  child: _KPICard(
                    title: 'Total Revenue',
                    value: '250,000',
                    subtitle: '+12% this month',
                    isHighlighted: true,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _KPICard(
                    title: 'Total Active',
                    value: '124',
                    subtitle: 'Premium User',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _KPICard(
                    title: 'Pending Payments',
                    value: '12',
                    subtitle: 'This month',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _KPICard(
                    title: 'Refunds Issued',
                    value: '\$12,540',
                    subtitle: 'This month',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Table with Horizontal Scroll
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
                          width: 1100,
                          child: Column(
                            children: [
                              _TableHeaderRow(),
                              ...List.generate(
                                _subscriptions.length,
                                (index) => _TabletTableRow(
                                  subscription: _subscriptions[index],
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
          SizedBox(width: 130, child: _TableHeader('Txn ID')),
          SizedBox(width: 140, child: _TableHeader('User')),
          SizedBox(width: 150, child: _TableHeader('Plan')),
          SizedBox(width: 130, child: _TableHeader('Payment')),
          SizedBox(width: 100, child: _TableHeader('Status')),
          SizedBox(width: 120, child: _TableHeader('Start Date')),
          SizedBox(width: 120, child: _TableHeader('Expiry Date')),
          SizedBox(width: 150, child: _TableHeader('Action')),
        ],
      ),
    );
  }
}

class _TabletTableRow extends StatelessWidget {
  final _SubscriptionData subscription;
  final int index;

  const _TabletTableRow({required this.subscription, required this.index});

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
            width: 130,
            child: _TableCell(
              Text(
                subscription.transactionId,
                style: const TextStyle(fontSize: 13),
              ),
            ),
          ),
          SizedBox(
            width: 140,
            child: _TableCell(
              Text(subscription.user, style: const TextStyle(fontSize: 13)),
            ),
          ),
          SizedBox(
            width: 150,
            child: _TableCell(
              Text(subscription.plan, style: const TextStyle(fontSize: 13)),
            ),
          ),
          SizedBox(
            width: 130,
            child: _TableCell(
              Text(
                subscription.paymentMethod,
                style: const TextStyle(fontSize: 13),
              ),
            ),
          ),
          SizedBox(
            width: 100,
            child: _TableCell(_StatusBadge(subscription.status)),
          ),
          SizedBox(
            width: 120,
            child: _TableCell(
              Text(
                subscription.startDate,
                style: const TextStyle(fontSize: 13),
              ),
            ),
          ),
          SizedBox(
            width: 120,
            child: _TableCell(
              Text(
                subscription.expiryDate,
                style: const TextStyle(fontSize: 13),
              ),
            ),
          ),
          SizedBox(width: 150, child: _TableCell(_ActionButtons())),
        ],
      ),
    );
  }
}

class _KPICard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final bool isHighlighted;

  const _KPICard({
    required this.title,
    required this.value,
    required this.subtitle,
    this.isHighlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: isHighlighted ? const Color(0xffED1C24) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 13,
              color: isHighlighted ? Colors.white70 : Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: isHighlighted ? Colors.white : const Color(0xff060606),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 12,
              color: isHighlighted ? Colors.white70 : Colors.grey.shade600,
            ),
          ),
        ],
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
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 14.0),
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
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
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

class _ActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(Icons.edit_outlined, color: Colors.grey.shade600),
          onPressed: () {},
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          iconSize: 20,
        ),
        const SizedBox(width: 8),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffED1C24),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: const Text(
            'Deactivate',
            style: TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

final _subscriptions = [
  _SubscriptionData(
    'TX-9001',
    'Mike Johnson',
    'Premium Monthly',
    'Credit Card',
    'Active',
    '01 Sep 2025',
    '01 Oct 2025',
  ),
  _SubscriptionData(
    'TX-9002',
    'Sarah Lee',
    'Premium Yearly',
    'PayPal',
    'In-active',
    '15 Aug 2025',
    '05 Sep 2025',
  ),
  _SubscriptionData('TX-9003', 'Ahmed Khan', 'Free', '-', 'Active', '-', '-'),
];

class _SubscriptionData {
  final String transactionId;
  final String user;
  final String plan;
  final String paymentMethod;
  final String status;
  final String startDate;
  final String expiryDate;

  _SubscriptionData(
    this.transactionId,
    this.user,
    this.plan,
    this.paymentMethod,
    this.status,
    this.startDate,
    this.expiryDate,
  );
}
