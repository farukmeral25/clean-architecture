class UserInfo {
  final String email;
  final String password;
  UserInfo({
    required this.email,
    required this.password,
  });

  set email(String gelenMail) {
    email = gelenMail;
  }

  set password(String gelenPassword) {
    password = gelenPassword;
  }
}
