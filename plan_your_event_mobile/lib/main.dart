import 'package:flutter/material.dart';
import 'package:planyoureventmobile/repository/add_party_repository.dart';
import 'package:planyoureventmobile/repository/auth_repository.dart';
import 'package:planyoureventmobile/routes/routes.dart';
import 'package:planyoureventmobile/screens/main/home_screen.dart';
import 'package:planyoureventmobile/screens/registration/welcome_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


void main() => runApp(MultiProvider(
  providers: [
    ChangeNotifierProvider(create: (context) => AuthRepository(),),
    ChangeNotifierProvider(create: (context) => AddPartyRepository(),),
  ],
  child: MyApp(),
));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plan your party app',
      initialRoute: '/',
      routes: customRoutes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.ruluko().fontFamily,
        primarySwatch: Colors.orange,
      ),
      home: Consumer<AuthRepository> (
        builder: (context, notifier, child){
          return notifier.getUser != null ? HomeScreen() : WelcomeScreen();
        }
      )
    );
  }
}