class UserModel {
  String? userName, email, token, role, id;
  String? phoneNumber, imgURL;
  bool emailConfirmed, suspended;
  int counter;
  UserModel(
      {required this.userName,
      required this.email,
      required this.counter,
      required this.emailConfirmed,
      required this.suspended,
      required this.imgURL,
      required this.token,
      required this.role,
      required this.id,
      required this.phoneNumber});

  UserModel.fromJson(Map<String, dynamic> json)
      : this(
          userName: json['userName'],
          email: json['email'],
          token: json['token'],
          emailConfirmed: json['emailConfirmed'],
          role: json['role'],
          suspended: json['suspended'],
          counter: json['moveCounter'],
          imgURL: json['userImgURL'],
          id: json['id'],
          phoneNumber: json['phoneNumber'],
        );

  Map<String, dynamic> toJson() => {
        'userName': userName,
        'email': email,
        'moveCounter': counter,
        'userImgURL': imgURL,
        'emailConfirmed': emailConfirmed,
        'token': token,
        'role': role,
        'id': id,
        'suspended': suspended,
        'phoneNumber': phoneNumber,
      };
}
