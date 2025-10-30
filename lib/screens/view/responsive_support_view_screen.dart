// import 'package:cageconnectdashboard/screens/view/dashboard/support/support_mobile_view.dart';
// import 'package:cageconnectdashboard/screens/view/dashboard/support/support_tablet_view.dart';
// import 'package:cageconnectdashboard/screens/view/dashboard/support/support_web_view.dart';
// import 'package:cageconnectdashboard/utils/dimension.dart';
// import 'package:flutter/material.dart';

// class ResponsiveSupportViewScreen extends StatelessWidget {
//   ResponsiveSupportViewScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (BuildContext context, BoxConstraints constraints) {
//         // Mobile view: width < 600px
//         if (constraints.maxWidth < Dimension.mobile) {
//           return const SupportMobileView();
//         }
//         // Tablet view: width between 600px and 1024px
//         else if (constraints.maxWidth < Dimension.tablet) {
//           return const SupportTabletView();
//         }
//         // Web view: width >= 1024px
//         else {
//           //   return SupportWebView();
//         }
//       },
//     );
//   }
// }
