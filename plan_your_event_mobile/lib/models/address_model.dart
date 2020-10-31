class Address {
  String street;
  String city;

  Address.fromJson(Map<dynamic, dynamic> json)
      :  street = json["street"],
        city = json["city"];

  Address(this.street, this.city);

  Map<String, dynamic> addressToJson() =>
      {
        'street': street,
        'city': city,
      };
  String get getStringWithAddress =>
      street + ' ' + city;
}