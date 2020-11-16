import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusSmallBar extends StatelessWidget{
  final Color color;
  final String title;
  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: isChecked ? color : Colors.white,
          border: Border.all(
            color: color,
          ),
          borderRadius: BorderRadius.all(Radius.circular(12))),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(title, textAlign: TextAlign.center,),
    ),
    );
  }

  StatusSmallBar(this.color, this.title, this.isChecked);
}