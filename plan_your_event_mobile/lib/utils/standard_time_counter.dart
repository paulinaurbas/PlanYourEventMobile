import 'package:planyoureventmobile/styling/dictionary.dart';

int getDiffrence(DateTime dateTime) {
  final date2 = DateTime.now();
  return date2
      .difference(dateTime).inSeconds;
}
String getDiffrenceToPartyStart(DateTime dateTime){
  DateTime dateTimeNow = DateTime.now();
  final differenceInDays = dateTimeNow.difference(dateTime).inDays;
  final differenceInHours = dateTimeNow.difference(dateTime).inHours;
  final differenceInMinutes = dateTimeNow.difference(dateTime).inMinutes;

  if(differenceInDays < 0){
    return  differenceInDays.toString().replaceAll('-', '') + ' ' + appStrings['daysToParty'];
  } else if (differenceInHours < 0){
    return  differenceInHours.toString().replaceAll('-', '') + ' ' + appStrings['hoursToParty'];
  } else if (differenceInMinutes < 0){
    return  differenceInMinutes.toString().replaceAll('-', '') + ' ' + appStrings['minutesToParty'];
  } else {
    return '-' + ' ' + appStrings['minutesToParty'];
  }
}