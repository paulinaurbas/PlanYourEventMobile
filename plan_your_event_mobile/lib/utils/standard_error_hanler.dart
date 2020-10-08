
import 'package:flutter/material.dart';

void displaySnackbar(context, String message){
  final snackBar = SnackBar(content: Text(message),);
  Scaffold.of(context).showSnackBar(snackBar);
}

