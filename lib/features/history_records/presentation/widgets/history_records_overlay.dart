import 'package:cardy/core/presentation/ui_constants.dart';
import 'package:cardy/features/history_records/domain/entites/history_record_entity.dart';
import 'package:cardy/core/presentation/widgets/gradient_button.dart';
import 'package:cardy/core/presentation/widgets/overlay_builder.dart';
import 'package:cardy/features/history_records/presentation/view_models/history_record_view_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryRecordsOverlay {
  static final HistoryRecordsOverlay _instance =
      HistoryRecordsOverlay._privateConstructor();

  HistoryRecordsOverlay._privateConstructor();

  factory HistoryRecordsOverlay.instance() {
    return _instance;
  }

  void show({
    required BuildContext context,
    required List<HistoryRecordEntity> historyRecordsList,
  }) {
    OverlayBuilder(builder: (closeOverlay) {
      return LayoutBuilder(builder: (context, constraints) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Container(
            padding: EdgeInsets.only(top: PADDING_FROM_TOP_SCREEN),
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.8,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                Text('היסטורית פעולות',
                    style: Theme.of(context).textTheme.headlineMedium),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Column(
                            children: historyRecordsList.reversed.map((record) {
                              return HistoryRecordTile(
                                recordEntity: record,
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return GradientButton(
                        width: constraints.maxWidth * 0.7,
                        label: 'סגור',
                        onPressed: closeOverlay,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(0),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      });
    }).show(context);
  }
}

class HistoryRecordTile extends StatelessWidget {
  final HistoryRecordEntity recordEntity;
  const HistoryRecordTile({
    super.key,
    required this.recordEntity,
  });

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd/MM/yyyy', 'he');
    final recordView = HistoryRecordViewModel.fromEntity(recordEntity);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 10,
          children: [
            Row(
              spacing: 10,
              children: [
                Icon(
                  recordView.icon,
                  color: recordView.iconColor,
                ),
                Text(recordView.displayLabel,
                    style: Theme.of(context).textTheme.headlineSmall),
                const Spacer(),
                Text(
                  dateFormat.format(recordEntity.date),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: TEXT_COLOR_2),
                ),
              ],
            ),
            Text(
              recordView.message,
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
