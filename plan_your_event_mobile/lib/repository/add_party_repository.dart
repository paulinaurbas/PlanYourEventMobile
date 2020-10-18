import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:planyoureventmobile/datasources/add_party/add_party_api_provider.dart';
import 'package:planyoureventmobile/models/event_model.dart';

class AddPartyRepository with ChangeNotifier {
  final _addPartyApiProvider = AddPartyApiProvider();

  Future <void> addEvent(Event event) => _addPartyApiProvider.addParty(event);


}