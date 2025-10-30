// import 'package:flutter/material.dart';

// class SupportWebView extends StatelessWidget {
//   SupportWebView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.all(24.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Header Section
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 // Export CSV Button
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xffED1C24),
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 24,
//                       vertical: 12,
//                     ),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                   child: const Text(
//                     'Export CSV',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//                 // Search and Sort
//                 Row(
//                   children: [
//                     // Search Bar
//                     Container(
//                       width: 300,
//                       padding: const EdgeInsets.symmetric(horizontal: 16),
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Colors.grey.shade300),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: TextField(
//                         decoration: InputDecoration(
//                           hintText: 'Search by Event Name / ID',
//                           border: InputBorder.none,
//                           icon: Icon(Icons.search, color: Colors.grey.shade600),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 16),
//                     // Sort Dropdown
//                     Container(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 16,
//                         vertical: 12,
//                       ),
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Colors.grey.shade300),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: Row(
//                         children: [
//                           const Text(
//                             'Sort by: Latest',
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: Color(0xff060606),
//                             ),
//                           ),
//                           const SizedBox(width: 8),
//                           Icon(
//                             Icons.keyboard_arrow_down,
//                             color: Colors.grey.shade600,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             const SizedBox(height: 24),
//             // KPI Cards

//             // Table
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Table(
//                   columnWidths: const {
//                     0: FlexColumnWidth(1.5),
//                     1: FlexColumnWidth(2),
//                     2: FlexColumnWidth(2),
//                     3: FlexColumnWidth(1.5),
//                     4: FlexColumnWidth(1.5),
//                     5: FlexColumnWidth(1.5),
//                     6: FlexColumnWidth(1.5),
//                     7: FlexColumnWidth(1.5),
//                   },
//                   children: [
//                     // Table Header
//                     TableRow(
//                       decoration: BoxDecoration(
//                         color: Colors.grey.shade50,
//                         border: Border(
//                           bottom: BorderSide(color: Colors.grey.shade200),
//                         ),
//                       ),
//                       children: const [
//                         _TableHeader('Ticket ID'),
//                         _TableHeader('User'),
//                         _TableHeader('Subject'),
//                         _TableHeader('Category'),
//                         _TableHeader('Priority'),
//                         _TableHeader('Status'),
//                         _TableHeader('Created On'),
//                         _TableHeader('Action'),
//                       ],
//                     ),
//                     // Table Rows
//                     ..._buildTableRows(),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   List<TableRow> _buildTableRows() {
//     final subscriptions = [
//       _SubscriptionData(
//         'TK-1001',
//         'Mike Johnson',
//         'Payment not reflecting in account',
//         'Payment Issue',
//         'Active',
//         ' Open',
//         '01 Oct 2025',
//       ),
//       _SubscriptionData(
//         'TK-1001',
//         'Mike Johnson',
//         'Payment not reflecting in account',
//         'Payment Issue',
//         'In-active',
//         'Resolved',
//         '01 Oct 2025',
//       ),
//       _SubscriptionData(
//         'TK-1001',
//         'Mike Johnson',
//         'Payment not reflecting in account',
//         'Payment Issue',
//         'Medium',
//         ' Open',
//         '01 Oct 2025',
//       ),
//       _SubscriptionData(
//         'TK-1001',
//         'Mike Johnson',
//         'Payment not reflecting in account',
//         'Payment Issue',
//         'Active',
//         ' Open',
//         '01 Oct 2025',
//       ),
//       _SubscriptionData(
//         'TK-1001',
//         'Mike Johnson',
//         'Payment not reflecting in account',
//         'Payment Issue',
//         'Active',
//         ' Open',
//         '01 Oct 2025',
//       ),
//     ];

//     return subscriptions
//         .map(
//           (sub) => TableRow(
//             decoration: BoxDecoration(
//               color: subscriptions.indexOf(sub) % 2 == 0
//                   ? Colors.white
//                   : Colors.grey.shade50,
//               border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
//             ),
//             children: [
//               _TableCell(Text(sub.transactionId)),
//               _TableCell(Text(sub.user)),
//               _TableCell(Text(sub.plan)),
//               _TableCell(Text(sub.paymentMethod)),
//               _TableCell(_StatusBadge(sub.status)),
//               _TableCell(Text(sub.startDate)),
//               _TableCell(Text(sub.expiryDate)),
//               _TableCell(_ActionButtons()),
//             ],
//           ),
//         )
//         .toList();
//   }
// }

// class _KPICard extends StatelessWidget {
//   final String title;
//   final String value;
//   final String subtitle;
//   final bool isHighlighted;

//   _KPICard({
//     required this.title,
//     required this.value,
//     required this.subtitle,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: isHighlighted ? const Color(0xffED1C24) : Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: Colors.grey.shade200),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: TextStyle(
//               fontSize: 14,
//               color: isHighlighted ? Colors.white70 : Colors.grey.shade600,
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             value,
//             style: TextStyle(
//               fontSize: 28,
//               fontWeight: FontWeight.bold,
//               color: isHighlighted ? Colors.white : const Color(0xff060606),
//             ),
//           ),
//           const SizedBox(height: 4),
//           Text(
//             subtitle,
//             style: TextStyle(
//               fontSize: 12,
//               color: isHighlighted ? Colors.white70 : Colors.grey.shade600,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _TableHeader extends StatelessWidget {
//   final String text;

//   const _TableHeader(this.text);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Text(
//         text,
//         style: const TextStyle(
//           fontWeight: FontWeight.w600,
//           fontSize: 14,
//           color: Color(0xff060606),
//         ),
//       ),
//     );
//   }
// }

// class _TableCell extends StatelessWidget {
//   final Widget child;

//   const _TableCell(this.child);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(padding: const EdgeInsets.all(16.0), child: child);
//   }
// }

// class _StatusBadge extends StatelessWidget {
//   final String status;

//   const _StatusBadge(this.status);

//   @override
//   Widget build(BuildContext context) {
//     final isActive = status == 'Active';
//     return Text(
//       status,
//       style: TextStyle(
//         color: isActive ? Colors.green : Colors.red,
//         fontWeight: FontWeight.w500,
//       ),
//     );
//   }
// }

// class _ActionButtons extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         IconButton(
//           icon: Icon(Icons.edit_outlined, color: Colors.grey.shade600),
//           onPressed: () {},
//           padding: EdgeInsets.zero,
//           constraints: const BoxConstraints(),
//           iconSize: 20,
//         ),
//         const SizedBox(width: 8),
//         ElevatedButton(
//           onPressed: () {},
//           style: ElevatedButton.styleFrom(
//             backgroundColor: const Color(0xffED1C24),
//             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//             minimumSize: Size.zero,
//             tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//           ),
//           child: const Text(
//             'Deactivate',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 12,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class _SubscriptionData {
//   final String transactionId;
//   final String user;
//   final String plan;
//   final String paymentMethod;
//   final String status;
//   final String startDate;
//   final String expiryDate;

//   _SubscriptionData(
//     this.transactionId,
//     this.user,
//     this.plan,
//     this.paymentMethod,
//     this.status,
//     this.startDate,
//     this.expiryDate,
//   );
// }
