class SupportTicketModel {
  String ticketId;
  String user;
  String subject;
  String category;
  String priority;
  String status;
  String createdOn;

  SupportTicketModel({
    required this.ticketId,
    required this.user,
    required this.subject,
    required this.category,
    required this.priority,
    required this.status,
    required this.createdOn,
  });
}
