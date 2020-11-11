import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:planyoureventmobile/bloc/suppliers_bloc.dart';
import 'package:planyoureventmobile/enums/drop_down_with_supplier_type.dart';
import 'package:planyoureventmobile/styling/colors.dart';
import 'package:planyoureventmobile/styling/dictionary.dart';

class AddSuplierContent extends StatefulWidget {
  final String partyId;

  const AddSuplierContent({Key key, this.partyId}) : super(key: key);

  @override
  _AddSuplierContentState createState() => _AddSuplierContentState();
}

class _AddSuplierContentState extends State<AddSuplierContent> {
  String supplierType;
  SuppliersBloc _bloc = SuppliersBloc();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: Center(
                child: Column(
                  children: [
                    getTypeDropDownRow,
                    getNameTextInput, getStreetTextInput, getCityTextInput,
                    getNumberTextInput, getMailTextInput, getPersonResponsibleTextInput,
                    getStaffFromSupplierTextInput, getButton],
                ),
              ))),
    );
  }

  Widget get getTypeDropDownRow => Padding(
    padding: const EdgeInsets.only(top: 20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          Icons.home_outlined,
          size: 22,
        ),
        getTypeDropDown,
      ],
    ),
  );


  Widget get getTypeDropDown {
    List <String> valueList = supplierList;
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.all(Radius.circular(12))
      ),
      height: 48,
      width: 200,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: supplierType,
            isExpanded: true,
            icon: Icon(Icons.keyboard_arrow_down),
            iconSize: 20,
            elevation: 12,
            underline: Container(
              height: 2,
              color: Colors.transparent,
            ),
            onChanged:
                (String newValue) {
              setState(() {
                supplierType = newValue;
              });
            },
            items: valueList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget get getNameTextInput => Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.location_on_outlined,
              size: 22,
            ),
            Container(
              width: 200,
              child: TextFormField(
                onChanged: _bloc.changeSupplierName,
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(12.0),
                      ),
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(12.0),
                      ),
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                    labelText: 'Name',
                    contentPadding: EdgeInsets.all(10)),
                keyboardType: TextInputType.text,
              ),
            ),
          ],
        ),
      );

  Widget get getStreetTextInput => Padding(
    padding: const EdgeInsets.only(top: 20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          Icons.location_on_outlined,
          size: 22,
          color: Colors.transparent,
        ),
        Container(
          width: 200,
          child: TextFormField(
            onChanged: _bloc.changeStreet,
            decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(12.0),
                  ),
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(12.0),
                  ),
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                ),
                labelText: 'Street',
                contentPadding: EdgeInsets.all(10)),
            keyboardType: TextInputType.text,
          ),
        ),
      ],
    ),
  );

  Widget get getCityTextInput => Padding(
    padding: const EdgeInsets.only(top: 20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          Icons.location_on_outlined,
          size: 22,
          color: Colors.transparent
        ),
        Container(
          width: 200,
          child: TextFormField(
            onChanged: _bloc.changeCity,
            decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(12.0),
                  ),
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(12.0),
                  ),
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                ),
                labelText: 'City',
                contentPadding: EdgeInsets.all(10)),
            keyboardType: TextInputType.text,
          ),
        ),
      ],
    ),
  );

  Widget get getNumberTextInput => Padding(
    padding: const EdgeInsets.only(top: 20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          Icons.phone_outlined,
          size: 22,
        ),
        Container(
          width: 200,
          child: TextFormField(
            onChanged: _bloc.changePhone,
            decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(12.0),
                  ),
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(12.0),
                  ),
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                ),
                labelText: 'Number',
                contentPadding: EdgeInsets.all(10)),
            keyboardType: TextInputType.phone,
          ),
        ),
      ],
    ),
  );
  Widget get getMailTextInput => Padding(
    padding: const EdgeInsets.only(top: 20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          Icons.mail_outline_outlined,
          size: 22,
        ),
        Container(
          width: 200,
          child: TextFormField(
            onChanged: _bloc.changeEmail,
            decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(12.0),
                  ),
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(12.0),
                  ),
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                ),
                labelText: 'E-mail',
                contentPadding: EdgeInsets.all(10)),
            keyboardType: TextInputType.emailAddress,
          ),
        ),
      ],
    ),
  );
  Widget get getPersonResponsibleTextInput => Padding(
    padding: const EdgeInsets.only(top: 20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          Icons.person_outline_outlined,
          size: 22,
        ),
        Container(
          width: 200,
          child: TextFormField(
            onChanged: _bloc.changePersonResponsible,
            decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(12.0),
                  ),
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(12.0),
                  ),
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                ),
                labelText: 'Responsible person',
                contentPadding: EdgeInsets.all(10)),
            keyboardType: TextInputType.text,

          ),
        ),
      ],
    ),
  );

  Widget get getStaffFromSupplierTextInput => Padding(
    padding: const EdgeInsets.only(top: 20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          Icons.assignment_outlined,
          size: 22,
        ),
        Container(
          width: 200,
          child: TextFormField(
            onChanged: _bloc.changeThingsFromSupplier,
            decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(12.0),
                  ),
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(12.0),
                  ),
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                ),
                labelText: 'Staff from this supplier',
                contentPadding: EdgeInsets.all(10)),
            keyboardType: TextInputType.text,
          ),
        ),
      ],
    ),
  );

  Widget get getButton => Padding(
    padding: const EdgeInsets.all(8.0),
    child: FlatButton(
      onPressed: () {
        saveSupplier();
        Navigator.pushNamed(context, '/Supliers', arguments: widget.partyId);
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      color: appColors['button_grey'],
      hoverColor:  appColors['button_grey'],
      child: Text(appStrings['next']),
    ),
  );

  void saveSupplier() {
    _bloc.addSupplier(supplierType, widget.partyId);
  }

}
