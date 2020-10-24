
import 'package:flutter/cupertino.dart';

class StandardBigColorfulTiles extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String title;
  final double width;
  final double height;
  final double iconSize;
  final double padding;

  const StandardBigColorfulTiles({Key key, this.color, this.icon, this.title, this.width, this.height, this.iconSize, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding == null ? 10.0: padding),
      child: Container(
        width: width == null ? 124 : width,
        height: height == null ? 111 : height,
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
                  size: iconSize == null ?  50 : iconSize,
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