import 'package:cageconnectdashboard/models/subscription_model.dart';
import 'package:cageconnectdashboard/screens/responsive/responsive.dart';
import 'package:cageconnectdashboard/utils/colors.dart';
import 'package:cageconnectdashboard/widgets/custom_action_button.dart';
import 'package:cageconnectdashboard/widgets/custom_status.dart';
import 'package:cageconnectdashboard/widgets/custom_table_cell.dart'
    show CustomTableCell;
import 'package:cageconnectdashboard/widgets/custom_table_header.dart';
import 'package:flutter/material.dart';

class SubscriptionsMobileView extends StatefulWidget {
  const SubscriptionsMobileView({super.key});

  @override
  State<SubscriptionsMobileView> createState() =>
      _SubscriptionsMobileViewState();
}

class _SubscriptionsMobileViewState extends State<SubscriptionsMobileView> {
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Export CSV Button
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
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Sort by: ',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.textColor.withOpacity(
                                0.7,
                              ), // lighter
                            ),
                          ),
                          TextSpan(
                            text: 'Latest',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.textColor, // darker
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
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
            SizedBox(height: 10),
            Row(
              children: [
                // Search Bar
                Expanded(
                  child: Container(
                    height: 48,
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 5),
                        hintText: 'Search by Event Name / ID',
                        border: InputBorder.none,
                        icon: Icon(Icons.search, color: Colors.grey.shade600),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: Adaptive(context).width(5)),
                SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: const Text(
                      'Export CSV',
                      style: TextStyle(
                        color: AppColors.bgColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 140,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 32,
                    child: _KPICard(
                      title: 'Total Revenue',
                      value: '250,000',
                      subtitle: '+12% this month',
                      isHighlighted: true,
                    ),
                  ),
                  const SizedBox(width: 12),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 32,
                    child: _KPICard(
                      title: 'Total Active',
                      value: '124',
                      subtitle: 'Premium User',
                    ),
                  ),
                  const SizedBox(width: 12),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 32,
                    child: _KPICard(
                      title: 'Pending Payments',
                      value: '12',
                      subtitle: 'This month',
                    ),
                  ),
                  const SizedBox(width: 12),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 32,
                    child: _KPICard(
                      title: 'Refunds Issued',
                      value: '\$12,540',
                      subtitle: 'This month',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
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
                          width:
                              920, // Total width (120+120+140+120+90+110+110+110)
                          child: Column(
                            children: [
                              _TableHeaderRow(),
                              ...List.generate(
                                _subscriptions.length,
                                (index) => _MobileTableRow(
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
          SizedBox(width: 120, child: CustomHeaderCell(text: 'Txn ID')),
          SizedBox(width: 120, child: CustomHeaderCell(text: 'User')),
          SizedBox(width: 140, child: CustomHeaderCell(text: 'Plan')),
          SizedBox(width: 120, child: CustomHeaderCell(text: 'Payment')),
          SizedBox(width: 90, child: CustomHeaderCell(text: 'Status')),
          SizedBox(width: 110, child: CustomHeaderCell(text: 'Start')),
          SizedBox(width: 110, child: CustomHeaderCell(text: 'Expiry')),
          SizedBox(
            width: 110,
            child: CustomHeaderCell(text: 'Action'),
          ), // Match row width
        ],
      ),
    );
  }
}

class _MobileTableRow extends StatelessWidget {
  final SubscriptionData subscription;
  final int index;

  const _MobileTableRow({required this.subscription, required this.index});

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
            width: 120,
            child: CustomTableCell(Text(subscription.transactionId)),
          ),
          SizedBox(width: 120, child: CustomTableCell(Text(subscription.user))),
          SizedBox(width: 140, child: CustomTableCell(Text(subscription.plan))),
          SizedBox(
            width: 120,
            child: CustomTableCell(Text(subscription.paymentMethod)),
          ),
          SizedBox(
            width: 90,
            child: CustomTableCell(CustomStatusBadge(subscription.status)),
          ),
          SizedBox(
            width: 110,
            child: CustomTableCell(Text(subscription.startDate)),
          ),
          SizedBox(
            width: 110,
            child: CustomTableCell(Text(subscription.expiryDate)),
          ),
          SizedBox(width: 110, child: CustomTableCell(CustomActionButtons())),
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
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isHighlighted ? AppColors.primaryColor : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: isHighlighted ? Colors.white70 : Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: isHighlighted ? Colors.white : const Color(0xff060606),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 11,
              color: isHighlighted ? Colors.white70 : Colors.grey.shade600,
            ),
          ),
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
