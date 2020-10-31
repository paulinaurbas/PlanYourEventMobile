import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planyoureventmobile/enums/guest_confirmation_status.dart';
import 'package:planyoureventmobile/models/event_model.dart';
import 'package:planyoureventmobile/models/guest.dart';
import 'package:planyoureventmobile/models/guest_status.dart';
import 'package:planyoureventmobile/repository/parties_repository.dart';
import 'package:planyoureventmobile/utils/standard_time_counter.dart';
import 'package:rxdart/rxdart.dart';


class PartyBloc extends BlocProvider {
  final _partiesRepository = PartiesRepository();

  final PublishSubject<List<GuestStatus>> partyGuestConfirmed = PublishSubject<List<GuestStatus>>();
  final PublishSubject<List<Event>> userParties = PublishSubject<List<Event>>();
  final PublishSubject<int> confirmedGuest = PublishSubject<int>();
  final PublishSubject<int> waitingGuest = PublishSubject<int>();
  final PublishSubject<int> declineGuest = PublishSubject<int>();


  bool updateShouldNotify(_) => true;

  getParties() async {
    FirebaseAuth.instance.currentUser().then((FirebaseUser user) async {
      List<Event> response = await _partiesRepository.getEventList(user.uid);
      List<Event> onlyFutureParties = response.where((i) => getDiffrence(i.dateTime) < 0).toList();
      userParties.sink.add(onlyFutureParties);
    });
  }

  getPartyGuestStatusConfirmed(String partyID) async {
    FirebaseAuth.instance.currentUser().then((FirebaseUser user) async {
      int response = await _partiesRepository.getPartyGuestStatus(partyID, GuestConfirmationStatus.CONFIRMED );
      confirmedGuest.sink.add(response);
    });
  }

  getPartyGuestStatusWaiting(String partyID) async {
    FirebaseAuth.instance.currentUser().then((FirebaseUser user) async {
      int response = await _partiesRepository.getPartyGuestStatus(partyID, GuestConfirmationStatus.WAITING);
      waitingGuest.sink.add(response);
    });
  }

  getPartyGuestStatusDecline(String partyID) async {
    FirebaseAuth.instance.currentUser().then((FirebaseUser user) async {
      int response = await _partiesRepository.getPartyGuestStatus(partyID, GuestConfirmationStatus.DECLINE);
      declineGuest.sink.add(response);
    });
  }


  void dispose() async {
    userParties.close();
    partyGuestConfirmed.close();
    confirmedGuest.close();
    waitingGuest.close();
    declineGuest.close();


  }

}
