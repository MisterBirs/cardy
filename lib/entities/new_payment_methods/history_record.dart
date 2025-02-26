import 'package:cardy/entities/new_payment_methods/payment_item.dart';

class HistoryRecord {
  final HistoryRecordType type;
  final PaymentItem item;
  final DateTime date;

  HistoryRecord({
    required this.type,
    required this.item,
    required this.date,
  });
}

enum HistoryRecordType {
  add,
  remove,
  update,
}
