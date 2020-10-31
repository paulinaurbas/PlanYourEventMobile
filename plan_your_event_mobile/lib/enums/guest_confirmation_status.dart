enum GuestConfirmationStatus {
  CONFIRMED,
  WAITING,
  DECLINE
}

const Map<String, GuestConfirmationStatus> partyType = {
  'CONFIRMED': GuestConfirmationStatus.CONFIRMED,
  'WAITING': GuestConfirmationStatus.WAITING,
  'DECLINE': GuestConfirmationStatus.DECLINE,
};

getPartyType(String status){
  switch (status){
    case 'GuestConfirmationStatus.CONFIRMED':
      return GuestConfirmationStatus.CONFIRMED;
    case 'GuestConfirmationStatus.WAITING':
      return GuestConfirmationStatus.WAITING;
    case 'GuestConfirmationStatus.DECLINE':
      return GuestConfirmationStatus.DECLINE;
  }

}
