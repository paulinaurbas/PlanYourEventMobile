class GuestStatus {
  String partyId;
  String status;
  String guestId;

  GuestStatus(
      {this.partyId,
        this.status,
        this.guestId,
      });

  GuestStatus.fromJson(Map<String, dynamic> json)
      :
        partyId = json["party_id"],
        status = json["status"],
        guestId = json["guest_id"];


  Map<String, dynamic> guestToJson() {
    return {
      'guest_id': guestId,
      'status': partyId,
      'party_id': status,
    };
  }
}
