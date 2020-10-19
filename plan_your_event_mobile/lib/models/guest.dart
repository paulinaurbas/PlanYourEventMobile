import 'package:planyoureventmobile/enums/guest_groups.dart';
import 'package:planyoureventmobile/models/food_preferences.dart';

class Guest {
  String name;
  String surname;
  String phoneNumber;
  String email;

  FoodPreferences foodPreferences;
  GuestType guestType;

  Guest({this.name, this.surname, this.phoneNumber, this.email,
      this.foodPreferences, this.guestType});
}