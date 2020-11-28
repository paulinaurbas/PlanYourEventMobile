import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planyoureventmobile/enums/to_do_categories.dart';
import 'package:planyoureventmobile/models/budget_model.dart';
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
  final PublishSubject<int> toDoLenght = PublishSubject<int>();
  final PublishSubject<int> inProgressLength = PublishSubject<int>();
  final PublishSubject<int> doneLenght = PublishSubject<int>();
  Stream<List<ToDoItem>> get toDoListStream => toDoList.stream;
  Stream<List<ToDoItem>> get inProgressListStream => inProgressList.stream;
  Stream<List<ToDoItem>> get doneListStream => doneList.stream;

  Stream<int> get toDoLengthStream => toDoLenght.stream;
  Stream<int> get inProgressLengthStream => inProgressLength.stream;
  Stream<int> get doneLengthStream => doneLenght.stream;

  final PublishSubject <List<ToDoItem>> toDoList = PublishSubject<List<ToDoItem>>();
  final PublishSubject <List<ToDoItem>> inProgressList= PublishSubject <List<ToDoItem>>();
  final PublishSubject <List<ToDoItem>> doneList= PublishSubject <List<ToDoItem>>();

  Stream <String> get descriptionName => _maxLimit.stream;

  Function(String) get changeLimit => _maxLimit.sink.add;

  addBudget(String partyID) async {
    if( _maxLimit.value != null) {
      Budget budget = Budget(maxPrice: int.parse(_maxLimit.value),
          partyId: partyID);
      bugdetId = await _budgetRepository.addBudget(budget);
    }
    refreshRepo(partyID);
  }

  addToDoStatus(ToDoType toDoType) async {
    _todoType.sink.add(toDoType);
  }
  editGuestStatus(ToDoItem toDoStatus){
    //_doRepository.editToDoStatus(toDoStatus);

  }

  getPartyToDoLengthThings(String partyID) async {
    /*
    FirebaseAuth.instance.currentUser().then((FirebaseUser user) async {
      int response = await _doRepository.getToDoStatus(partyID, ToDoType.TODO);
      toDoLenght.sink.add(response);
    });

     */
  }
  getPartyDoneLengthThings(String partyID) async {
    /*
    FirebaseAuth.instance.currentUser().then((FirebaseUser user) async {
      int response = await _doRepository.getToDoStatus(
          partyID, ToDoType.DONE);
      doneLenght.sink.add(response);
    });

     */
  }

  getPartyInProgressLengthThings(String partyID) async {
    /*
    FirebaseAuth.instance.currentUser().then((FirebaseUser user) async {
      int response = await _doRepository.getToDoStatus(
          partyID, ToDoType.INPROGRESS);
      inProgressLength.sink.add(response);
    });

     */
  }

  refreshRepo(String partyId){
  /*  getPartyToDoListThings(partyId);
    getPartyInProgressListThings(partyId);
    getPartyDoneListThings(partyId);
    getPartyToDoLengthThings(partyId);
    getPartyDoneLengthThings(partyId);
    getPartyInProgressLengthThings(partyId);
    getPartyDoneListThings(partyId);
    getPartyInProgressListThings(partyId);
   */
  }
  getPartyToDoListThings(String partyID) async {
   /* FirebaseAuth.instance.currentUser().then((FirebaseUser user) async {
      List<ToDoItem> response = await _doRepository.getToDo(partyID, ToDoType.TODO.toString());
      toDoList.sink.add(response);
    }); */
  }
  getPartyInProgressListThings(String partyID) async {
   /* FirebaseAuth.instance.currentUser().then((FirebaseUser user) async {
      List<ToDoItem> response = await _doRepository.getToDo(
          partyID, ToDoType.INPROGRESS.toString());
      inProgressList.sink.add(response);
    }); */
  }

  getPartyDoneListThings(String partyID) async {
    /*
    FirebaseAuth.instance.currentUser().then((FirebaseUser user) async {
      List<ToDoItem> response = await _doRepository.getToDo(
          partyID, ToDoType.DONE.toString());
      doneList.sink.add(response);
    });

     */
  }

  void dispose(){
    toDoLenght.close();
    inProgressLength.close();
    doneLenght.close();
    _maxLimit.close();
    _todoType.close();
    toDoList.close();
    inProgressList.close();
    doneList.close();
  }


}
