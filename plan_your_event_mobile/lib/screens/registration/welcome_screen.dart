import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planyoureventmobile/styling/colors.dart';
import 'package:planyoureventmobile/styling/dictionary.dart';
import 'package:planyoureventmobile/widgets/plan_your_event_card.dart';

import 'login_content.dart';

class WelcomeScreen extends StatefulWidget{

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}
class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors['backgroud_color'],
      appBar: AppBar(
        leading: Container(),
        centerTitle: true,
        title: Text(appStrings['welcome']),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    appColors['gradinet_dark_color'],
                    appColors['gradinet_bright_color'],
                  ])
          ),
        ),
      ),
      body: SingleChildScrollView(
        child:  GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                    height: 260,
                    width: 338,
                    child: Image.asset('assets/images/welcome.jpg'),)),
              Padding(
                padding: const EdgeInsets.all(8.0),
               child: LoginContent(),
          ),
     ] ),
        ),
    ),
    );
  }

}