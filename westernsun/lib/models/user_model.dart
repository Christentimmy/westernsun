


class UserModel {
  final String email;
  final String username;
  final String password;
  final int phoneNumber;
  final String uid;

  UserModel({
    required this.email,
    required this.username,
    required this.password,
    required this.phoneNumber,
    required this.uid,
  });

  Map<String, dynamic> toMap() {
    return {
      "username": username,
      "email": email,
      "password": password,
      "phoneNumber": phoneNumber,
      "image": "",
      "otpverified": false,
      "uid": uid,
    };
  }
}