enum GuestType{
  FAMILY, FRIENDS, BUISSNESS, OTHERS
}
GuestType getGuestType(bool family, bool friends, bool work, bool others) {
  if(family){
    return GuestType.FAMILY;
  } else if(friends){
    return GuestType.FRIENDS;
  } else if(work){
    return GuestType.BUISSNESS;
  } else {
    return GuestType.OTHERS;
  }
}
const Map<String, GuestType> guestType = {
  'FAMILY': GuestType.FAMILY,
  'FRIENDS': GuestType.FRIENDS,
  'BUISSNESS': GuestType.BUISSNESS,
  'OTHERS': GuestType.OTHERS,
};

getGuestsType(String status){
  switch (status){
    case 'FAMILY':
      return GuestType.FAMILY;
    case 'FRIENDS':
      return GuestType.FRIENDS;
    case 'BUISSNESS':
      return GuestType.BUISSNESS;
    case 'OTHERS':
      return GuestType.OTHERS;
  }

}
