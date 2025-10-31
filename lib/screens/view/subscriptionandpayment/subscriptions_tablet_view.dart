import 'package:cageconnectdashboard/models/subscription_model.dart';
import 'package:cageconnectdashboard/utils/colors.dart';
import 'package:cageconnectdashboard/widgets/custom_action_button.dart';
import 'package:cageconnectdashboard/widgets/custom_info_widget.dart';
import 'package:cageconnectdashboard/widgets/custom_status.dart';
import 'package:cageconnectdashboard/widgets/custom_table_cell.dart';
import 'package:cageconnectdashboard/widgets/custom_table_header.dart';
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
      backgroundColor: AppColors.bgColor,
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
                    backgroundColor: AppColors.primaryColor,
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
                              color: AppColors.textColor,
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
                  child: CustomInfoCard(
                    title: 'Total Revenue',
                    value: '250,000',
                    subtitle: '+12% this month',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: CustomInfoCard(
                    title: 'Total Active',
                    value: '124',
                    subtitle: 'Premium User',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: CustomInfoCard(
                    title: 'Pending Payments',
                    value: '12',
                    subtitle: 'This month',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: CustomInfoCard(
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
          SizedBox(width: 130, child: CustomHeaderCell(text: 'Txn ID')),
          SizedBox(width: 140, child: CustomHeaderCell(text: 'User')),
          SizedBox(width: 150, child: CustomHeaderCell(text: 'Plan')),
          SizedBox(width: 130, child: CustomHeaderCell(text: 'Payment')),
          SizedBox(width: 100, child: CustomHeaderCell(text: 'Status')),
          SizedBox(width: 120, child: CustomHeaderCell(text: 'Start Date')),
          SizedBox(width: 120, child: CustomHeaderCell(text: 'Expiry Date')),
          SizedBox(width: 150, child: CustomHeaderCell(text: 'Action')),
        ],
      ),
    );
  }
}

class _TabletTableRow extends StatelessWidget {
  final SubscriptionData subscription;
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
            child: CustomTableCell(
              Text(
                subscription.transactionId,
                style: const TextStyle(fontSize: 13),
              ),
            ),
          ),
          SizedBox(
            width: 140,
            child: CustomTableCell(
              Text(subscription.user, style: const TextStyle(fontSize: 13)),
            ),
          ),
          SizedBox(
            width: 150,
            child: CustomTableCell(
              Text(subscription.plan, style: const TextStyle(fontSize: 13)),
            ),
          ),
          SizedBox(
            width: 130,
            child: CustomTableCell(
              Text(
                subscription.paymentMethod,
                style: const TextStyle(fontSize: 13),
              ),
            ),
          ),
          SizedBox(
            width: 100,
            child: CustomTableCell(CustomStatusBadge(subscription.status)),
          ),
          SizedBox(
            width: 120,
            child: CustomTableCell(
              Text(
                subscription.startDate,
                style: const TextStyle(fontSize: 13),
              ),
            ),
          ),
          SizedBox(
            width: 120,
            child: CustomTableCell(
              Text(
                subscription.expiryDate,
                style: const TextStyle(fontSize: 13),
              ),
            ),
          ),
          SizedBox(width: 150, child: CustomTableCell(CustomActionButtons())),
        ],
      ),
    );
  }
}

final _subscriptions = [
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
  SubscriptionData('TX-9003', 'Ahmed Khan', 'Free', '-', 'Active', '-', '-'),
];
