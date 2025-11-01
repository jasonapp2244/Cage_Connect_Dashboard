import 'package:cageconnectdashboard/controller/dashboard_provider.dart';
import 'package:cageconnectdashboard/screens/responsive_dashboard_screen.dart';
import 'package:cageconnectdashboard/screens/responsive_settings_screen.dart';
import 'package:cageconnectdashboard/screens/view/dashboard/support/support_web_view.dart';
import 'package:cageconnectdashboard/screens/view/subscriptionandpayment/responsive_subscriptions_screen.dart';
import 'package:cageconnectdashboard/screens/responsive_users_screen.dart';
import 'package:cageconnectdashboard/screens/view/dashboard/event_view.dart/responsive_event_view.dart';

import 'package:cageconnectdashboard/utils/colors.dart';
import 'package:cageconnectdashboard/widgets/custom_searchbar.dart';
import 'package:cageconnectdashboard/widgets/custom_profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResponsiveHomeScreen extends StatelessWidget {
  static const double mobile = 600;
  static const double tablet = 1100;

  const ResponsiveHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DashboardProvider>(context);
    final List<String> pageTitles = [
      'Dashboard',
      'User Management',
      'Events Monitoring',
      'Subscriptions',
      'Support Tickets',
      'Settings',
    ];

    final List<Widget> pages = [
      DashboardResponsiveScreen(),
      ResponsiveUsersScreen(),
      ResponsiveEventsScreen(),
      ResponsiveSubscriptionsScreen(),
      SupportWebView(),
      const ResponsiveSettingsScreen(),
    ];

    final width = MediaQuery.of(context).size.width;
    final bool isMobile = width <= mobile;
    final bool isTablet = width > mobile && width <= tablet;
    final bool isDesktop = width > tablet;

    return Scaffold(
      backgroundColor: const Color(0xffF5F6FA),

      // ✅ Drawer for mobile
      drawer: (isMobile || isTablet)
          ? Drawer(child: _SideMenu(provider: provider, isMobile: true))
          : null,

      // ✅ AppBar (only for mobile)
      appBar: (isMobile || isTablet)
          ? AppBar(
              backgroundColor: AppColors.cardColor,
              elevation: 0,
              leading: Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu, color: Colors.red),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              ),
              title: Text(
                pageTitles[provider.selectedIndex],
                style: TextStyle(
                  fontSize: isMobile ? 20 : 32,
                  fontWeight: FontWeight.w900,
                  color: AppColors.textColor,
                ),
              ),
              centerTitle: true,
              actions: [
                if (isMobile)
                  const Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: CustomProfileWidget(
                      userName: 'Jamiee Dunn',
                      userEmail: 'Jamie Dun',
                      avatarImagePath: 'assets/images/jamie.png',
                    ),
                  ),
                if (isTablet) ...[
                  CustomSearchBar(
                    hintText: 'Search by name, email, or role…',
                    width: 300,
                  ),
                  const SizedBox(width: 20),
                  const CustomProfileWidget(
                    userName: 'Jamiee Dunn',
                    userEmail: 'Jamie Dun',
                    avatarImagePath: 'assets/images/jamie.png',
                  ),
                ],
              ],
            )
          : null,

      // ✅ Layout for tablet & desktop
      body: Row(
        children: [
          if (isDesktop)
            SizedBox(
              width: 251,
              height: double.infinity,
              child: _SideMenu(provider: provider, isMobile: false),
            ),

          Expanded(
            child: Column(
              children: [
                // ✅ Header for tablet & desktop
                if (isDesktop || isTablet)
                  _buildHeaderForTabletDesktop(
                    pageTitles[provider.selectedIndex],
                  ),

                // Content pages
                Expanded(
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 300),
                    child: pages[provider.selectedIndex],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ✅ Header for tablet & desktop
  Widget _buildHeaderForTabletDesktop(String title) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(30),
      ),
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomSearchBar(hintText: 'Search by name, email, or role…'),
          Text(
            title,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w900,
              color: AppColors.textColor,
            ),
          ),
          const CustomProfileWidget(
            userName: 'Jamiee Dunn',
            userEmail: 'Jamie Dun',
            avatarImagePath: 'assets/images/jamie.png',
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
              _menuItem(context, Icons.payment, "Subscriptions", 3),
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
              _menuItem(context, Icons.logout, "Logout", -1),
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
      onTap: () {
        if (index >= 0) {
          provider.setPage(index);
        } else {
          // Handle logout
          // You can add logout logic here
        }
      },
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
