class AuthModel {
  final String phoneNumber;

  AuthModel({
    this.phoneNumber,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      phoneNumber: json['user_phone'],
    );
  }

  Map verifyNumberMap() {
    var map = new Map<String, dynamic>();
    map["user_phone"] = phoneNumber;
    return map;
  }
}
