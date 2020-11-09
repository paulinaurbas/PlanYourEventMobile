class Drink {
  String type;
  int amount;

  Drink.fromJson(Map<dynamic, dynamic> json)
      :  type = json["type"],
        amount = json["amount"];

  Drink({this.type, this.amount});

  Map<String, dynamic> drinkToJson() =>
      {
        'type': type,
        'amount': amount,
      };

}