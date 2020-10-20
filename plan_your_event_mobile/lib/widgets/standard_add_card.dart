import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StandardAddCard extends StatelessWidget {
  const StandardAddCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> preferencesList = List<Widget>();
    return Padding(
      padding: const EdgeInsets.only(left: 19, right: 19, top: 25.0, bottom: 25.0),
      child: Container(
        height: 90,
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
                  )))),
    );
  }
}
