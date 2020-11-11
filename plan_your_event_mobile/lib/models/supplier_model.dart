import 'package:planyoureventmobile/models/address_model.dart';

import 'address_model.dart';

class Supplier {
  String id;
  String supplierName;
  Address address;
  String phone;
  String email;
  String personResponsible;
  String type;
  String staffFromSupplier;
  String partyId;

  Supplier.fromJson(Map<dynamic, dynamic> json)
      : address = Address.fromJson(json['address']),
        supplierName = json["supplier_name"],
        id = json["id"],
        phone = json["phone"],
        email = json["email"],
        personResponsible = json["person_responsible"],
        type = json["type"],
        partyId = json["party_id"],
        staffFromSupplier = json["staff_from_supplier"];

  Supplier({this.id, this.address, this.phone, this.email, this.supplierName,
      this.personResponsible, this.type, this.staffFromSupplier, this.partyId});

  Map<String, dynamic> supplierToJson() => {
        'id': id,
        'address': address.addressToJson(),
        'phone': phone,
        'email': email,
        'person_responsible': personResponsible,
        'staff_from_supplier': staffFromSupplier,
        'type': type,
        'supplier_name': supplierName,
        'party_id': partyId,
      };

  void addId(String id) {
    this.id = id;
  }
}
