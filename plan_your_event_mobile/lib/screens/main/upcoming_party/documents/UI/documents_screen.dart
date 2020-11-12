import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/User/Documents/GitHub/PlanYourEventMobile/plan_your_event_mobile/lib/screens/main/upcoming_party/documents/UI/documents_content.dart';
import 'package:planyoureventmobile/styling/colors.dart';
import 'package:planyoureventmobile/styling/dictionary.dart';
import 'package:planyoureventmobile/styling/gradient_bar.dart';


class DocumentsScreen extends StatelessWidget {
  final String partyType;

  const DocumentsScreen({Key key, this.partyType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final partyId = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: appColors['backgroud_color'],
      appBar: AppBar(
        centerTitle: true,
        title: Text(appStrings['documents']),
        flexibleSpace: getGradientBar,
      ),
      body: DocumentsContent(partyID: partyId, ),
    );
  }
}