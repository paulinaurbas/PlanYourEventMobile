
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:planyoureventmobile/styling/colors.dart';
import 'package:planyoureventmobile/styling/dictionary.dart';
import 'package:planyoureventmobile/widgets/standard_small_tiles.dart';

class BudgetProgressCard extends StatefulWidget {
  final String title;
  final double width;
  final double height;

  const BudgetProgressCard({Key key, this.title, this.width, this.height}) : super(key: key);

  @override
  _BudgetProgressCardState createState() => _BudgetProgressCardState();
}

class _BudgetProgressCardState extends State<BudgetProgressCard> {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 10, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.title, style: TextStyle(
                        fontSize: 23,
                      ),
                      ),
                    ),
                    Text(appStrings['budgetDescription'], style: TextStyle(fontSize: 15),)
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        getProgressBar,
                        getRowWithSpentMoney,
                        getRowWithMoney
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30,),
            ],
          )

      ),
    );
  }
  Widget get getProgressBar{
    return LinearPercentIndicator(
      width: MediaQuery.of(context).size.width - 100,
      lineHeight: 37.0,
      percent: 0.5,
      backgroundColor: Colors.grey,
      progressColor: appColors["dark_oragne"],
    );
  }
  Widget get getRowWithSpentMoney{
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        width: MediaQuery.of(context).size.width - 60,
        child: Row(
          children: [
            Spacer(flex: 1),
            Expanded(
                flex: 5,
                child: Text(appStrings['youSpent'])),
            Spacer(flex: 16),
            Expanded(
                flex: 4,
                child: Text(appStrings['limit'])),
          ],
        ),
      ),
    );
}
  Widget get getRowWithMoney{
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        width: MediaQuery.of(context).size.width - 60,
        child: Row(
          children: [
            Spacer(flex: 1),
            Expanded(
                flex: 5,
                child: Text('50')),
            Spacer(flex: 16),
            Expanded(
                flex: 4,
                child: Text('40')),
          ],
        ),
      ),
    );
  }
}