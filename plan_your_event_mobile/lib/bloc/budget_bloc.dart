import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planyoureventmobile/enums/to_do_categories.dart';
import 'package:planyoureventmobile/models/budget_model.dart';
import 'package:planyoureventmobile/models/bugdet_item_model.dart';
import 'package:planyoureventmobile/models/to_do_item.dart';
import 'package:planyoureventmobile/models/to_do_status.dart';
import 'package:planyoureventmobile/repository/budget_repository.dart';
import 'package:planyoureventmobile/repository/to_do_repository.dart';
import 'package:rxdart/rxdart.dart';

class BudgetBloc extends BlocProvider {
  BudgetRepository _budgetRepository = BudgetRepository();
  final _maxLimit = BehaviorSubject<String>();
  final _todoType = BehaviorSubject<ToDoType>();
  String bugdetId;


  final PublishSubject <Budget> budget = PublishSubject<Budget>();
  final PublishSubject <List<BudgetItem>> budgetItems= PublishSubject <List<BudgetItem>>();

  Stream <List<BudgetItem>> get budgetItemsListStream => budgetItems.stream;

  Stream <String> get descriptionName => _maxLimit.stream;

  Function(String) get changeLimit => _maxLimit.sink.add;

  getPartyBudget (String partyID){
    _budgetRepository.getPartyBudget(partyID).then((value) {
      if(value != null) {
        budget.sink.add(value);
      }
    });
    }
  getPartyBudgetItems (String partyID){
    _budgetRepository.getPartyBudgetItems(partyID, bugdetId).then((value) {
      budgetItems.sink.add(value);
    });
  }

  Future<void> addBudgetItem (
      String partyId, String documentDescription, String price, Budget budget) async {
    FirebaseAuth.instance.currentUser().then((FirebaseUser user) {
      String userId;
      if (user != null) {
        userId = user.uid;
      }
      BudgetItem document = BudgetItem(partyId: partyId, budgetItem: documentDescription, price: double.parse(price));
      updateBudget(budget, double.parse(price));
      refreshRepo(partyId);
      return _budgetRepository.addBudgetItem(document);
    }).catchError((e) {
      print(e);
      return null;
    });
    return null;
  }

  Future<void> updateBudget(Budget budget, double price) async {
    FirebaseAuth.instance.currentUser().then((FirebaseUser user) {
      String userId;
      if (user != null) {
        userId = user.uid;
      }
      Budget updatedBudget = Budget(id: budget.id, maxPrice: budget.maxPrice,
        partyId: budget.partyId, budgetItem: budget.budgetItem, actualPrice: budget.actualPrice + price,
      );
      return _budgetRepository.updateBudget(updatedBudget);
    }).catchError((e) {
      print(e);
      return null;
    });
    return null;
  }

  addBudget(String partyID) async {
    if( _maxLimit.value != null) {
      Budget budget = Budget(maxPrice: int.parse(_maxLimit.value),
          partyId: partyID, actualPrice: 0);
      bugdetId = await _budgetRepository.addBudget(budget);
      getPartyBudget(partyID);
    }
    refreshRepo(partyID);
  }

  addToDoStatus(ToDoType toDoType) async {
    _todoType.sink.add(toDoType);
  }

  refreshRepo(String partyId){
    getPartyBudget(partyId);
    getPartyBudgetItems(partyId);
  }


  void dispose(){
    _maxLimit.close();
    _todoType.close();
    budget.close();
    budgetItems.close();
  }


}
