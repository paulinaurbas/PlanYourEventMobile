import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planyoureventmobile/models/address_model.dart';
import 'package:planyoureventmobile/models/supplier_model.dart';
import 'package:planyoureventmobile/repository/supplier_repository.dart';
import 'package:rxdart/rxdart.dart';

class SuppliersBloc extends BlocProvider {
  SupplierRepository supplierRepository = SupplierRepository();
  final _supplierName = BehaviorSubject<String>();
  final _street = BehaviorSubject<String>();
  final _city = BehaviorSubject<String>();
  final _phone = BehaviorSubject<String>();
  final _email = BehaviorSubject<String>();
  final _personResponsible = BehaviorSubject<String>();
  final _thingsFromSupplier = BehaviorSubject<String>();
  PublishSubject<String> partyID = PublishSubject();
  final PublishSubject<List<Supplier>> suppliersList = PublishSubject<List<Supplier>>();
  Stream<List<Supplier>> get supplierListStream => suppliersList.stream;

  final _error = BehaviorSubject<dynamic>();

  Stream<dynamic> get errorStream => _error.stream;

  Stream<String> get cityName => _city.stream;

  Stream<String> get phoneStream => _phone.stream;

  Stream<String> get supplierNameStream => _supplierName.stream;

  Stream<String> get streetStream => _street.stream;

  Stream<String> get emailStream => _email.stream;

  Stream<String> get personResponsibleStream => _personResponsible.stream;

  Stream<String> get thingsFromSupplierStream => _thingsFromSupplier.stream;

  Function(String) get changeCity => _city.sink.add;

  Function(String) get changePhone => _phone.sink.add;

  Function(String) get changeSupplierName => _supplierName.sink.add;

  Function(String) get changeStreet => _street.sink.add;

  Function(String) get changeEmail => _email.sink.add;

  Function(String) get changePersonResponsible => _personResponsible.sink.add;

  Function(String) get changeThingsFromSupplier => _thingsFromSupplier.sink.add;

  bool updateShouldNotify(_) => true;

  getPartySuppliers(String partyId) async {
    List<Supplier> response = await supplierRepository.getPartySupplier(partyId);
    suppliersList.sink.add(response);
  }

  Future<void> addSupplier(
      String type,
      String partyId) async {
      FirebaseAuth.instance.currentUser().then((FirebaseUser user) {
      String userId;
      if (user != null) {
        userId = user.uid;
      }
      Address address = Address(_street.value, _city.value);
      Supplier menu = Supplier(
        type: type,
        supplierName: _supplierName.value,
        address: address ,
        phone: _phone.value,
        email: _email.value,
        personResponsible: _personResponsible.value,
        staffFromSupplier: _thingsFromSupplier.value,
        partyId: partyId,
      );
      return supplierRepository.addSupplier(menu);
    }).catchError((e) {
      print(e);
      _error.sink.addError(e);
      return null;
    });
    return null;
  }

  void dispose() async {
    _supplierName.close();
    _street.close();
    _city.close();
    _phone.close();
    _error.close();
    _email.close();
    _personResponsible.close();
    _thingsFromSupplier.close();
    partyID.close();
    suppliersList.close();
  }

  bool validateFields() {
    if (_supplierName.value != null &&
        _supplierName.value.isNotEmpty) {
      _error.sink.addError('ValueNotNull');
      return true;
    } else {
      return false;
    }
  }
}
