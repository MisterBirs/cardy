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
      AddHistoryRecordEntity() => HistoryRecordModel.add(
          date: entity.date,
        ),
      EditHistoryRecordEntity() => HistoryRecordModel.edit(
          date: entity.date,
        ),
      ExpiredHistoryRecordEntity() => HistoryRecordModel.expired(
          date: entity.date,
          expiredAt: entity.expiredAt,
        ),
      PaymentHistoryRecordEntity() => HistoryRecordModel.payment(
          date: entity.date,
          paymentAmount: entity.paymentAmount,
          redeemedAtId: entity.redeemedAtId.id,
        ),
      ReloadHistoryRecordEntity() => HistoryRecordModel.reload(
          date: entity.date,
          reloadedAmount: entity.reloadedAmount,
        ),
      RemoveHistoryRecordEntity() => HistoryRecordModel.remove(
          date: entity.date,
        ),
      UsedUpHistoryRecordEntity() => HistoryRecordModel.usedUp(
          date: entity.date,
        ),
    };
  }

  
  factory HistoryRecordModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryRecordModelFromJson(json);
}
