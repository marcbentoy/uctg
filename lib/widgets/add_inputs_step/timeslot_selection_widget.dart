import 'package:flutter/material.dart';
import 'package:uctg/widgets/add_inputs_step/dialog_title_widget.dart';
import 'package:uctg/widgets/add_inputs_step/input_utils.dart';
import 'package:uctg/widgets/add_inputs_step/timeslot_week_selection_widget.dart';

class TimeslotSelectionWidget extends StatefulWidget {
  const TimeslotSelectionWidget({super.key});

  @override
  State<TimeslotSelectionWidget> createState() =>
      _TimeslotSelectionWidgetState();
}

class _TimeslotSelectionWidgetState extends State<TimeslotSelectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 600,
        height: 800,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            DialogTitleWidget(title: "Select timeslots"),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: TimeslotWeekSelectionWidget(),
            ),
            SizedBox(
              height: 16,
            ),
            // dialogRowControls(context, () {}),
          ],
        ),
      ),
    );
  }
}
