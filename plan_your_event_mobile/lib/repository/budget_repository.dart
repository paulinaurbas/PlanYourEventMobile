import 'package:flutter/cupertino.dart';
import 'package:planyoureventmobile/datasources/budget/budget_api_provider.dart';
import 'package:planyoureventmobile/datasources/to_do/to_do_api_provider.dart';
import 'package:planyoureventmobile/enums/to_do_categories.dart';
import 'package:planyoureventmobile/models/budget_model.dart';
import 'package:planyoureventmobile/models/to_do_item.dart';
import 'package:planyoureventmobile/models/to_do_status.dart';

class BudgetRepository with ChangeNotifier {
  final _budgetApiProvider = BudgetApiProvider();

  Future <String> addBudget(Budget budget) => _budgetApiProvider.addBudget(budget);


}