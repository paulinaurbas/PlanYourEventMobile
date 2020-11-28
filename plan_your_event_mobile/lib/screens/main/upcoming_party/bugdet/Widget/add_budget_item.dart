import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planyoureventmobile/bloc/documents_bloc.dart';
import 'package:planyoureventmobile/models/document_model.dart';
import 'package:planyoureventmobile/styling/colors.dart';
import 'package:planyoureventmobile/styling/dictionary.dart';


class AddBugdetRow extends StatefulWidget {
  final String partyId;
 // final DocumentsBloc bloc;

  const AddBugdetRow({Key key, this.partyId, }) : super(key: key);

  @override
  _AddBugdetRowState createState() => _AddBugdetRowState();
}

class _AddBugdetRowState extends State<AddBugdetRow> {
  //DocumentsBloc _bloc;

  @override
  void initState() {
    super.initState();
   // _bloc = widget.bloc;
  }

  String documentInsert;
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
          title: Text("Add new document"),
          content: getPopUpContent,
          actions: <Widget>[
            FlatButton(
              child: Text(appStrings["close"]),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text(appStrings["addNewDocument"], textAlign: TextAlign.center,),
              onPressed: () {
               // _bloc.addDocuments(widget.partyId, documentInsert);
               // _bloc.refreshRepo(widget.partyId);
                Navigator.pop(context);
              },
            ),
          ],
        ));
  }

  Widget get getPopUpContent => TextField(
    autofocus: true,
    onChanged: (input) {
      documentInsert = input;
    },
    decoration: new InputDecoration(
      labelText: appStrings['documentDescription'],
    ),
  );
}
