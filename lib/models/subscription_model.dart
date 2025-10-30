class SubscriptionData {
  final String transactionId;
  final String user;
  final String plan;
  final String paymentMethod;
  final String status;
  final String startDate;
  final String expiryDate;

  SubscriptionData(
    this.transactionId,
    this.user,
    this.plan,
    this.paymentMethod,
    this.status,
    this.startDate,
    this.expiryDate,
  );
}
