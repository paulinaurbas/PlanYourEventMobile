import 'drinks_model.dart';

class Menu {
  String id;
  String type;
  int amount;
  String description;
  bool vegan;
  bool vegetarian;
  bool kids;
  bool seaFood;
  bool noFish;
  bool glutenFree;
  Drink drink;
  String partyId;
  String menuId;

  Menu.fromJson(Map<dynamic, dynamic> json)
      : id = json["id"],
        type = json["type"],
        amount = json["amount"],
        description = json["description"],
        vegan = json["vegan"],
        vegetarian = json["vegetarian"],
        kids = json["kids"],
        seaFood = json["sea_food"],
        noFish = json["no_fish"],
        glutenFree = json["gluten_free"],
        partyId = json["party_id"],
        menuId = json["menu_id"],
        drink = json["drink"];

  Menu({
      this.id,
      this.type,
      this.amount,
      this.description,
      this.vegan,
      this.vegetarian,
      this.kids,
      this.seaFood,
      this.noFish,
      this.glutenFree,
      this.drink,
      this.partyId,
      this.menuId});

  Map<String, dynamic> menuToJson() => {
        'id': id,
        'type': type,
        'amount': amount,
        'description': description,
        'vegan': vegan,
        'vegetarian': vegetarian,
        'kids': kids,
        'sea_food': seaFood,
        'no_fish': noFish,
        'gluten_free': glutenFree,
        'drink': drink.drinkToJson(),
        'menu_id': menuId,
        'party_id': partyId,
      };

  void addId(String id){
    this.menuId = id;
  }
}
