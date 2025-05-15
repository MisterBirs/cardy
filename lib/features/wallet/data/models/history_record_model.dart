import 'package:cardy/features/wallet/data/models/user_item_model.dart';
import 'package:cardy/features/history_records/domain/entities/history_record_entity.dart';

class HistoryRecordModel {
  final HistoryRecordType _type;
  final UserItemModel _item;
  final DateTime _date;

  const HistoryRecordModel({
    required HistoryRecordType type,
    required UserItemModel item,
    required DateTime date,
  })  : _type = type,
        _item = item,
        _date = date;

  get type => _type;
  get item => _item;
  get date => _date;
}
