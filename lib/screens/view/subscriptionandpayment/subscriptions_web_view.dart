import 'package:cageconnectdashboard/models/subscription_model.dart';
import 'package:cageconnectdashboard/widgets/custom_action_button.dart';
import 'package:cageconnectdashboard/widgets/custom_info_widget.dart';
import 'package:cageconnectdashboard/widgets/custom_status.dart';
import 'package:cageconnectdashboard/widgets/custom_table_cell.dart';
import 'package:cageconnectdashboard/widgets/custom_table_header.dart';
import 'package:flutter/material.dart';

class SubscriptionsWebView extends StatelessWidget {
  const SubscriptionsWebView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Export CSV Button
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffED1C24),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
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
                // Search and Sort
                Row(
                  children: [
                    // Search Bar
                    Container(
                      width: 300,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
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
                    const SizedBox(width: 16),
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
                          RichText(
                            text: const TextSpan(
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff060606),
                              ),
                              children: [
                                TextSpan(text: 'Sort by: '),
                                TextSpan(
                                  text: 'Latest',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
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
            const SizedBox(height: 24),
            // KPI Cards
            Row(
              children: [
                Expanded(
                  child: CustomInfoCard(
                    title: 'Total Revenue',
                    value: '250,000',
                    subtitle: '+12% this month',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomInfoCard(
                    title: 'Total Active',
                    value: '124',
                    subtitle: 'Premium User',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomInfoCard(
                    title: 'Pending Payments',
                    value: '12',
                    subtitle: 'This month',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomInfoCard(
                    title: 'Refunds Issued',
                    value: '\$12,540',
                    subtitle: 'This month',
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
                    0: FlexColumnWidth(1.5),
                    1: FlexColumnWidth(2),
                    2: FlexColumnWidth(2),
                    3: FlexColumnWidth(1.5),
                    4: FlexColumnWidth(1.5),
                    5: FlexColumnWidth(1.5),
                    6: FlexColumnWidth(1.5),
                    7: FlexColumnWidth(2),
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
                        CustomHeaderCell(text: 'Transaction ID'),
                        CustomHeaderCell(text: 'User'),
                        CustomHeaderCell(text: 'Subscription Plan'),
                        CustomHeaderCell(text: 'Payment Method'),
                        CustomHeaderCell(text: 'Status'),
                        CustomHeaderCell(text: 'Start Date'),
                        CustomHeaderCell(text: 'Expiry Date'),
                        CustomHeaderCell(text: 'Action'),
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
    final subscriptions = [
      SubscriptionData(
        'TX-9001',
        'Mike Johnson',
        'Premium Monthly',
        'Credit Card',
        'Active',
        '01 Sep 2025',
        '01 Oct 2025',
      ),
      SubscriptionData(
        'TX-9002',
        'Sarah Lee',
        'Premium Yearly',
        'PayPal',
        'In-active',
        '15 Aug 2025',
        '05 Sep 2025',
      ),
      SubscriptionData(
        'TX-9003',
        'Ahmed Khan',
        'Free',
        '-',
        'Active',
        '-',
        '-',
      ),
      SubscriptionData(
        'TX-9004',
        'David Miller',
        'Premium Monthly',
        'Credit Card',
        'Active',
        '10 Sep 2025',
        '10 Oct 2025',
      ),
      SubscriptionData(
        'TX-9005',
        'Emily Chen',
        'Premium Yearly',
        'PayPal',
        'Active',
        '20 Aug 2025',
        '20 Aug 2026',
      ),
    ];

    return subscriptions
        .map(
          (sub) => TableRow(
            decoration: BoxDecoration(
              color: subscriptions.indexOf(sub) % 2 == 0
                  ? Colors.white
                  : Colors.grey.shade50,
              border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
            ),
            children: [
              CustomTableCell(Text(sub.transactionId)),
              CustomTableCell(Text(sub.user)),
              CustomTableCell(Text(sub.plan)),
              CustomTableCell(Text(sub.paymentMethod)),
              CustomTableCell(CustomStatusBadge(sub.status)),
              CustomTableCell(Text(sub.startDate)),
              CustomTableCell(Text(sub.expiryDate)),
              CustomTableCell(CustomActionButtons(isDeactivate: true)),
            ],
          ),
        )
        .toList();
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
      padding: const EdgeInsets.all(20),
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
              fontSize: 14,
              color: isHighlighted ? Colors.white70 : Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 28,
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





//deactviate button

