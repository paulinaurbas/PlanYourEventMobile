import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:planyoureventmobile/bloc/budget_bloc.dart';
import 'package:planyoureventmobile/models/budget_model.dart';
import 'package:planyoureventmobile/styling/dictionary.dart';

class AddBugdetRow extends StatefulWidget {
  final String partyId;
  final Budget budget;
  final BudgetBloc bloc;

  const AddBugdetRow({Key key, this.partyId, this.bloc, this.budget, }) : super(key: key);

  @override
  _AddBugdetRowState createState() => _AddBugdetRowState();
}

class _AddBugdetRowState extends State<AddBugdetRow> {
  BudgetBloc _bloc;

  @override
  void initState() {
    super.initState();
   _bloc = widget.bloc;
  }

  String documentInsert;
  String price;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showCupertinoDialog(),
      child: Padding(
        padding: const EdgeInsets.only(left: 19, right: 19, top: 25.0, bottom: 25.0),
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color:  Colors.white,
              ),
              borderRadius: BorderRadius.all(Radius.circular(12))),
          child: Icon(
              Icons.add
          ),
        ),
      ),
    );
  }

  _showCupertinoDialog() {
    showDialog(
        context: context,
        builder: (_) =>  AlertDialog(
          title: Text(appStrings["addNewBudget"]),
          content: getPopUpContent,
          actions: <Widget>[
            FlatButton(
              child: Text(appStrings["close"]),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text(appStrings["addNewBudget"], textAlign: TextAlign.center,),
              onPressed: () {
                if(widget.partyId != null && documentInsert != null && price != null) {
                  _bloc.addBudgetItem(widget.partyId, documentInsert, price, widget.budget);
                  }
                Navigator.of(context).pop();
              },
            ),
          ],
        ));
  }

  Widget get getPopUpContent => Column(
    children: [
      TextField(
      autofocus: true,
      onChanged: (input) {
        documentInsert = input;
      },
      decoration: new InputDecoration(
        labelText: appStrings['budgetItemDescription'],
      ),
    ),
      Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: TextField(
          autofocus: true,
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          onChanged: (input) {
            price = input;
          },
          decoration: new InputDecoration(
            labelText: appStrings['price'],
          ),
        ),
      ),
  ]);
}
