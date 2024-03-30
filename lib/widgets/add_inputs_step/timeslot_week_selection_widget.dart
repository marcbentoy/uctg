import 'package:flutter/material.dart';
import 'package:uctg/widgets/add_inputs_step/input_utils.dart';
import 'package:uctg/widgets/add_inputs_step/timeslot_day_selection_widget.dart';

class TimeslotWeekSelectionWidget extends StatefulWidget {
  const TimeslotWeekSelectionWidget({super.key});

  @override
  State<TimeslotWeekSelectionWidget> createState() =>
      _TimeslotWeekSelectionWidgetState();
}

class _TimeslotWeekSelectionWidgetState
    extends State<TimeslotWeekSelectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      width: 800,
      height: 600,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TimeslotDaySelectionWidget(
                    weekday: "Monday",
                  ),
                  TimeslotDaySelectionWidget(
                    weekday: "Tuesday",
                  ),
                  TimeslotDaySelectionWidget(
                    weekday: "Wednesday",
                  ),
                  TimeslotDaySelectionWidget(
                    weekday: "Thursday",
                  ),
                  TimeslotDaySelectionWidget(
                    weekday: "Friday",
                  ),
                  TimeslotDaySelectionWidget(
                    weekday: "Saturday",
                  ),
                  TimeslotDaySelectionWidget(
                    weekday: "Sunday",
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            dialogRowControls(
              context,
              () {
                Navigator.pop(
                  context,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
