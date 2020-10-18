class Address {
  String street;
  String city;

  Address.fromJson(Map<String, dynamic> json)
      :  street = json["street"],
        city = json["city"];

  Address(this.street, this.city);

  Map<String, dynamic> addressToJson() =>
      {
        'street': street,
        'city': city,
      };
}