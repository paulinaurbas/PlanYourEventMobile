import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlanYourEventCard extends StatelessWidget {
  final String title;
  final String pictureName;
  final double width;
  final double height;

  const PlanYourEventCard({Key key, this.title, this.pictureName, this.width, this.height}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 19, right: 19, top: 25.0, bottom: 25.0),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.all(Radius.circular(12))),
          child: Expanded(
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 15, 10, 0),
                    child: Text(title, style: TextStyle(
                      fontSize: 25,
                    ),
                    ),
                  ),
                ),
                Align(
                 alignment: Alignment.center,
                  child: Container(
                      height: height,
                      width: width,
                      child: Image.asset(pictureName)))
              ],
            ),
      )

      ),
    );
  }

}