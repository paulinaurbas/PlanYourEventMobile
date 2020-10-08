import 'package:flutter/material.dart';
import 'package:planyoureventmobile/enums/guest_groups.dart';
import 'package:planyoureventmobile/models/food_preferences.dart';
import 'package:planyoureventmobile/models/guest.dart';
import 'package:planyoureventmobile/routes/routes.dart';
import 'package:planyoureventmobile/screens/registration/welcome_screen.dart';
import 'package:planyoureventmobile/styling/colors.dart';
import 'package:planyoureventmobile/widgets/plan_your_event_card.dart';
import 'package:planyoureventmobile/widgets/standard_add_card.dart';
import 'package:planyoureventmobile/widgets/standard_rectangular_conctact_card.dart';
import 'package:google_fonts/google_fonts.dart';

import 'models/person.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: customRoutes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.ruluko().fontFamily,
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'Plan your event app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Guest ciocia = Guest(person: Person(
    name: 'Ciocia',
    surname: 'Viola',
    phoneNumber: '+48 92378240',
    email: 'ciocia.viola@gmail.com',
      ),
      foodPreferences: FoodPreferences(
        lactose: false,
        gluten:  false,
        meat:  false,
        seaFood:  false,
        vegan:  true,
        nuts:  false,
        eggs: false,
        fish: false,
      ),
      guestType: GuestType.FAMILY);

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WelcomeScreen();
  }
}
