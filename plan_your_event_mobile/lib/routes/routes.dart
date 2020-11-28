import 'package:flutter/material.dart';
import 'package:planyoureventmobile/screens/guests/add_guest_screen.dart';
import 'package:planyoureventmobile/screens/guests/family_group_screen.dart';
import 'package:planyoureventmobile/screens/guests/friends_group_screen.dart';
import 'package:planyoureventmobile/screens/guests/guest_groups_screen.dart';
import 'package:planyoureventmobile/screens/guests/other_group_screen.dart';
import 'package:planyoureventmobile/screens/guests/work_group_screen.dart';
import 'package:planyoureventmobile/screens/main/home_screen.dart';
import 'package:planyoureventmobile/screens/main/upcoming_party/bugdet/UI/budget_screen.dart';
import 'package:planyoureventmobile/screens/main/upcoming_party/documents/UI/documents_screen.dart';
import 'package:planyoureventmobile/screens/main/upcoming_party/guest_confirmation/guest_confirmation_screen.dart';
import 'package:planyoureventmobile/screens/main/upcoming_party/menu/UI/add_menu_screen.dart';
import 'package:planyoureventmobile/screens/main/upcoming_party/menu/UI/menu_screen.dart';
import 'package:planyoureventmobile/screens/main/upcoming_party/screens/party_inspiration_web_view.dart';
import 'package:planyoureventmobile/screens/main/upcoming_party/screens/upcoming_party_content.dart';
import 'package:planyoureventmobile/screens/main/upcoming_party/supliers/UI/add_suppliers_screen.dart';
import 'package:planyoureventmobile/screens/main/upcoming_party/supliers/UI/supliers_screen.dart';
import 'package:planyoureventmobile/screens/main/upcoming_party/to_do/UI/to_do_screen.dart';
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
   '/UpComingParty':(context) => DisplayUpcomingPartyContent(),
   '/Home':(context) => HomeScreen(),
   '/PartyInspirationWebView': (context) => PartyInspirationWebView(),
   '/PartyGuestsConfirmation': (context) => GuestConfirmationScreen(),
   '/MenuDetails': (context) => MenuScreen(),
   '/AddMenu': (context) => AddMenuScreen(),
   '/Supliers': (context) => SupliersScreen(),
   '/AddSupplier':(context) => AddSupliersScreen(),
   '/Documents': (context) => DocumentsScreen(),
   '/ToDo': (context) => ToDoScreen(),
   '/Budget': (context) => BudgetScreen(),
};