import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SupliersInformationRow extends StatelessWidget {
  final IconData icon;
  final String title;

  SupliersInformationRow({this.icon, this.title});

  @override
  Widget build(BuildContext context) {
  return title != null ? Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Icon(icon,
     ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(title),
      ),
    ],
  ) : Container();
  }



}