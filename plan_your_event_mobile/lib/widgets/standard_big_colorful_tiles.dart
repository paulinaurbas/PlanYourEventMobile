
import 'package:flutter/cupertino.dart';

class StandardBigColorfulTiles extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String title;

  const StandardBigColorfulTiles({Key key, this.color, this.icon, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 124,
        height: 111,
        decoration: BoxDecoration(
            color: color,
            border: Border.all(
              color:color,
            ),
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Icon(
                  icon,
                  size: 50,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 13),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );

  }
}