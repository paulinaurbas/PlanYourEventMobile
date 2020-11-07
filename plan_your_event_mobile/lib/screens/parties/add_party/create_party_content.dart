import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:planyoureventmobile/bloc/add_party_bloc.dart';
import 'package:planyoureventmobile/enums/party_type.dart';
import 'package:planyoureventmobile/enums/place_type.dart';
import 'package:planyoureventmobile/models/guest.dart';
import 'package:planyoureventmobile/styling/colors.dart';
import 'package:planyoureventmobile/styling/dictionary.dart';
import 'package:planyoureventmobile/utils/standard_error_hanler.dart';

class CreatePartyContent extends StatefulWidget {
  final PartyType partyType;

  const CreatePartyContent({Key key, this.partyType}) : super(key: key);

  @override
  _CreatePartyContentState createState() => _CreatePartyContentState();
}

class _CreatePartyContentState extends State<CreatePartyContent> {
  String dropDownValue;
  AddPartyBloc _addPartyBloc = AddPartyBloc();
  String _date = "Not set";
  String _time = "Not set";
  bool displayTime = false;

  @override
  void initState() {
    super.initState();
    _addPartyBloc.partyID.listen((value) {
      if (value != null) {
        Navigator.pushNamed(context, '/GuestGroupScreen', arguments: value);
      }
    });
  }

  bool displayDate = false;
  List<Guest> guestList = List<Guest>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors['backgroud_color'],
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(children: [
              getPlaceBox,
              getAddressBox,
              getDataTimeWidget,
              getButton
            ])
          ],
        ),
      ),
    );
  }

  Widget get getPlaceBox => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.all(Radius.circular(12))),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0, top: 20.0),
                      child: Icon(
                        Icons.home,
                      ),
                    ),
                  ),
                  Flexible(
                    child: TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Event name',
                          contentPadding: EdgeInsets.only(top: 2.0)),
                      keyboardType: TextInputType.text,
                      onChanged: _addPartyBloc.changePartyName,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Flexible(
                    child: TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Place Name',
                          contentPadding: EdgeInsets.only(top: 2.0)),
                      keyboardType: TextInputType.text,
                      onChanged: _addPartyBloc.changePlaceName,
                    ),
                  ),
                ]),
              ),
              DropdownButton<String>(
                value: dropDownValue,
                icon: Icon(Icons.keyboard_arrow_down),
                iconSize: 20,
                elevation: 16,
                underline: Container(
                  height: 2,
                  color: appColors['gradinet_dark_color'],
                ),
                onChanged: (String newValue) {
                  setState(() {
                    dropDownValue = newValue;
                    _addPartyBloc.changePlaceTypeName;
                  });
                },
                items: <String>[
                  'Restaurant',
                  'Garden',
                  'Hotel',
                  'Home',
                  'Buissness area'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              )
            ],
          ),
        ),
      );

  Widget get getAddressBox => Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0, top: 20.0),
                  child: Icon(
                    Icons.location_on,
                  ),
                ),
              ),
              Flexible(
                child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Address',
                      contentPadding: EdgeInsets.only(top: 2.0)),
                  keyboardType: TextInputType.text,
                  onChanged: _addPartyBloc.changeStreetName,
                ),
              ),
            ]),
          ),
          Align(
            alignment: Alignment.center,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                width: 100,
                child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'City',
                      contentPadding: EdgeInsets.only(top: 0.0)),
                  keyboardType: TextInputType.text,
                  onChanged: _addPartyBloc.changeCityName,
                ),
              ),
            ]),
          ),
        ]),
      ));

  Widget get getDataTimeWidget => Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 120,
              child: OutlineButton(
                highlightedBorderColor: appColors['gradinet_dark_color'],
                hoverColor: appColors['gradinet_dark_color'],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(displayDate ? _date : 'Date'),
                    displayDate
                        ? Container()
                        : Icon(
                            Icons.date_range,
                          ),
                  ],
                ),
                onPressed: () {
                  DatePicker.showDatePicker(context,
                      theme: DatePickerTheme(
                        containerHeight: 210.0,
                      ),
                      showTitleActions: true,
                      minTime: DateTime(2000, 1, 1),
                      maxTime: DateTime(2022, 12, 31), onConfirm: (date) {
                    _date = '${date.year} - ${date.month} - ${date.day}';
                    setState(() {
                      displayDate = true;
                    });
                  }, currentTime: DateTime.now(), locale: LocaleType.en);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 100,
              child: OutlineButton(
                  highlightedBorderColor: appColors['gradinet_dark_color'],
                  hoverColor: appColors['gradinet_dark_color'],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(displayTime ? _time : 'Time'),
                      displayTime
                          ? Container()
                          : Icon(
                              Icons.access_time,
                            )
                    ],
                  ),
                  onPressed: () {
                    DatePicker.showTimePicker(context,
                        theme: DatePickerTheme(
                          containerHeight: 210.0,
                        ),
                        showTitleActions: true, onConfirm: (time) {
                      if (time.minute < 10) {
                        _time = '${time.hour} : 0${time.minute}';
                      } else {
                        _time = '${time.hour} : ${time.minute}';
                      }
                      setState(() {
                        displayTime = true;
                      });
                    }, currentTime: DateTime.now(), locale: LocaleType.en);
                    setState(() {});
                  }),
            ),
          )
        ]),
      ));

  Widget get getButton => Padding(
        padding: const EdgeInsets.all(8.0),
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          onPressed: () {
            if (_addPartyBloc.validateFields()) {
              createParty();
            } else {
              String message = appStrings["smtWentWrong"];
              displaySnackbar(context, message);
            }
          },
          color: appColors['buttons_orange'],
          splashColor: appColors['gradinet_bright_color'],
          child: Text(appStrings['next']),
        ),
      );

  Future<void> createParty() async {
    dropDownValue = dropDownValue.replaceAll(' ', '_');
    PlaceType _placeType =
        getPlaceType(dropDownValue.replaceAll(' ', '_').toUpperCase());
    String partyID = await _addPartyBloc.addParty(
        _date, _time, _placeType, widget.partyType);
  }
}
