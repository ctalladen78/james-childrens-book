
class User {
  String link;
  String email;
  String picture;
  String name;

  User({this.name, this.link, this.email, this.picture});
  get getEmail => email;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json["name"] as String,
      link: json["link"] as String,
      email: json["email"] as String,
      picture: json["picture"] as String,
    );
  }
}