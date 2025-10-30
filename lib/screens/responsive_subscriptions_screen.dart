import 'package:cageconnectdashboard/screens/view/subscriptionandpayment/subscriptions_mobile_view.dart';
import 'package:cageconnectdashboard/screens/view/subscriptionandpayment/subscriptions_tablet_view.dart';
import 'package:cageconnectdashboard/screens/view/subscriptionandpayment/subscriptions_web_view.dart';
import 'package:cageconnectdashboard/utils/dimension.dart';
import 'package:flutter/material.dart';

class ResponsiveSubscriptionsScreen extends StatelessWidget {
  const ResponsiveSubscriptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // Mobile view: width < 600px
        if (constraints.maxWidth < Dimension.mobile) {
          return const SubscriptionsMobileView();
        }
        // Tablet view: width between 600px and 1024px
        else if (constraints.maxWidth < Dimension.tablet) {
          return const SubscriptionsTabletView();
        }
        // Web view: width >= 1024px
        else {
          return const SubscriptionsWebView();
        }
      },
    );
  }
}
