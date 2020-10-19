enum PartyType {
  BIRTHDAY_PARTY,
  BUISNESS_METTING,
  KINDER_BALL,
  FAMILY_DINNER,
  BABY_SHOWER,
  BAPTISM,
  HOLY_COMMUNION
}

const Map<String, PartyType> partyType = {
  'BIRTHDAY_PARTY': PartyType.BIRTHDAY_PARTY,
  'BUISNESS_METTING': PartyType.BUISNESS_METTING,
  'KINDER_BALL': PartyType.KINDER_BALL,
  'FAMILY_DINNER': PartyType.FAMILY_DINNER,
  'BABY_SHOWER': PartyType.BABY_SHOWER,
  'BAPTISM': PartyType.BAPTISM,
  'HOLY_COMMUNION': PartyType.HOLY_COMMUNION,
};

getPartyType(String status){
  switch (status){
    case 'BIRTHDAY_PARTY':
      return PartyType.BIRTHDAY_PARTY;
    case 'BUISNESS_METTING':
      return PartyType.BUISNESS_METTING;
    case 'KINDER_BALL':
      return PartyType.KINDER_BALL;
    case 'FAMILY_DINNER':
      return PartyType.FAMILY_DINNER;
    case 'BABY_SHOWER':
    return PartyType.BABY_SHOWER;
    case 'BAPTISM':
      return PartyType.BAPTISM;
    case 'HOLY_COMMUNION':
      return PartyType.HOLY_COMMUNION;
  }

}
