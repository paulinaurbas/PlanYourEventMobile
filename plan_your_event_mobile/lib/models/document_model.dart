
class Document {
  String id;
  String documentItem;
  bool isDone;
  String partyId;

  Document({this.id, this.documentItem, this.isDone, this.partyId});

  Document.fromJson(Map<dynamic, dynamic> json)
      : id = json["id"],
        documentItem = json["document_item"],
        isDone = json["id_done"],
        partyId = json["party_id"];

  Map<String, dynamic> documentToJson() => {
    'id': id,
    'document_item': documentItem,
    'id_done': isDone,
    'party_id': partyId,
  };

  void editStatus(bool status) => this.isDone = status;

  void addId(String id) {
    this.id = id;
  }
}
