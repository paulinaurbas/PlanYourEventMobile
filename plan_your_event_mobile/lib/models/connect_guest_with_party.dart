class ConnectGuestWithParty{
  String guestId;
  String partyId;
  String guestStatus;

  ConnectGuestWithParty({this.guestId, this.partyId, this.guestStatus});

  ConnectGuestWithParty.fromJson(Map<String, dynamic> json)
      :  guestId = json["guest_id"],
        partyId = json["party_id"],
        guestStatus = json["guest_status"];

  Map<String, dynamic> userToJson() => {
    'guest_id': partyId,
    'party_id': partyId,
    'guest_status': guestStatus,
  };
}