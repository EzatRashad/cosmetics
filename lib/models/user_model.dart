class UserModel {
  String? token;
  User? user;

  UserModel({this.token, this.user});

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }
}

class User {
  int? id;
  String? username;
  String? email;
  String? phoneNumber;
  String? countryCode;
  String? role;
  String? profilePhotoUrl;

  User({
    this.id,
    this.username,
    this.email,
    this.phoneNumber,
    this.countryCode,
    this.role,
    this.profilePhotoUrl,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    countryCode = json['countryCode'];
    role = json['role'];
    profilePhotoUrl = json['profilePhotoUrl'];
  }
}
