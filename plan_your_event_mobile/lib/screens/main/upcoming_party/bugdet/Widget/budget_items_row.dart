
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planyoureventmobile/bloc/documents_bloc.dart';
import 'package:planyoureventmobile/models/document_model.dart';
import 'package:planyoureventmobile/styling/colors.dart';

class DocumentRowItem extends StatefulWidget{
  final Document document;
  final DocumentsBloc documnetBloc;

  DocumentRowItem(this.document, this.documnetBloc);

  @override
  _DocumentRowItemState createState() => _DocumentRowItemState();
}

class _DocumentRowItemState extends State<DocumentRowItem> {
  DocumentsBloc documentsBloc;

  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    documentsBloc = widget.documnetBloc;
    isChecked = widget.document.isDone;
  }

  @override
  Widget build(BuildContext context) {
    return widget.document.documentItem != null ? Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 8, 8, 8.0),
          child: Container(
              width: 266,
              height: 60,
              decoration: BoxDecoration(
                  color:  Colors.white,
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: Center(child: Text(widget.document.documentItem))),
        ),
      ],
    ) : Container();
  }
}