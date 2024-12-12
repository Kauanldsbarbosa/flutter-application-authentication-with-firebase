class UserBase {
  final String uuid;
  final String fullName;
  final String email;

  const UserBase(
      {required this.uuid, required this.fullName, required this.email});
}

class UserRegister extends UserBase {
  final String password;

  const UserRegister({
    required String fullName,
    required String email,
    required this.password,
  }) : super(uuid: '', fullName: fullName, email: email);
}
