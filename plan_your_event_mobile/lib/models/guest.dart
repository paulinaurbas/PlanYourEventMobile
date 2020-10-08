import 'package:planyoureventmobile/enums/guest_groups.dart';
import 'package:planyoureventmobile/models/food_preferences.dart';
import 'package:planyoureventmobile/models/person.dart';

class Guest {
  Person person;
  FoodPreferences foodPreferences;
  GuestType guestType;

  Guest({this.person, this.foodPreferences, this.guestType});

}