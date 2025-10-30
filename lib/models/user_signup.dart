// user_signup.dart

class UserSignup {
  final String user;
  final String email;
  final String joinedDate;
  final String status;
  final bool isActive;

  UserSignup({
    required this.user,
    required this.email,
    required this.joinedDate,
    required this.status,
  }) : isActive = status == 'Active'; // Simple logic for status

  // Sample data matching the image
  static List<UserSignup> getSignups() {
    return [
      UserSignup(
        user: 'Mike Johnson',
        email: 'mikej@gmail.com',
        joinedDate: '05 Sep 2025',
        status: 'Active',
      ),
      UserSignup(
        user: 'Sarah Lee',
        email: 'sarahlee@yahoo.com',
        joinedDate: '05 Sep 2025',
        status: 'In-active',
      ),
      UserSignup(
        user: 'Ahmed Khan',
        email: 'ahmedkhan@gmail.com',
        joinedDate: '01 Sep 2025',
        status: 'Active',
      ),
      UserSignup(
        user: 'Laura Smith',
        email: 'laura.smith@hotmail.com',
        joinedDate: '28 Aug 2025',
        status: 'Active',
      ),
      UserSignup(
        user: 'Sarah Lee',
        email: 'sarahlee@yahoo.com',
        joinedDate: '05 Sep 2025',
        status: 'In-active',
      ),
    ];
  }
}
