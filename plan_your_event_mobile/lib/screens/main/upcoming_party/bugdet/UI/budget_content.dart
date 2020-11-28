import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planyoureventmobile/bloc/documents_bloc.dart';
import 'package:planyoureventmobile/models/document_model.dart';
import 'package:planyoureventmobile/screens/main/upcoming_party/bugdet/Widget/add_budget_item.dart';
import 'package:planyoureventmobile/screens/main/upcoming_party/bugdet/Widget/card_with_progress.dart';
import 'package:planyoureventmobile/screens/main/upcoming_party/documents/Widget/add_documents_row.dart';
import 'package:planyoureventmobile/screens/main/upcoming_party/documents/Widget/documents_row_item.dart';
import 'package:planyoureventmobile/styling/dictionary.dart';
import 'package:planyoureventmobile/widgets/plan_your_event_card.dart';

import 'add_new_budget_content.dart';

class BudgetContent extends StatefulWidget {
  final String partyID;
  const BudgetContent({
    Key key, this.partyID
  }) : super(key: key);

  @override
  _BudgetContentState createState() => _BudgetContentState();
}

class _BudgetContentState extends State<BudgetContent> {
  DocumentsBloc _bloc = DocumentsBloc();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Column(
          children: [
            getBudgetStream
          ],
        )
      ]),
    );
  }



  Widget get getBudgetStream {
    return StreamBuilder<List<Document>>(
      stream: _bloc.documentsList.stream,
      builder: (context, AsyncSnapshot<List<Document>> snapshot) {
        if (snapshot.data != null) {
          return Column(
            children: [
              getItemsBudgetStream
            ],
          );
        } else {
          return AddNewBudgetContent(partyID: widget.partyID,);
        }
      }
    );
  }



  Widget get getItemsBudgetStream {
    return StreamBuilder<List<Document>>(
      stream: _bloc.documentsList.stream,
      builder: (context, AsyncSnapshot<List<Document>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data != null) {
            return Column(
              children: [
                BudgetProgressCard(
                  height: 180,
                  width: 300,
                  title: appStrings['budget'],
                ),
                Column(
                  children: _buildDocumentsListWidget(snapshot.data),
                ),
              ],
            );
          } else if (snapshot.data.isEmpty) {
            return Container();
          } else {
            return Container();
          }
        } else if (snapshot.hasError) {
          return Container();
        } else if (snapshot.data == null || snapshot.data.isEmpty) {
          return AddBugdetRow(partyId: widget.partyID);
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
    allTiles.add(AddBugdetRow(partyId: widget.partyID,));
    return allTiles;
  }

}