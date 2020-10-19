enum PlaceType {
  RESTAURANT,
  HOTEL,
  GARDEN,
  HOME
}

const Map<String, PlaceType> placeTypes = {
  'RESTAURANT': PlaceType.RESTAURANT,
  'HOTEL': PlaceType.HOTEL,
  'GARDEN': PlaceType.GARDEN,
  'HOME': PlaceType.HOME
};

getPlaceType(String status) {
  switch (status) {
    case 'RESTAURANT':
      return PlaceType.RESTAURANT;
    case 'HOTEL':
      return PlaceType.HOTEL;
    case 'GARDEN':
      return PlaceType.GARDEN;
    case 'HOME':
      return PlaceType.HOME;
  }
}