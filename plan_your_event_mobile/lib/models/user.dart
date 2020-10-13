
class User {

  final String uid;
  final String name;

  User ({ this.uid, this.name, });

  User.fromJson(Map<String, dynamic> json)
      : uid = json["uid"],
        name = json["name"];

  Map<String, dynamic> userToJson() => {
        'name': uid,
        'email': name,
      };
}