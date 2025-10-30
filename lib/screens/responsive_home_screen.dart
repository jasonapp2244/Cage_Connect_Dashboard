import 'package:cageconnectdashboard/controller/dashboard_provider.dart';
import 'package:cageconnectdashboard/screens/responsive_dashboard_screen.dart';
import 'package:cageconnectdashboard/screens/responsive_subscriptions_screen.dart';
import 'package:cageconnectdashboard/screens/responsive_users_screen.dart';
import 'package:cageconnectdashboard/screens/view/dashboard/main/dashboard_screen.dart';

import 'package:cageconnectdashboard/utils/colors.dart';
import 'package:cageconnectdashboard/widgets/custom_searchbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResponsiveHomeScreen extends StatelessWidget {
  static const double mobile = 600;
  static const double tablet = 1100;

  const ResponsiveHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DashboardProvider>(context);
    final List<Widget> pages = [
      DashboardResponsiveScreen(),
      ResponsiveUsersScreen(),
      ResponsiveSubscriptionsScreen(),
      const Center(child: Text('Payments')),
      const Center(child: Text('Support Tickets')),
      const Center(child: Text('Settings')),
    ];

    final width = MediaQuery.of(context).size.width;
    final bool isMobile = width <= mobile;
    final bool isTablet = width > mobile && width <= tablet;

    return Scaffold(
      backgroundColor: const Color(0xffF5F6FA),

      // ✅ Drawer for mobile
      drawer: isMobile
          ? Drawer(child: _SideMenu(provider: provider, isMobile: true))
          : null,

      // ✅ AppBar (only for mobile)
      appBar: isMobile
          ? AppBar(
              actionsPadding: EdgeInsets.only(right: 16),
              backgroundColor: Colors.white,
              elevation: 1,
              leading: Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu, color: Colors.red),
                  onPressed: () {
                    Scaffold.of(context).openDrawer(); // open drawer correctly
                  },
                ),
              ),
              title: const Text(
                "",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
              actions: [
                CustomSearchBar(
                  hintText: 'Search by name, email, or role…',
                  width: 300,
                ),
              ],
            )
          : null,

      // ✅ Layout for tablet & desktop
      body: Row(
        children: [
          if (!isMobile)
            Container(
              width: 251,
              height: double.infinity,
              child: _SideMenu(provider: provider, isMobile: false),
            ),

          Expanded(
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: pages[provider.selectedIndex],
            ),
          ),
        ],
      ),
    );
  }
}

class _SideMenu extends StatelessWidget {
  final DashboardProvider provider;
  final bool isMobile;

  const _SideMenu({required this.provider, this.isMobile = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(
        vertical: 30,
        horizontal: isMobile ? 16 : 16,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 5),
        decoration: BoxDecoration(
          color: AppColors.bgColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/icons/cage.png', height: 40),
              const SizedBox(height: 40),
              const Text(
                "MENU",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 16),

              _menuItem(context, Icons.dashboard, "Dashboard", 0),
              _menuItem(context, Icons.people, "User Management", 1),
              _menuItem(context, Icons.event, "Events Monitoring", 2),
              _menuItem(context, Icons.payment, "Payments", 3),
              _menuItem(context, Icons.support_agent, "Support Tickets", 4),

              const SizedBox(height: 60),
              const Text(
                "GENERAL",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 16),

              _menuItem(context, Icons.settings, "Settings", 5),
              _menuItem(context, Icons.logout, "Logout", 6),
            ],
          ),
        ),
      ),
    );
  }

  Widget _menuItem(
    BuildContext context,
    IconData icon,
    String title,
    int index,
  ) {
    bool active = provider.selectedIndex == index;

    return InkWell(
      onTap: () => provider.setPage(index),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        decoration: BoxDecoration(
          color: active ? const Color(0xffED1C24).withOpacity(0.1) : null,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: active ? const Color(0xffED1C24) : Colors.black54,
              size: 22,
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                color: active ? const Color(0xffED1C24) : Colors.black87,
                fontWeight: active ? FontWeight.bold : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
