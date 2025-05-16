part of 'diagram_bloc.dart';

abstract class DiagramEvent {
  const DiagramEvent();
}

class DiagramInitialEvent extends DiagramEvent {
  const DiagramInitialEvent();
}

class DiagramInitEditExpenseEvent extends DiagramEvent {
  final ExpenseModel expense;

  DiagramInitEditExpenseEvent({required this.expense});
}

class DiagramEditExpenseEvent extends DiagramEvent {
  final int expenseId;
  final int categoryId;
  final double totalCount;
  final DateTime date;

  DiagramEditExpenseEvent({
    required this.expenseId,
    required this.categoryId,
    required this.totalCount,
    required this.date,
  });
}

class DiagramDeleteExpenseEvent extends DiagramEvent {
  final int expenseId;

  DiagramDeleteExpenseEvent({required this.expenseId});
}

class DiagramSelectTypeViewEvent extends DiagramEvent {
  final int type;

  DiagramSelectTypeViewEvent({required this.type});
}

class DiagramSetCustomPeriodEvent extends DiagramEvent {
  final DateTime dateFrom;
  final DateTime dateTo;

  DiagramSetCustomPeriodEvent({
    required this.dateFrom,
    required this.dateTo,
  });
}
