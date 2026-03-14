class UserModel {
  String name;
  String id;
  String email;
  String phone;
  String image;

  UserModel({
    required this.name,
    this.id = " ",
    required this.email,
    required this.phone,
    required this.image,
  });

  static UserModel fromjson(Map<String, dynamic> json) {
    return UserModel(
      name: json["name"],
      id: json["id"],
      email: json["email"],
      phone: json["phone"],
      image: json["image"],
    );
  }

  Map<String, dynamic> tojson() {
    return {
      "name": name,
      "id": id,
      "email": email,
      "phone": phone,
      "image": image,
    };
  }
}
