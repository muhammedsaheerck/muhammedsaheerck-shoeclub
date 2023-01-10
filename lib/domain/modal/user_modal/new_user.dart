class UserModal {
  NewUser? newUser;

  UserModal({this.newUser});

  factory UserModal.fromJson(Map<String, dynamic> json) {
    return UserModal(newUser: json["newUser"]);
  }

  Map<String, dynamic> toJson() => {"newUser": newUser};
}

class NewUser {
  String? fullname;
  String? email;
  String? password;

  NewUser({
    this.fullname,
    this.email,
    this.password,
  });

  factory NewUser.fromJson(Map<String, dynamic> json) {
    return NewUser(
      email: json["email"],
      fullname: json["fullname"],
      password: json["password"],
    );
  }

  Map<String, dynamic> toJson() => {
        "email": email,
        "fullname": fullname,
        "password": password,
      };
}
