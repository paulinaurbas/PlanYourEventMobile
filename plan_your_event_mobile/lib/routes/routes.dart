import 'package:flutter/material.dart';
import 'package:planyoureventmobile/screens/guests/add_guest_screen.dart';
import 'package:planyoureventmobile/screens/guests/family_group_screen.dart';
import 'package:planyoureventmobile/screens/guests/friends_group_screen.dart';
import 'package:planyoureventmobile/screens/guests/guest_groups_screen.dart';
import 'package:planyoureventmobile/screens/guests/other_group_screen.dart';
import 'package:planyoureventmobile/screens/guests/work_group_screen.dart';
import 'package:planyoureventmobile/screens/parties/add_party/add_details_to_party_screen.dart';
import 'package:planyoureventmobile/screens/parties/add_party/add_guest_to_party_screen.dart';
import 'package:planyoureventmobile/screens/parties/add_party/create_party_screen.dart';

var customRoutes = <String, WidgetBuilder>{
   '/CreateParty': (context) => CreatePartyScreen(),
   '/GuestDetails': (context) => AddGuestToPartyScreen(),
   '/PartyDetails': (context) => AddPartyDetailsScreen(),
   '/GuestGroupScreen': (context) => GuestGroupScreen(),
   '/FamilyGroupScreen': (context) => FamilyGroupScreen(),
   '/FriendGroupScreen': (context) => FriendsGroupScreen(),
   '/OthersGroupScreen': (context) => OtherGroupScreen(),
   '/WorkGroupScreen': (context) => WorkGroupScreen(),
   '/AddGuest': (context) => AddNewGuestScreen(),
};