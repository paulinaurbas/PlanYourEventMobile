import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planyoureventmobile/models/event_model.dart';
import 'package:planyoureventmobile/styling/colors.dart';

class InformationBox extends StatelessWidget{
  Event event;

  InformationBox({this.event});

  @override
  Widget build(BuildContext context) {
   return getInformationBox;
  }
  Widget get getInformationBox => Padding(
      padding: const EdgeInsets.fromLTRB(18, 0, 18, 5),
      child: Container(
        decoration: BoxDecoration(
            color: appColors['backgound_tile'],
            border: Border.all(
              color: appColors['backgound_tile'],
            ),
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            getDateTimeColumn,
            getPlaceColumn,
          ],
        ),
      ));

  Widget get getDateTimeColumn => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(Icons.calendar_today),
            ),
            Text(event.getFormattedData)
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(Icons.access_time),
            ),
            Text(event.getTimeFormatted)
          ]),
        ),
      ],
    ),
  );
  Widget get getPlaceColumn => Padding(
    padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(Icons.location_on_outlined),
            ),
            Text(event.address.getStringWithAddress)
          ]),
        ),
      ],
    ),
  );


}