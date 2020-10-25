import 'package:planyoureventmobile/enums/guest_groups.dart';
import 'package:planyoureventmobile/models/food_preferences.dart';

class Guest {
  String name;
  String surname;
  String phoneNumber;
  String email;
  String userId;
  bool noMilk;
  bool glutenFree;
  bool noMeat;
  bool noSeaFood;
  bool vegan;
  bool noNuts;
  bool noEggs;
  bool noFish;
  GuestType guestType;
  String guestId;

  Guest(
      {this.name,
      this.surname,
      this.phoneNumber,
      this.email,
      this.userId,
      this.noMilk,
      this.glutenFree,
      this.noMeat,
      this.noSeaFood,
      this.vegan,
      this.noNuts,
      this.noEggs,
      this.noFish,
      this.guestType, this.guestId});

  void addUserId(String id) {
    this.userId = id;
  }
  void addGuestId(String id) {
    this.guestId = id;
  }
  Guest.fromJson(Map<String, dynamic> json)
      : userId = json["user_id"],
        name = json["name"],
        surname = json["surname"],
        phoneNumber = json["phone_number"],
        email = json["email"],
        noMilk = json["no_milk"],
        glutenFree = json["gluten_free"],
        noMeat = json["no_meat"],
        noSeaFood = json["no_sea_food"],
        vegan = json["vegan"],
        noNuts = json["no_nuts"],
        noEggs = json["no_eggs"],
        noFish = json["no_fish"],
        guestId = json["guest_id"],
        guestType = getGuestsType(json["guest_type"]);

  Map<String, dynamic> guestToJson() {
    return {
      'user_id': userId,
      'guest_id': guestId,
      'name': name,
      'surname': surname,
      'phone_number': phoneNumber,
      'email': email,
      "no_milk": noMilk,
      "gluten_free": glutenFree,
      "no_meat": noMeat,
      "no_sea_food": noSeaFood,
      "vegan": vegan,
      "no_nuts": noNuts,
      "no_eggs": noEggs,
      "no_fish": noFish,
      'guest_type': guestType.toString()
    };
  }
}
