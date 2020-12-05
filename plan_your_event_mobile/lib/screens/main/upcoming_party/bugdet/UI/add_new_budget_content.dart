import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:planyoureventmobile/bloc/budget_bloc.dart';
import 'package:planyoureventmobile/bloc/documents_bloc.dart';
import 'package:planyoureventmobile/styling/colors.dart';
import 'package:planyoureventmobile/styling/dictionary.dart';

class AddNewBudgetContent extends StatefulWidget {
  final String partyID;
  final BudgetBloc bloc;
  const AddNewBudgetContent({
    Key key, this.partyID, this.bloc
  }) : super(key: key);

  @override
  _AddNewBudgetContentState createState() => _AddNewBudgetContentState();
}

class _AddNewBudgetContentState extends State<AddNewBudgetContent> {
  BudgetBloc _bloc;
  @override
  void initState() {
    super.initState();
    _bloc = widget.bloc;
    _bloc.budget.stream?.listen((event) {
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Column(
          children: [
            getCardWithAddNewBudget
          ],
        )
    );
  }
 Widget get getCardWithAddNewBudget {
    return Padding(
     padding: const EdgeInsets.all(24.0),
     child: Container(
        width: double.infinity,
         height: 224,
         decoration: BoxDecoration(
             color: Colors.white,
             border: Border.all(
               color: Colors.white,
             ),
             borderRadius: BorderRadius.all(Radius.circular(12))),
         child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
           getAmountTextInput, getButton
         ])),
    );
 }
  Widget get getAmountTextInput => Padding(
    padding: const EdgeInsets.all(12.0),
    child: Container(
      width: 200,
      child: TextFormField(
        onChanged: _bloc.changeLimit,
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
            labelText: 'Party budget limit',
            contentPadding: EdgeInsets.all(10)),
        keyboardType: TextInputType.number,
        inputFormatters: [
          WhitelistingTextInputFormatter.digitsOnly
        ],
      ),
    ),
  );

  Widget get getButton => Padding(
    padding: const EdgeInsets.all(8.0),
    child: FlatButton(
      onPressed: () {
        _bloc.addBudget(widget.partyID);
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      color: appColors['buttons_orange'],
      hoverColor:  appColors['buttons_orange'],
      child: Text(appStrings['next']),
    ),
  );
}