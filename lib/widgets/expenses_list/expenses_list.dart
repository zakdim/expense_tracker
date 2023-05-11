import 'package:flutter/material.dart';

import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;
  final void Function(Expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenses[index]),
        background: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.error.withOpacity(0.25),
            borderRadius: const BorderRadius.all(
              Radius.circular(11),
            ),
          ),
          // color: Theme.of(context).colorScheme.error.withOpacity(0.25),
          margin: const EdgeInsets.symmetric(
            // horizontal: Theme.of(context).cardTheme.margin!.horizontal,
            horizontal: 16,
            vertical: 8,
          ),
        ),
        onDismissed: (direction) => onRemoveExpense(expenses[index]),
        child: ExpenseItem(expenses[index]),
      ),
    );
  }
}
