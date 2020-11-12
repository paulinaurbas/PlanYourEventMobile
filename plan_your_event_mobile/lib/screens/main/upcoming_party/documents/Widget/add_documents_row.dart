import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planyoureventmobile/bloc/documents_bloc.dart';
import 'package:planyoureventmobile/models/document_model.dart';
import 'package:planyoureventmobile/styling/colors.dart';
import 'package:planyoureventmobile/styling/dictionary.dart';


class AddDocumentRow extends StatefulWidget {
  final String partyId;

  const AddDocumentRow({Key key, this.partyId}) : super(key: key);

  @override
  _AddDocumentRowState createState() => _AddDocumentRowState();
}

class _AddDocumentRowState extends State<AddDocumentRow> {
  DocumentsBloc _bloc = DocumentsBloc();
  String documentInsert;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showCupertinoDialog(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 266,
            height: 60,
            decoration: BoxDecoration(
                color: appColors["documents_background"],
                border: Border.all(
                  color: appColors["documents_background"],
                ),
                borderRadius: BorderRadius.all(Radius.circular(12))),
            child: Icon(
                Icons.add
            ),
          ),
          Icon(
            Icons.check_circle_outline,
            color: Colors.transparent,
          ),
        ],
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
                _bloc.addDocuments(widget.partyId, documentInsert);
                Navigator.pushNamed(context, '/Documents',
                    arguments: widget.partyId);
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
