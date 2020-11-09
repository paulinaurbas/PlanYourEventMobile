
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planyoureventmobile/styling/colors.dart';
import 'package:planyoureventmobile/styling/dictionary.dart';

class FoodPreferencesTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool border;

  const FoodPreferencesTile({Key key, this.icon, this.title, this.border}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0, right: 4.0, top: 4),
      child: Container(
        width: 70,
        height: 80,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: border == null ? Colors.white : Colors.black,
            ),
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Icon(
                icon,
                size: 40,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(
                  title,
                  style: TextStyle(fontSize: 13),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }
}