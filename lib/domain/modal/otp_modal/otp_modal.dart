class OtpModal {
  String? userid;
  String? otp;

  OtpModal({this.otp, this.userid});
  factory OtpModal.fromJson(Map<String, dynamic> json) {
    return OtpModal(
      userid: json["userid"],
      otp: json["otp"],
    );
  }

  Map<String, dynamic> toJson() => {
        "userid": userid,
        "otp": otp,
      };
}
