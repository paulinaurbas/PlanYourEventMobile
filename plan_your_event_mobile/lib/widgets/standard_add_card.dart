import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StandardAddCard extends StatelessWidget {
  const StandardAddCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> preferencesList = List<Widget>();
    return Container(
        height: 90,
        width: 338,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Align(
            child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  borderRadius: new BorderRadius.all(new Radius.circular(16.0)),
                  border: new Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                child: ClipOval(
                  child: Icon(
                    Icons.add,
                    size: 25,
                  ),
                ))));
  }
}
