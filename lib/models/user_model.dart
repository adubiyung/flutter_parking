class UserModel {
  final String userID;
  final String otpNumber;
  final String nameUser;
  final String emailUser;
  final String phoneNumber;
  final String ballanceUser;
  final String pointUser;
  final String statusUser;
  final String versionID;
  final String createdBy;
  final String createdDate;
  final String updatedBy;
  final String updatedDate;
  final String otpValidDate;
  final String tokenUser;

  UserModel(
      {this.userID,
      this.otpNumber,
      this.nameUser,
      this.emailUser,
      this.phoneNumber,
      this.ballanceUser,
      this.pointUser,
      this.statusUser,
      this.versionID,
      this.createdBy,
      this.createdDate,
      this.updatedBy,
      this.updatedDate,
      this.otpValidDate,
      this.tokenUser});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      phoneNumber: json['user_phone'],
    );
  }

  Map verifyNumberMap() {
    var map = new Map<String, dynamic>();
    map["user_phone"] = phoneNumber;
    return map;
  }
}
