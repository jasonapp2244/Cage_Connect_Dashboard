import 'package:cageconnectdashboard/screens/view/dashboard/event_view.dart/event_mobile_view.dart';
import 'package:cageconnectdashboard/screens/view/dashboard/event_view.dart/event_tablet_view.dart';
import 'package:cageconnectdashboard/screens/view/dashboard/event_view.dart/event_view_web.dart';
import 'package:cageconnectdashboard/utils/dimension.dart';
import 'package:flutter/material.dart';

class ResponsiveEventsScreen extends StatelessWidget {
  const ResponsiveEventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // Mobile view: width < 600px
        if (constraints.maxWidth < Dimension.mobile) {
          return const EventMobileView();
        }
        // Tablet view: width between 600px and 1024px
        else if (constraints.maxWidth < Dimension.tablet) {
          return const EventTabletView();
        }
        // Web view: width >= 1024px
        else {
          return const EventWebView();
        }
      },
    );
  }
}
