import 'package:flutter/cupertino.dart';
import 'package:planyoureventmobile/datasources/supplier/supplier_api_provider.dart';
import 'package:planyoureventmobile/models/supplier_model.dart';

class SupplierRepository with ChangeNotifier {
  final _supplierApiProvider = SupplierApiProvider();

  Future <String> addSupplier (Supplier supplier) => _supplierApiProvider.addSupplier(supplier);

  Future <List<Supplier>> getPartySupplier (String partyId) => _supplierApiProvider.getPartySupliers(partyId);
}