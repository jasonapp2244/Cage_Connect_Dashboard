import 'package:cageconnectdashboard/screens/responsive/responsive.dart';
import 'package:cageconnectdashboard/utils/colors.dart';
import 'package:cageconnectdashboard/widgets/custom_info_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';


class _CustomSearchBar extends StatelessWidget {
  const _CustomSearchBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400, // Adjusted width for typical desktop/tablet view
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: const Row(
        children: [
          Icon(Icons.search, color: Colors.grey),
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search by name, email, or role...',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 14.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 2. User Profile Widget
class _UserProfile extends StatelessWidget {
  const _UserProfile();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Notification Bell Icon
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5,
              ),
            ],
          ),
          child: IconButton(
            icon: const Icon(
              Icons.notifications_none,
              color: Colors.black,
              size: 24,
            ),
            onPressed: () {},
          ),
        ),
        const SizedBox(width: 16),

        // User Avatar and Info
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.transparent, // Background of the profile area
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              // Avatar (Placeholder for network/asset image)
              const CircleAvatar(
                radius: 20,
                // Replace with actual image:
                // backgroundImage: NetworkImage('path/to/jamie_dunn_avatar.jpg'),
                backgroundColor: Color.fromARGB(255, 161, 155, 149),
              ),
              const SizedBox(width: 12),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Jamiee Dunn',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'jamieedunn@gmail.com',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.black,
                size: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Widget _buildRecentUserSignups(BuildContext context) {
  var mockSignupData;
  // Column header labels
  final List<String> headers = ['User', 'Email', 'Joined Date', 'Status'];

  // Column width distribution as fractions of the card's width (65% of screen)
  // User: 25%, Email: 35%, Date: 20%, Status: 20%
  final List<double> columnFractions = [0.25, 0.35, 0.20, 0.20];

  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black12.withOpacity(0.05),
          blurRadius: 10,
          offset: const Offset(0, 5),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Card Title
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            "Recent User Signups",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        // Separator below title
        const Divider(height: 1, thickness: 1, color: Color(0xFFF2F2F2)),

        // Table Headers Row
        Container(
          height: 48, // Fixed height for header row
          decoration: BoxDecoration(
            color: Colors.grey.shade50, // Light background for header
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: List.generate(headers.length, (index) {
              return Expanded(
                flex: (columnFractions[index] * 100).toInt(),
                child: Text(
                  headers[index],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.grey.shade700,
                  ),
                ),
              );
            }),
          ),
        ),
        // Separator below header
        const Divider(height: 1, thickness: 1, color: Color(0xFFF2F2F2)),

        // Data Rows (ListView)
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: mockSignupData.length,
          itemBuilder: (context, index) {
            final data = mockSignupData[index];
            final bool isActive = data.status == 'Active';

            return Column(
              children: [
                Container(
                  height: 48, // Fixed height for data row
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  alignment: Alignment.centerLeft, // Align content vertically
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // User (Name)
                      Expanded(
                        flex: (columnFractions[0] * 100).toInt(),
                        child: Text(
                          data.name,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                      // Email
                      Expanded(
                        flex: (columnFractions[1] * 100).toInt(),
                        child: Text(data.email),
                      ),
                      // Joined Date
                      Expanded(
                        flex: (columnFractions[2] * 100).toInt(),
                        child: Text(data.date),
                      ),
                      // Status (Custom Text/Color)
                      Expanded(
                        flex: (columnFractions[3] * 100).toInt(),
                        child: Text(
                          data.status,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: isActive
                                ? Colors.green.shade600
                                : Colors.red.shade600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Separator between rows
                if (index < mockSignupData.length - 1)
                  const Divider(
                    height: 1,
                    thickness: 1,
                    color: Color(0xFFF2F2F2),
                  ),
              ],
            );
          },
        ),
      ],
    ),
  );
}

// 1. Data Model for the grid
class SignupData {
  final int id;
  final String name;
  final String email;
  final String date;

  SignupData(this.id, this.name, this.email, this.date);
}

// 2. Data Source for the grid
class SignupDataSource extends DataGridSource {
  List<SignupData> _signupData = [];
  List<DataGridRow> _dataGridRows = [];

  SignupDataSource({required List<SignupData> signupData}) {
    _signupData = signupData;
    _dataGridRows = signupData
        .map<DataGridRow>(
          (e) => DataGridRow(
            cells: [
              DataGridCell<int>(columnName: 'id', value: e.id),
              DataGridCell<String>(columnName: 'name', value: e.name),
              DataGridCell<String>(columnName: 'email', value: e.email),
              DataGridCell<String>(columnName: 'date', value: e.date),
            ],
          ),
        )
        .toList();
  }

  @override
  List<DataGridRow> get rows => _dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((e) {
        return Container(
          alignment: (e.columnName == 'id')
              ? Alignment.centerRight
              : Alignment.centerLeft,
          padding: const EdgeInsets.all(8.0),
          child: Text(e.value.toString()),
        );
      }).toList(),
    );
  }
}

// --- Custom Widget Implementations (Needed for InfoCard) ---

// 3. Custom Card Widget (InfoCard)

// 4. Data for Revenue Breakdown
class RevenueData {
  final String category;
  final double percentage;
  final Color color;

  RevenueData(this.category, this.percentage, this.color);
}

// --- Dashboard Screen Implementation ---

class DashboardScreen extends StatefulWidget {
  // 🔹 FIX 1: Add a field for data and make it optional, as Widget.data isn't valid.
  final List<SignupData>? signupData;

  const DashboardScreen({super.key, this.signupData});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late SignupDataSource _signupDataSource;

  // 🔹 Helper function for DataGrid Columns
  List<GridColumn> _getColumns() {
    return [
      GridColumn(
        columnName: 'user',
        label: Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerRight,
          child: const Text(
            'User',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      GridColumn(
        columnName: 'Email',
        label: Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Email',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      GridColumn(
        columnName: 'Joined Date',
        label: Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Joined Date',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      GridColumn(
        columnName: 'Status',
        label: Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Status',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ];
  }

  // Mock data for the table
  List<SignupData> mockSignupData = [
    SignupData(1, 'Alice', 'alice@example.com', '2025-10-25'),
    SignupData(2, 'Bob', 'bob@example.com', '2025-10-24'),
    SignupData(3, 'Charlie', 'charlie@example.com', '2025-10-23'),
  ];

  @override
  void initState() {
    super.initState();
    // 🔹 FIX 2: Correctly access the widget's field using 'widget.fieldName'
    // Use the provided data or mock data if null
    final data = widget.signupData ?? mockSignupData;
    _signupDataSource = SignupDataSource(signupData: data);
  }

  @override
  Widget build(BuildContext context) {
    // Determine the width for the SfDataGrid to be reasonable for the data
    var adaptive = Adaptive(context);
    return Scaffold(
      backgroundColor: AppColors.bgColor,

      body: SingleChildScrollView(
        // ✅ allows content to scroll and avoid infinite constraints
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.cardColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // 1. Main Title
                  const Text(
                    'User Management',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),

                  const Spacer(), // Pushes content to the right
                  // 2. Search Bar
                  const _CustomSearchBar(),
                  const SizedBox(width: 20),

                  // 3. Notification and User Profile
                  const _UserProfile(),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.cardColor,
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  // 🔹 Top Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Dashboard',
                        style: TextStyle(
                          color: AppColors.textColor,

                          fontFamily: 'Clash Display',
                          fontWeight: FontWeight.w600,

                          fontSize: adaptive.fontSize(40),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // 🔹 Info Cards Row
                  // 🔹 FIX 3: Removed the outer red Container to show InfoCards correctly with their own internal styling
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CustomInfoCard(
                          title: "Total Users",
                          value: "8,420",
                          subtitle: "+12% this month",
                          color: Colors.red,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: CustomInfoCard(
                          title: "Active Events",
                          value: "124",
                          subtitle: "Events live now",
                          color: Colors.red,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: CustomInfoCard(
                          title: "Premium Subscriptions",
                          value: "\$2,190",
                          subtitle: "Active Premium",
                          color: Colors.red,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: CustomInfoCard(
                          title: "Total Revenue",
                          value: "\$12,540",
                          subtitle: "Earned 6 months",
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // 🔹 Charts Row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Engagement Overview
                      Expanded(
                        child: _buildCard(
                          context: context,
                          title: "Engagement Overview",
                          child: SizedBox(
                            // ✅ bounded height for chart
                            height: 250,
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
                                        '${value.toInt()}', // Display integer values
                                        style: const TextStyle(fontSize: 10),
                                      ),
                                    ),
                                  ),
                                  bottomTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      getTitlesWidget: (value, meta) {
                                        final labels = [
                                          'Events',
                                          'Fighters',
                                          'Chats',
                                          'Reviews',
                                        ];
                                        if (value.toInt() >= labels.length ||
                                            value.toInt() < 0) {
                                          return Container();
                                        }
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                            top: 8.0,
                                          ),
                                          child: Text(
                                            labels[value.toInt()],
                                            style: const TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  topTitles: AxisTitles(
                                    sideTitles: SideTitles(showTitles: false),
                                  ),
                                  rightTitles: AxisTitles(
                                    sideTitles: SideTitles(showTitles: false),
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
                      ),

                      const SizedBox(width: 16),

                      // Total Active Users
                      Expanded(
                        flex: 2,
                        child: _buildCard(
                          context: context,
                          title: "Total Active Users",
                          trailing: _SegmentControl(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8),
                              const Text(
                                "12,653.6",
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700,
                                  // fontFamily: 'Clash Display', // Assuming this is a custom font, removed for default compilation
                                ),
                              ),
                              const SizedBox(height: 8),
                              SizedBox(
                                // ✅ bounded height for chart
                                height: 180,
                                child: BarChart(
                                  BarChartData(
                                    alignment: BarChartAlignment.spaceAround,
                                    maxY: 200,
                                    gridData: FlGridData(
                                      show: true,
                                      drawHorizontalLine: true,
                                      getDrawingHorizontalLine: (value) =>
                                          FlLine(
                                            color: Colors.grey.shade300,
                                            strokeWidth: 1,
                                          ),
                                      drawVerticalLine: false,
                                    ),
                                    borderData: FlBorderData(show: false),
                                    titlesData: FlTitlesData(
                                      leftTitles: AxisTitles(
                                        sideTitles: SideTitles(
                                          showTitles: true,
                                          reservedSize: 30, // Adjusted size
                                          interval:
                                              50, // Set an interval for labels
                                          getTitlesWidget: (value, meta) {
                                            if (value == 0) return Container();
                                            return Text(
                                              '\$${(value ~/ 50)}k',
                                              style: const TextStyle(
                                                fontSize: 10,
                                              ),
                                            );
                                          },
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
                                            if (value.toInt() >=
                                                    months.length ||
                                                value.toInt() < 0) {
                                              return Container();
                                            }
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                top: 4.0,
                                              ),
                                              child: Text(
                                                months[value.toInt()],
                                                style: const TextStyle(
                                                  fontSize: 10,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      topTitles: AxisTitles(
                                        sideTitles: SideTitles(
                                          showTitles: false,
                                        ),
                                      ),
                                      rightTitles: AxisTitles(
                                        sideTitles: SideTitles(
                                          showTitles: false,
                                        ),
                                      ),
                                    ),
                                    barGroups: [
                                      for (int i = 0; i < 12; i++)
                                        BarChartGroupData(
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
                                              color: Colors.red,
                                              width: 12,
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                          ],
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // 🔹 Data Grid and Revenue Breakdown Row
                  // 🔹 FIX 4: The Row containing the SfDataGrid was missing an Expanded widget,
                  // causing it to try and take infinite width. It's fixed by wrapping the grid in a fixed-width container.
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // The SfDataGrid itself
                      Expanded(
                        flex: 4,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Text(
                                  "Recent Signups",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    height:
                                        (_signupDataSource.rows.length + 1) *
                                        48.0,
                                    child: SfDataGrid(
                                      source: _signupDataSource,
                                      columns: _getColumns(),
                                      // Customize table appearance
                                      headerGridLinesVisibility:
                                          GridLinesVisibility.horizontal,
                                      gridLinesVisibility:
                                          GridLinesVisibility.horizontal,
                                      headerRowHeight: 48,
                                      rowHeight: 48,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(width: 16),

                      // Revenue Breakdown
                      Expanded(child: _buildRevenueBreakdown()),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRevenueBreakdown() {
    var adaptive = Adaptive(context);
    final Color subscriptionsColor = Colors.green; // 70%
    final Color promotionsColor = Colors.orange; // 20%
    final Color otherColor = Colors.blueGrey; // 10–15%

    final List<RevenueData> data = [
      RevenueData('Subscriptions', 70, subscriptionsColor),
      RevenueData('Promotions', 20, promotionsColor),
      RevenueData('Other', 10, otherColor),
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Revenue Breakdown",
            style: TextStyle(
              color: const Color(0xFF060606),
              fontSize: adaptive.fontSize(20),
              fontFamily: 'Clash Display',
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),

          // 🔹 Pie Chart
          Center(
            child: SizedBox(
              height: 200,
              width: 200,
              child: SfCircularChart(
                legend: const Legend(isVisible: false),
                series: <CircularSeries>[
                  PieSeries<RevenueData, String>(
                    dataSource: data,
                    xValueMapper: (RevenueData data, _) => data.category,
                    yValueMapper: (RevenueData data, _) => data.percentage,
                    pointColorMapper: (RevenueData data, _) => data.color,
                    enableTooltip: true,

                    // ✅ Make it a PIE chart (no inner hole)
                    dataLabelSettings: const DataLabelSettings(
                      isVisible: true,
                      labelPosition: ChartDataLabelPosition.outside,
                      connectorLineSettings: ConnectorLineSettings(
                        type: ConnectorType.curve,
                        length: '15%',
                      ),
                      textStyle: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          // 🔹 Legend Labels
          _buildRevenueItem('Subscriptions: 70% (\$9,781)', subscriptionsColor),
          const SizedBox(height: 8),
          _buildRevenueItem('Promotions: 20% (\$1,881)', promotionsColor),
          const SizedBox(height: 8),
          _buildRevenueItem('Other: 10% (\$878)', otherColor),
        ],
      ),
    );
  }

  Widget _buildRevenueItem(String label, Color color) {
    return Row(
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
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

// Global helper widget is fine as is, but placed outside the State class
Widget _buildCard({
  required String title,
  Widget? trailing,
  required Widget child,
  required BuildContext context,
}) {
  var adaptive = Adaptive(context);
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black12.withOpacity(0.1),
          blurRadius: 5,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    padding: const EdgeInsets.all(16),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: const Color(0xFF060606),
                fontSize: 20,
                fontFamily: 'Clash Display',
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

// Global helper function is fine as is
BarChartGroupData _bar(int x, double y) => BarChartGroupData(
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

// 🔹 Segment Buttons (All, Mobile, Desktop)
// This widget is fine as a StatelessWidget
class _SegmentControl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _chip('All', true),
        const SizedBox(width: 6),
        _chip('Mobile', false),
        const SizedBox(width: 6),
        _chip('Desktop', false),
      ],
    );
  }

  Widget _chip(String label, bool selected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: selected ? Colors.red : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: selected ? Colors.white : Colors.black,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

// The provided ChartData class is not used and can be removed, but kept here for completeness.
class ChartData {
  final String x;
  final double y;

  ChartData(this.x, this.y);
}
