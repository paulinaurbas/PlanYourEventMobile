
import 'package:planyoureventmobile/enums/PartyType.dart';
import 'package:planyoureventmobile/enums/PlaceType.dart';

import 'address_model.dart';

class Event {
  int id;
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
  int  harmonogramId;

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
        eventName= json["uid"],
        placeName= json["uid"],
        placeType= json["uid"],
        partyType= json["uid"],
        address= Address.fromJson(json["address"],),
        dateTime= json["uid"],
        guestList= json["uid"],
        menuList= json["uid"],
        isPastEvent= json["uid"],
        bugdetId= json["uid"],
        supliersList= json["uid"],
        documentsList= json["uid"],
        inspirationUrl= json["uid"],
        harmonogramId= json["uid"];

  Map<String, dynamic> eventToJson() => {

  };
}