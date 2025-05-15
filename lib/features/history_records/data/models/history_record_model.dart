import 'package:cardy/features/history_records/domain/entites/history_record_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_record_model.freezed.dart';
part 'history_record_model.g.dart';

@freezed
sealed class HistoryRecordModel with _$HistoryRecordModel {
  const HistoryRecordModel._();

  const factory HistoryRecordModel.add({
    required DateTime date,
  }) = AddHistoryRecordModel;

  const factory HistoryRecordModel.edit({
    required DateTime date,
  }) = EditHistoryRecordModel;

  const factory HistoryRecordModel.expired({
    required DateTime date,
    required DateTime expiredAt,
  }) = ExpiredHistoryRecordModel;

  const factory HistoryRecordModel.payment({
    required DateTime date,
    required double paymentAmount,
    required String redeemedAtId,
  }) = PaymentHistoryRecordModel;

  const factory HistoryRecordModel.reload({
    required DateTime date,
    required double reloadedAmount,
  }) = ReloadHistoryRecordModel;

  const factory HistoryRecordModel.remove({
    required DateTime date,
  }) = RemoveHistoryRecordModel;

  const factory HistoryRecordModel.usedUp({
    required DateTime date,
  }) = UsedUpHistoryRecordModel;

  factory HistoryRecordModel.fromEntity(HistoryRecordEntity entity) {
    return switch (entity) {
      AddHistoryRecord() => HistoryRecordModel.add(
          date: entity.date,
        ),
      EditHistoryRecord() => HistoryRecordModel.edit(
          date: entity.date,
        ),
      ExpiredHistoryRecord() => HistoryRecordModel.expired(
          date: entity.date,
          expiredAt: entity.expiredAt,
        ),
      PaymentHistoryRecord() => HistoryRecordModel.payment(
          date: entity.date,
          paymentAmount: entity.paymentAmount,
          redeemedAtId: entity.redeemedAt.id,
        ),
      ReloadHistoryRecord() => HistoryRecordModel.reload(
          date: entity.date,
          reloadedAmount: entity.reloadedAmount,
        ),
      RemoveHistoryRecord() => HistoryRecordModel.remove(
          date: entity.date,
        ),
      UsedUpHistoryRecord() => HistoryRecordModel.usedUp(
          date: entity.date,
        ),
    };
  }

  factory HistoryRecordModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryRecordModelFromJson(json);
}
