class UserModel {
  String userName, email, token, role, id;
  String? phoneNumber;
  UserModel(
      {required this.userName,
      required this.email,
      required this.token,
      required this.role,
      required this.id,
      required this.phoneNumber});

  UserModel.fromJson(Map<String, dynamic> json)
      : this(
          userName: json['userName'],
          email: json['email'],
          token: json['token'],
          role: json['role'],
          id: json['id'],
          phoneNumber: json['phoneNumber'],
        );

  Map<String, dynamic> toJson() => {
        'userName': userName,
        'email': email,
        'token': token,
        'role': role,
        'id': id,
        'phoneNumber': phoneNumber,
      };
}
