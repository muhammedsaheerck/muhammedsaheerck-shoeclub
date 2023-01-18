class UserModal {
  NewUser? newUser;

  UserModal({this.newUser});

  factory UserModal.fromJson(Map<String, dynamic> json) {
    return UserModal(newUser: json["newUser"]);
  }

  Map<String, dynamic> toJson() => {"newUser": newUser};
}

class NewUser {
  String? id;
  String? fullname;
  String? email;
  String? password;

  NewUser({
    this.id,
    this.fullname,
    this.email,
    this.password,
  });

  factory NewUser.fromJson(Map<String, dynamic> json) {
    return NewUser(
      id: json["_id"],
      email: json["email"],
      fullname: json["fullname"],
      password: json["password"],
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
        "fullname": fullname,
        "password": password,
      };
}
