UserModel userModelFromMap(Map<String, dynamic> data) =>
    UserModel.fromMap(data);

Map<String, dynamic> userModelToMap(UserModel data) => data.toMap();

class UserModel {
  String uid;
  String name;
  String email;
  String phoneNo;

  UserModel({
    required this.name,
    required this.uid,
    required this.email,
    required this.phoneNo,
  });

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
      uid: json["uid"],
      name: json["name"],
      email: json["email"],
      phoneNo: json["phone_no"],);

  Map<String, dynamic> toMap() => {
        "uid": uid,
        "name": name,
        "email": email,
        "phone_no": phoneNo,
      };
}
