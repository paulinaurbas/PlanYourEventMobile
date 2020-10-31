
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:planyoureventmobile/enums/party_type.dart';
import 'package:planyoureventmobile/enums/place_type.dart';

import 'address_model.dart';

class Event {
  String id;
  String eventName;
  String placeName;
  PlaceType placeType;
  PartyType partyType;
  Address address;
  DateTime dateTime;
  List<int> guestList = List <int>();
  List<int> menuList = List <int>();
  bool isPastEvent;
  int bugdetId;
  List<int> supliersList = List <int>();
  List<int> documentsList =List <int>();
  String inspirationUrl;
  int harmonogramId;

  Event({
      this.id,
      this.eventName,
      this.placeName,
      this.placeType,
      this.partyType,
      this.address,
      this.dateTime,
      this.guestList,
      this.menuList,
      this.isPastEvent,
      this.bugdetId,
      this.supliersList,
      this.documentsList,
      this.inspirationUrl,
      this.harmonogramId});

  Event.fromJson(Map<String, dynamic> json)
      :  id= json["id"],
        eventName= json["event_name"],
        placeName= json["place_name"],
        placeType= getPlaceType(json["place_type"]),
        partyType= getPartyType(json["party_type"]),
        address= Address.fromJson(json["address"],),
        dateTime= json["date_time"] != null ? DateTime.parse((json["date_time"] as Timestamp).toDate().toString()) : null,
        guestList= json["guest_list"],
        menuList= json["menu_list"],
        isPastEvent= json["is_past_event"],
        bugdetId= json["bugdet_id"],
        supliersList= json["supliers_list"],
        documentsList= json["documents_list"],
        inspirationUrl= json["inspiration_url"],
        harmonogramId= json["harmonogram_id"];


  Map<String, dynamic> eventToJson() => {
    'user_id': id,
    'event_name': eventName,
    'place_name': placeName,
    'party_type': partyType.toString(),
    'place_type': placeType.toString(),
    'place_name': placeName,
    'address': address.addressToJson(),
    'date_time': dateTime,
  };
  int getSeconds (Map<dynamic, dynamic> json) => json["seconds"];


  String get getFormattedData => dateTime.day.toString() + '-' + dateTime.month.toString() + '-' + dateTime.year.toString();

  String get getTimeFormatted {
    if (dateTime.minute < 10) {
      return dateTime.hour.toString() + '.' + '0${dateTime.minute.toString()}';
    } else {
      return dateTime.hour.toString() + '.' + dateTime.minute.toString();
    }
  }


}