import 'package:flutter/cupertino.dart';
import 'package:planyoureventmobile/datasources/menu/menu_api_provider.dart';
import 'package:planyoureventmobile/models/menu.dart';

class MenuRepository with ChangeNotifier {
  final _menuApiProvider = MenuApiProvider();

  Future <String> addMenu (Menu menu) => _menuApiProvider.addMenu(menu);

  Future <List<Menu>> getPartyMenu (String partyId) => _menuApiProvider.getPartyMenu(partyId);
}