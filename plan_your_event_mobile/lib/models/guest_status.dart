import 'package:planyoureventmobile/enums/guest_confirmation_status.dart';

class GuestStatus {
  String guestStatusID;
  String guestId;
  String partyId;
  GuestConfirmationStatus guestStatus;

  GuestStatus({this.guestId, this.partyId, this.guestStatus, this.guestStatusID});

  GuestStatus.fromJson(Map<String, dynamic> json)
      :  guestId = json["guest_id"],
        partyId = json["party_id"],
        guestStatusID =  json["guest_status_id"],
        guestStatus = getGuestConfirmationStatus(json["guest_status"]);

  void addStatusID(String id){
    this.guestStatusID = id;
  }

  Map<String, dynamic> guestToJson() => {
    'guest_id': guestId,
    'party_id': partyId,
    'guest_status_id' : guestStatusID,
    'guest_status': guestStatus.toString(),
  };

  Map<String, dynamic> statusToJson() => {
    'guest_status': guestStatus.toString(),
  };
}
