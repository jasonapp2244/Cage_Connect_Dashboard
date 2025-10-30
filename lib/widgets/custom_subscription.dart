import 'package:flutter/material.dart';

class CustomSubscriptionBadge extends StatelessWidget {
  final String subscription;

  const CustomSubscriptionBadge(this.subscription, {super.key});

  @override
  Widget build(BuildContext context) {
    final isPremium = subscription == 'Premium';
    return Text(
      subscription,
      style: TextStyle(
        color: isPremium ? Colors.orange : const Color(0xff060606),
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
