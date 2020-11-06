import 'package:planyoureventmobile/models/guest.dart';
import 'package:planyoureventmobile/models/guest_status.dart';

class GuestInviteToPartyStatus {
  final Guest guest;
  final GuestStatus connectGuestWithParty;

  GuestInviteToPartyStatus({this.guest, this.connectGuestWithParty});
}