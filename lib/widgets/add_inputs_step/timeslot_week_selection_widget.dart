import 'package:flutter/material.dart';
import 'package:uctg/widgets/add_inputs_step/input_utils.dart';
import 'package:uctg/widgets/add_inputs_step/timeslot_day_selection_widget.dart';

class TimeslotWeekSelectionWidget extends StatefulWidget {
  final List<List<bool>> currentSelectedTimeslots;
  final void Function(List<List<bool>>) onChangedCallback;

  final void Function(void Function()) innerSetState;

  const TimeslotWeekSelectionWidget({
    super.key,
    required this.currentSelectedTimeslots,
    required this.onChangedCallback,
    required this.innerSetState,
  });

  @override
  State<TimeslotWeekSelectionWidget> createState() =>
      _TimeslotWeekSelectionWidgetState();
}

class _TimeslotWeekSelectionWidgetState
    extends State<TimeslotWeekSelectionWidget> {
  List<List<bool>> selectedTimeslots = [];

  @override
  Widget build(BuildContext context) {
    selectedTimeslots = widget.currentSelectedTimeslots;

    void onChangeDayCallback(int index, List<bool> sDT) {
      setState(() {
        selectedTimeslots[index] = sDT;
      });
    }

    return Dialog(
      child: Container(
        clipBehavior: Clip.antiAlias,
        width: 800,
        height: 800,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TimeslotDaySelectionWidget(
                      index: 0,
                      weekday: "Mon",
                      currentSelectedTimeslots: selectedTimeslots[0],
                      onChangedCallback: onChangeDayCallback,
                    ),
                    TimeslotDaySelectionWidget(
                      index: 1,
                      weekday: "Tue",
                      currentSelectedTimeslots: selectedTimeslots[1],
                      onChangedCallback: onChangeDayCallback,
                    ),
                    TimeslotDaySelectionWidget(
                      index: 2,
                      weekday: "Wed",
                      currentSelectedTimeslots: selectedTimeslots[2],
                      onChangedCallback: onChangeDayCallback,
                    ),
                    TimeslotDaySelectionWidget(
                      index: 3,
                      weekday: "Thu",
                      currentSelectedTimeslots: selectedTimeslots[3],
                      onChangedCallback: onChangeDayCallback,
                    ),
                    TimeslotDaySelectionWidget(
                      weekday: "Fri",
                      index: 4,
                      currentSelectedTimeslots: selectedTimeslots[4],
                      onChangedCallback: onChangeDayCallback,
                    ),
                    TimeslotDaySelectionWidget(
                      weekday: "Sat",
                      index: 5,
                      currentSelectedTimeslots: selectedTimeslots[5],
                      onChangedCallback: onChangeDayCallback,
                    ),
                    TimeslotDaySelectionWidget(
                      weekday: "Sun",
                      index: 6,
                      currentSelectedTimeslots: selectedTimeslots[6],
                      onChangedCallback: onChangeDayCallback,
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
                  widget.innerSetState(() {
                    widget.onChangedCallback(selectedTimeslots);
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
