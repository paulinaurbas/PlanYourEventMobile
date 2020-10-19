import 'package:flutter/material.dart';
import 'package:planyoureventmobile/screens/parties/add_party/add_details_to_party_screen.dart';
import 'file:///C:/Users/User/Documents/GitHub/PlanYourEventMobile/plan_your_event_mobile/lib/screens/parties/add_party/create_party_screen.dart';
import 'package:planyoureventmobile/screens/parties/add_party/add_guest_to_party_screen.dart';

var customRoutes = <String, WidgetBuilder>{
'/CreateParty': (context) => CreatePartyScreen(),
'/GuestDetails': (context) => AddGuestToPartyScreen(),
  '/PartyDetails': (context) => AddPartyDetailsScreen(),
};