import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planyoureventmobile/bloc/auth_bloc.dart';
import 'package:planyoureventmobile/enums/auth_mode.dart';
import 'package:planyoureventmobile/repository/auth_repository.dart';
import 'package:planyoureventmobile/styling/colors.dart';
import 'package:planyoureventmobile/styling/dictionary.dart';
import 'package:planyoureventmobile/utils/standard_error_hanler.dart';
import 'package:provider/provider.dart';

class LoginContent extends StatefulWidget {

  const LoginContent({Key key }) : super(key: key);

  @override
  _LoginContentState createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {
  bool isLogin = true;
  AuthBloc _bloc = AuthBloc();
  AuthMode _authMode = AuthMode.LOGIN;
  String email = '';
  String password = '';


  @override
  void initState() {
    AuthRepository authRepository = Provider.of<AuthRepository>(context, listen: false);
    _bloc.auth.initializeCurrentUser(authRepository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.all(Radius.circular(12))),
        height: isLogin ? 255 : 300,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(isLogin? appStrings['login'] : appStrings['register'], style: TextStyle(
                    fontSize: 20, color: appColors['dark_orange']
                  ),),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: OutlineButton(
                      hoverColor: appColors['gradinet_bright_color'],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      onPressed: (){
                        setState((){
                          isLogin = !isLogin;
                          Scaffold.of(context).removeCurrentSnackBar(); 
                        });
                      },
                      borderSide: BorderSide(
                          color:  appColors['buttons_orange'], style: BorderStyle.solid,
                          width: 1
                      ),
                      color: appColors['buttons_orange'],
                      highlightedBorderColor: appColors['gradinet_bright_color'],
                      splashColor: appColors['gradinet_bright_color'],
                      child: Text(isLogin? appStrings['register'] : appStrings['login'],),
                    ),
                  ),
                ],
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Password'),
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                    ),
                    onPressed: () async {
                      _submitForm();
                      },
                    color: appColors['buttons_orange'],
                    splashColor: appColors['gradinet_bright_color'],
                    child: Text(isLogin ? appStrings['login'] : appStrings['register'] ),
                  ),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm(){
    dynamic result;
    try {
     AuthRepository _authRepository = Provider.of<AuthRepository>(context, listen: false);
     if(_authMode == AuthMode.LOGIN){
       _bloc.auth.signInWithEmailAndPassword(email, password, _authRepository);
     }
    } catch(e){
      String message = errorHandler(e);
      displaySnackbar(context, message);
    }

  }

  String errorHandler (dynamic e){
    String message = appStrings["smtWentWrong"];
    if(e.toString().contains("Given String is empty or null")){
      message = appStrings["wrongEmail"];
    } else if (e.toString().contains("The password is invalid or the user does not have a password.")) {
      message = appStrings["wrongPassword"];
    } else if(e.toString().contains("The given password is invalid.")){
      message = appStrings["weakPassword"];
    } else if(e.toString().contains("The email address is already in use by another account.")){
      message = appStrings["emailAlreadyRegister"];
    } else if(e.toString().contains("There is no user record corresponding to this identifier. The user may have been deleted.")) {
      message = appStrings["userNotRegister"];
    }
    return message;
  }
}
