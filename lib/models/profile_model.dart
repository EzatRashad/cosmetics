class ProfileModel {
  final int id;
  final String username;
  final String email;
  final String role;
  final String phoneNumber;
  final String countryCode;
  final String? profilePhotoUrl;

  ProfileModel({
    required this.id,
    required this.username,
    required this.email,
    required this.role,
    required this.phoneNumber,
    required this.countryCode,
    this.profilePhotoUrl,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      role: json['role'],
      phoneNumber: json['phoneNumber'],
      countryCode: json['countryCode'],
      profilePhotoUrl: json['profilePhotoUrl'],
    );
  }
}
