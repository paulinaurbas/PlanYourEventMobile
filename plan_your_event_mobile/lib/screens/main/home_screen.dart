import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planyoureventmobile/bloc/auth_bloc.dart';
import 'package:planyoureventmobile/bloc/party_bloc.dart';
import 'package:planyoureventmobile/models/event_model.dart';
import 'package:planyoureventmobile/my_flutter_app_icons.dart';
import 'package:planyoureventmobile/repository/auth_repository.dart';
import 'package:planyoureventmobile/screens/main/upcoming_party/screens/upcoming_party_content.dart';
import 'package:planyoureventmobile/styling/colors.dart';
import 'package:planyoureventmobile/styling/dictionary.dart';
import 'package:planyoureventmobile/styling/gradient_bar.dart';
import 'package:planyoureventmobile/widgets/plan_your_event_card.dart';
import 'package:planyoureventmobile/widgets/standard_small_tiles.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AuthBloc _authBloc = AuthBloc();
  PartyBloc _partyBloc = PartyBloc();
  AuthRepository _authRepository;
  FirebaseUser user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: getDrawer,
     appBar: AppBar(
        centerTitle: true,
        title: Text(appStrings['planEvent']),
        flexibleSpace: getGradientBar,
       bottomOpacity: 0.0,
       elevation: 0.0,
      ),
      body: getGuestStream
    );
  }

  Widget get getGuestStream {
    return StreamBuilder<List<Event>>(
      stream: _partyBloc.userParties.stream,
      builder: (context, AsyncSnapshot<List<Event>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data != null && snapshot.data.length > 0) {
            return  Column(children: [DisplayUpcomingPartyContent(event: snapshot.data.first)],);
          } else if (snapshot.data.isEmpty) {
            return getNoPartiesScreen;
          } else {
            return getNoPartiesScreen;
          }
        } else if (snapshot.hasError) {
          return getNoPartiesScreen;
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _authRepository = Provider.of<AuthRepository>(context, listen: false);
    _partyBloc.getParties();
    user = _authRepository.getUser;

  }

  Widget get getNoPartiesScreen => SingleChildScrollView(
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
  );

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
                    child: Text(user.email, style: TextStyle(fontSize:  15,)),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: appColors['drawer_orange'],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text(appStrings['createNewParty']),
            onTap: () {
              Navigator.pushNamed(context, '/CreateParty');
            },
          ),
          ListTile(
            leading: Icon(MyFlutterApp.group),
            title: Text(appStrings['guests']),
            onTap: () {
              Navigator.pushNamed(context, '/GuestGroupScreen', arguments: null);
            },
          ),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text(appStrings['about']),
            onTap: () {
              showAboutDialog(context: context,
                  applicationName: "Plan your event",
                  applicationVersion: "version 2.0",
                  useRootNavigator: true,
                  children: <Widget> [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(appStrings['aboutAppResources']),
                          ),
                        ],
                      ),
                    )
                  ]
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.arrow_back),
            title: Text(appStrings['logOut']),
            onTap: () async {
              AuthRepository _authRepository = Provider.of<AuthRepository>(context, listen: false);
              await _authBloc.auth.signOut(_authRepository);
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            },
          ),
        ],
      ),
     )
    );
  }

}
