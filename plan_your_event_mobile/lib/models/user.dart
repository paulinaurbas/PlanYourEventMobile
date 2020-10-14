
class User {

  final String uid;
  final String email;

  User ({ this.uid, this.email, });

  User.fromJson(Map<String, dynamic> json)
      : uid = json["uid"],
        email = json["name"];

  Map<String, dynamic> userToJson() => {
        'name': uid,
        'email': email,
      };
}