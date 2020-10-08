import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planyoureventmobile/bloc/auth_bloc.dart';
import 'package:planyoureventmobile/datasources/auth/auth_servce.dart';
import 'package:planyoureventmobile/styling/colors.dart';
import 'package:planyoureventmobile/styling/dictionary.dart';
import 'package:planyoureventmobile/styling/gradient_bar.dart';
import 'package:planyoureventmobile/widgets/plan_your_event_card.dart';
import 'package:planyoureventmobile/widgets/standard_small_tiles.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AuthBloc _authBloc = AuthBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors['backgroud_color'],
      drawer: getDrawer,
      appBar: AppBar(
        centerTitle: true,
        title: Text(appStrings['planEvent']),
        flexibleSpace: getGradientBar,
      ),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Column(children: [
            PlanYourEventCard(pictureName: 'assets/images/party_welocome.png', height: 218, width: 300, title:  appStrings['letsStart'] ,),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 29.0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(appStrings['planEvent'], style: TextStyle(fontSize: 23), )),
            ),
            SmallPartyScrollTiles(),
          ]),
        ),
      ),
    );
  }

  Widget get getDrawer {
    return Theme(
        data: Theme.of(context).copyWith(
          canvasColor: appColors['backgroud_color'],
          splashColor: appColors['gradinet_bright_color'],
    ),
     child: Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 100.0,
            child: DrawerHeader(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0, left: 0),
                    child: Icon(Icons.person_outline,
                    size: 28,),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Paulina', style: TextStyle(fontSize:  20),),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: appColors['drawerOrange'],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.access_alarm),
            title: Text(appStrings['nextParty']),
            onTap: () {
            },
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text(appStrings['createNewParty']),
            onTap: () {
            },
          ),
          ListTile(
            leading: Icon(Icons.people_outline),
            title: Text(appStrings['guests']),
            onTap: () {

            },
          ),
          ListTile(
            leading: Icon(Icons.av_timer),
            title: Text(appStrings['pastParties']),
            onTap: () {
            },
          ),
          ListTile(
            leading: Icon(Icons.arrow_back),
            title: Text(appStrings['logOut']),
            onTap: () async {
              await _authBloc.auth.signOut();
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);

            },
          ),
        ],
      ),
     )
    );
  }
}
