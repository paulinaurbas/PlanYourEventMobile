
class Budget {
  String id;
  String budgetItem;
  int maxPrice;
  String partyId;
  int actualPrice;


  Budget({this.id, this.budgetItem, this.maxPrice, this.partyId});

  Budget.fromJson(Map<dynamic, dynamic> json)
      : id = json["id"],
        budgetItem = json["budget_item"],
        maxPrice = json["max_price"],
        partyId = json["party_id"];

  Map<String, dynamic> budgetToJson() => {
    'id': id,
    'budget_item': budgetItem,
    'max_price': maxPrice,
    'party_id': partyId,
  };

  void addId(String id) {
    this.id = id;
  }
}
