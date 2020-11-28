
class BudgetItem {
  String id;
  String budgetItem;
  int price;
  String partyId;
  String budgetId;

  BudgetItem({this.id, this.budgetItem, this.price, this.partyId});

  BudgetItem.fromJson(Map<dynamic, dynamic> json)
      : id = json["id"],
        budgetItem = json["budget_item"],
        price = json["price"],
        budgetId = json["budget_id"],
        partyId = json["party_id"];

  Map<String, dynamic> budgetToJson() => {
    'id': id,
    'budget_item': budgetItem,
    'price': price,
    'party_id': partyId,
  };

  void addId(String id) {
    this.id = id;
  }
}
