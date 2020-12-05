
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planyoureventmobile/bloc/budget_bloc.dart';
import 'package:planyoureventmobile/bloc/documents_bloc.dart';
import 'package:planyoureventmobile/models/budget_model.dart';
import 'package:planyoureventmobile/models/bugdet_item_model.dart';
import 'package:planyoureventmobile/models/document_model.dart';
import 'package:planyoureventmobile/styling/colors.dart';

class BudgetRowItem extends StatefulWidget{
  final BudgetItem budgetItem;
  final BudgetBloc budgetBloc;

  BudgetRowItem(this.budgetItem, this.budgetBloc);

  @override
  _BudgetRowItemState createState() => _BudgetRowItemState();
}

class _BudgetRowItemState extends State<BudgetRowItem> {
  BudgetBloc budgetBloc;

  @override
  void initState() {
    super.initState();
    budgetBloc = widget.budgetBloc;
  }

  @override
  Widget build(BuildContext context) {
    return widget.budgetItem.budgetItem != null ? Padding(
      padding: const EdgeInsets.only(left: 19, right: 19, top: 5.0, bottom: 5.0),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color:  Colors.white,
            ),
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.budgetItem.price.toString() + ' PLN'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.budgetItem.budgetItem),
            ),

          ],
        ),
      ),
    ) : Container();
  }
}