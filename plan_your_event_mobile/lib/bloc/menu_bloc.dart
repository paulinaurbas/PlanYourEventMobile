import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planyoureventmobile/models/drinks_model.dart';
import 'package:planyoureventmobile/models/menu.dart';
import 'package:planyoureventmobile/repository/menu_repository.dart';
import 'package:rxdart/rxdart.dart';

class MenuBloc extends BlocProvider {
  MenuRepository menuRepository = MenuRepository();
  final _price = BehaviorSubject<String>();
  final _amount = BehaviorSubject<int>();
  final _description = BehaviorSubject<String>();
  final _drinkAmount = BehaviorSubject<int>();
  PublishSubject <String> partyID = PublishSubject();
  final PublishSubject<List<Menu>> menuList = PublishSubject<List<Menu>>();
  Stream <List<Menu>> get menuListStream => menuList.stream;

  final _error = BehaviorSubject<dynamic>();

  Stream <dynamic> get errorStream => _error.stream;

  Stream <String> get descriptionName => _description.stream;

  Stream<int> get drinkName => _drinkAmount.stream;

  Stream<String> get priceName => _price.stream;

  Stream<int> get amountName => _amount.stream;

  Function(String) get changeDescription => _description.sink.add;

  Function(int) get changeDrinkAmount => _drinkAmount.sink.add;

  Function(String) get changePrice => _price.sink.add;

  Function(int) get changeAmount => _amount.sink.add;


  bool updateShouldNotify(_) => true;

  getPartyMenu(String partyId) async {
    List<Menu> response = await menuRepository.getPartyMenu(partyId);
    menuList.sink.add(response);
  }

  Future<void> addMenu(String type, String drinkType, String partyId, bool vegan, bool vegetarian,
      bool kids, bool seaFood, bool noFish, bool glutenFree) async {
        FirebaseAuth.instance.currentUser().then((FirebaseUser user) {
        String userId;
        if (user != null) {
          userId = user.uid;
        }
        Menu menu = Menu(
          type: type,
          amount: _amount.value,
          description: _description.value,
          vegan: vegan,
          vegetarian: vegetarian,
          kids: kids,
          seaFood: seaFood,
          noFish: noFish,
          glutenFree: glutenFree,
          drink: Drink(amount: _drinkAmount.value, type: drinkType),
          partyId: partyId,
        );
        return menuRepository.addMenu(menu);
      }).catchError((e) {
        print(e);
        _error.sink.addError(e);
        return null;
      });
      return null;
    }


  void dispose() async {
    _price.close();
    _amount.close();
    _description.close();
    _drinkAmount.close();
    _error.close();
    partyID.close();
    menuList.close();
  }

  bool validateFields() {
    if (_price.value != null &&
        _price.value.isNotEmpty &&
        _amount.value != null &&
        !_amount.value.isNaN) {
      _error.sink.addError('ValueNotNull');
      return true;
    } else {
      return false;
    }
  }
}