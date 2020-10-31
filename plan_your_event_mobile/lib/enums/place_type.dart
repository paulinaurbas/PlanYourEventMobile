import 'package:flutter/cupertino.dart';

enum PlaceType {
  RESTAURANT,
  HOTEL,
  GARDEN,
  HOME,
  BUISNESS_AREA,
}

const Map<String, PlaceType> placeTypes = {
  'RESTAURANT': PlaceType.RESTAURANT,
  'HOTEL': PlaceType.HOTEL,
  'GARDEN': PlaceType.GARDEN,
  'HOME': PlaceType.HOME,
  'BUISNESS_AREA': PlaceType.BUISNESS_AREA
};

getPlaceType(String status) {
  switch (status) {
    case 'PlaceType.RESTAURANT':
      return PlaceType.RESTAURANT;
    case 'PlaceType.HOTEL':
      return PlaceType.HOTEL;
    case 'PlaceType.GARDEN':
      return PlaceType.GARDEN;
    case 'PlaceType.HOME':
      return PlaceType.HOME;
    case 'PlaceType.BUISNESS_AREA':
      return PlaceType.BUISNESS_AREA;
  }
}