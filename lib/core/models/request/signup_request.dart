class RegisterUser {
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String nickName;

  RegisterUser({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.nickName,
  });

  factory RegisterUser.fromJson(Map<String, dynamic> json) => RegisterUser(
        email: json["email"],
        password: json["password"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        nickName: json["nickName"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "firstName": firstName,
        "lastName": lastName,
        "nickName": nickName,
      };
}

// {
//   "email": "4kuper@gmail.com",
//   "password": "Qwerty1234!",
//   "firstName": "Oleksandr",
//   "lastName": "Kuprienko",
//   "nickName": "4kuper"
// }