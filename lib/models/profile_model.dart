class ProfileModel {
  String? name;
  String? email;
  String? phone;
  String? token;
  ProfileModel.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    email = json["email"];
    phone = json["phone"];
    token = json["token"];
  }
}
