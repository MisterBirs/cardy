import 'package:cardy/entities/payment_methods/payment_item_entity.dart';

class HistoryRecordEntity {
  
  //#region Attributes
  final HistoryRecordType type;
  final PaymentItemEntity item;
  final DateTime date;
  //#endregion

  //#region Constructor
  HistoryRecordEntity({
    required this.type,
    required this.item,
    required this.date,
  });
  //#endregion

}

enum HistoryRecordType {
  add,
  remove,
  update,
}
