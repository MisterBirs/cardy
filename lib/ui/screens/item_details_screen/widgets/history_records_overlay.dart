import 'package:cardy/entities/item_history/history_record_entity.dart';
import 'package:cardy/core/ui_constants.dart';
import 'package:cardy/ui/widgets/gradient_button.dart';
import 'package:cardy/ui/widgets/overlay_builder.dart';
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
                                record: record,
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
  final HistoryRecordEntity record;
  const HistoryRecordTile({
    super.key,
    required this.record,
  });

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd/MM/yyyy', 'he');

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
                  record.icon,
                  color: record.iconColor,
                ),
                Text(record.dispalyLabel,
                    style: Theme.of(context).textTheme.headlineSmall),
                const Spacer(),
                Text(
                  dateFormat.format(record.date),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: TEXT_COLOR_2),
                ),
              ],
            ),
            Text(
              record.message,
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 15),
            ),
          ],
        ),
      ),
    );
    // return ListTile(
    //   title: Text(record.dispalyLabel),
    //   subtitle: Text(record.message),
    //  // trailing: Text(record.date),
    //   leading: Icon(
    //     record.icon,
    //     color: record.iconColor,
    //   ),
    // );
  }
}
