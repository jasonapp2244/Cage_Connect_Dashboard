import 'package:cageconnectdashboard/screens/responsive/responsive.dart';
import 'package:cageconnectdashboard/widgets/custom_profile.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../utils/colors.dart';
import '../../../../widgets/custom_info_widget.dart';

class DashboardMobileScreen extends StatefulWidget {
  const DashboardMobileScreen({super.key});

  @override
  State<DashboardMobileScreen> createState() => _DashboardMobileScreenState();
}

class _DashboardMobileScreenState extends State<DashboardMobileScreen> {
  @override
  Widget build(BuildContext context) {
    final adaptive = Adaptive(context);

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.cardColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: adaptive.paddingSymmetric(horizontal: 2, vertical: 5),
                child: Column(
                  children: [
                    _buildDashboardOverview(adaptive),
                    const SizedBox(height: 20),
                    _buildChartsSection(),
                    const SizedBox(height: 20),
                    _buildSignupAndRevenueSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // -----------------------
  // 🧩 HEADER SECTION
  // -----------------------
  Widget _buildHeaderSection(Adaptive adaptive) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(30),
      ),
      padding: adaptive.paddingSymmetric(horizontal: 2, vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Dashboard',
            style: TextStyle(
              fontSize: adaptive.fontSize(32),
              fontWeight: FontWeight.w900,
              color: AppColors.textColor,
            ),
          ),
          CustomProfileWidget(
            userName: 'Jamiee Dunn',
            userEmail: 'Jamie Dun',
            avatarImagePath: 'assets/images/jamie.png',
          ),
        ],
      ),
    );
  }

  // -----------------------
  // 📊 DASHBOARD OVERVIEW (2 CARDS PER ROW)
  // -----------------------
  Widget _buildDashboardOverview(Adaptive adaptive) {
    final List<Map<String, String>> stats = [
      {"title": "Total Users", "value": "8,420", "subtitle": "+12% this month"},
      {"title": "Active Events", "value": "124", "subtitle": "Events live now"},
      {
        "title": "Premium Subscriptions",
        "value": "\$2,190",
        "subtitle": "Active Premium",
      },
      {
        "title": "Total Revenue",
        "value": "\$12,540",
        "subtitle": "Earned 6 months",
      },
    ];

    return GridView.builder(
      itemCount: stats.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // ✅ 2 per row
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.6,
      ),
      itemBuilder: (context, index) {
        final data = stats[index];
        return CustomInfoCard(
          title: data["title"]!,
          value: data["value"]!,
          subtitle: data["subtitle"]!,
        );
      },
    );
  }

  // -----------------------
  // 📈 CHARTS SECTION
  // -----------------------
  Widget _buildChartsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildEngagementChartCard(),
        const SizedBox(height: 20),
        _buildActiveUsersChartCard(),
      ],
    );
  }

  Widget _buildEngagementChartCard() {
    var adaptive = Adaptive(context);
    return _buildCard(
      title: "Engagement Overview",
      child: SizedBox(
        height: 250,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: BarChart(
            BarChartData(
              borderData: FlBorderData(show: false),
              gridData: FlGridData(show: false),
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 40,
                    getTitlesWidget: (value, meta) => Text(
                      '${value.toInt()}',
                      style: const TextStyle(fontSize: 10),
                    ),
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      final labels = ['Events', 'Fighters', 'Chats', 'Reviews'];
                      if (value.toInt() >= labels.length) {
                        return const SizedBox();
                      }
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          labels[value.toInt()],
                          style: TextStyle(fontSize: adaptive.fontSize(12)),
                        ),
                      );
                    },
                  ),
                ),
              ),
              barGroups: [
                _bar(0, 4000),
                _bar(1, 2000),
                _bar(2, 6000),
                _bar(3, 3500),
              ],
              maxY: 10000,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActiveUsersChartCard() {
    var adaptive = Adaptive(context);
    return _buildCard(
      title: "Total Active Users",
      trailing: const _SegmentControl(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Text(
            "12,653.6",
            style: TextStyle(
              fontSize: adaptive.fontSize(12),
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 180,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 200,
                gridData: FlGridData(show: true, drawVerticalLine: false),
                borderData: FlBorderData(show: false),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      interval: 50,
                      getTitlesWidget: (value, meta) => Text(
                        '\$${(value ~/ 50)}k',
                        style: const TextStyle(fontSize: 10),
                      ),
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 25,
                      getTitlesWidget: (value, meta) {
                        final months = [
                          'Jan',
                          'Feb',
                          'Mar',
                          'Apr',
                          'May',
                          'Jun',
                          'Jul',
                          'Aug',
                          'Sep',
                          'Oct',
                          'Nov',
                          'Dec',
                        ];
                        if (value.toInt() >= months.length) {
                          return const SizedBox();
                        }
                        return Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            months[value.toInt()],
                            style: TextStyle(fontSize: adaptive.fontSize(10)),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                barGroups: List.generate(
                  12,
                  (i) => BarChartGroupData(
                    x: i,
                    barRods: [
                      BarChartRodData(
                        toY: [
                          100,
                          120,
                          90,
                          70,
                          140,
                          160,
                          120,
                          180,
                          80,
                          100,
                          140,
                          170,
                        ][i].toDouble(),
                        color: AppColors.primaryColor,
                        width: 12,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // -----------------------
  // 📋 SIGNUPS + REVENUE SECTION
  // -----------------------
  Widget _buildSignupAndRevenueSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: AppColors.textColor.withOpacity(0.1),
                blurRadius: 5,
              ),
            ],
          ),
          height: 200,
        ),
        const SizedBox(height: 20),
        _buildRevenueBreakdown(),
      ],
    );
  }

  Widget _buildRevenueBreakdown() {
    final List<RevenueData> data = [
      RevenueData('Subscriptions', 70, Colors.green),
      RevenueData('Promotions', 20, Colors.orange),
      RevenueData('Other', 10, Colors.blueGrey),
    ];

    return _buildCard(
      title: "Revenue Breakdown",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SfCircularChart(
            legend: const Legend(isVisible: false),
            series: <CircularSeries>[
              PieSeries<RevenueData, String>(
                dataSource: data,
                xValueMapper: (d, _) => d.category,
                yValueMapper: (d, _) => d.percentage,
                pointColorMapper: (d, _) => d.color,
                dataLabelSettings: const DataLabelSettings(isVisible: true),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ...data.map(
            (d) =>
                _buildRevenueItem('${d.category}: ${d.percentage}%', d.color),
          ),
        ],
      ),
    );
  }

  Widget _buildRevenueItem(String label, Color color) {
    var adaptive = Adaptive(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(
            width: 14,
            height: 14,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(width: 8),
          Text(label, style: TextStyle(fontSize: adaptive.fontSize(12))),
        ],
      ),
    );
  }

  // -----------------------
  // 🧱 CARD WRAPPER
  // -----------------------
  Widget _buildCard({
    required String title,
    Widget? trailing,
    required Widget child,
  }) {
    var adaptive = Adaptive(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: AppColors.textColor.withOpacity(0.1), blurRadius: 5),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: adaptive.fontSize(20),
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (trailing != null) trailing,
            ],
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }

  BarChartGroupData _bar(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: Colors.red,
          width: 24,
          borderRadius: BorderRadius.circular(8),
        ),
      ],
    );
  }
}

// 🔹 Segment Control Widget
class _SegmentControl extends StatelessWidget {
  const _SegmentControl();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _chip('All', true, context),
        const SizedBox(width: 6),
        _chip('Mobile', false, context),
        const SizedBox(width: 6),
        _chip('Desktop', false, context),
      ],
    );
  }

  Widget _chip(String label, bool selected, BuildContext context) {
    var adaptive = Adaptive(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: selected ? AppColors.primaryColor : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: selected ? AppColors.cardColor : AppColors.textColor,
          fontSize: adaptive.fontSize(20),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

// 📊 DATA MODELS
class RevenueData {
  final String category;
  final double percentage;
  final Color color;
  RevenueData(this.category, this.percentage, this.color);
}
