import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planyoureventmobile/bloc/documents_bloc.dart';
import 'package:planyoureventmobile/bloc/menu_bloc.dart';
import 'package:planyoureventmobile/bloc/party_bloc.dart';
import 'package:planyoureventmobile/bloc/suppliers_bloc.dart';
import 'package:planyoureventmobile/models/document_model.dart';
import 'package:planyoureventmobile/models/menu.dart';
import 'package:planyoureventmobile/models/supplier_model.dart';
import 'package:planyoureventmobile/screens/main/upcoming_party/documents/Widget/add_documents_row.dart';
import 'package:planyoureventmobile/screens/main/upcoming_party/documents/Widget/documents_row_item.dart';
import 'package:planyoureventmobile/screens/main/upcoming_party/menu/widgets/menu_card.dart';
import 'package:planyoureventmobile/screens/main/upcoming_party/supliers/widgets/supliers_card.dart';
import 'package:planyoureventmobile/styling/dictionary.dart';
import 'package:planyoureventmobile/widgets/plan_your_event_card.dart';
import 'package:planyoureventmobile/widgets/standard_add_card.dart';

class DocumentsContent extends StatefulWidget {
  final String partyID;
  const DocumentsContent({
    Key key, this.partyID
  }) : super(key: key);

  @override
  _DocumentsContentState createState() => _DocumentsContentState();
}

class _DocumentsContentState extends State<DocumentsContent> {
  DocumentsBloc _bloc = DocumentsBloc();
  @override
  void initState() {
    super.initState();
    _bloc.getPartyDocuments(widget.partyID);
    _bloc.supplierListStream.listen((event) {
      if(mounted){
        setState(() {});
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        PlanYourEventCard(
          pictureName: 'assets/images/doc.png',
          height: 180,
          width: 300,
          title: appStrings['documents'],
        ),
        Column(
          children: [
            getGuestStream
          ],
        )
      ]),
    );
  }

  Widget get getGuestStream {
    return StreamBuilder<List<Document>>(
      stream: _bloc.documentsList.stream,
      builder: (context, AsyncSnapshot<List<Document>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data != null) {
            return Column(
              children: _buildDocumentsListWidget(snapshot.data),
            );
          } else if (snapshot.data.isEmpty) {
            return AddDocumentRow(partyId: widget.partyID);
          } else {
            return AddDocumentRow(partyId: widget.partyID);
          }
        } else if (snapshot.hasError) {
          return Container();
        } else if (snapshot.data == null || snapshot.data.isEmpty) {
          return AddDocumentRow(partyId: widget.partyID);
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  List<Widget> _buildDocumentsListWidget(List<Document> data) {
    List<Widget> allTiles = [];
    data.forEach((element) {
      allTiles.add(DocumentRowItem(element, _bloc));
    });
    allTiles.add(AddDocumentRow(partyId: widget.partyID, bloc: _bloc,));
    return allTiles;
  }

}