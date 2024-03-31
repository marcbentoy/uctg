// import 'package:flutter/material.dart';
// import 'package:uctg/widgets/add_inputs_step/dialog_title_widget.dart';
// import 'package:uctg/widgets/add_inputs_step/input_utils.dart';
// import 'package:uctg/widgets/add_inputs_step/timeslot_day_selection_widget.dart';
// import 'package:uctg/widgets/add_inputs_step/timeslot_week_selection_widget.dart';

// class TimeslotSelectionWidget extends StatefulWidget {
//   const TimeslotSelectionWidget({super.key});

//   @override
//   State<TimeslotSelectionWidget> createState() =>
//       _TimeslotSelectionWidgetState();
// }

// class _TimeslotSelectionWidgetState extends State<TimeslotSelectionWidget> {


//   @override
//   Widget build(BuildContext context) {
//     void onChangedCallback(List<bool> prevValues, List<bool> newValues) {
//       setState(() {
//       prevValues = newValues;
//       });
//     }
//     return Dialog(
//       child: Container(
//         width: 720,
//         height: 800,
//         padding: EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(16),
//         ),
//         child: Column(
//           children: [
//             DialogTitleWidget(title: "Select timeslots"),
//             SizedBox(
//               height: 16,
//             ),
//             Expanded(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   TimeslotDaySelectionWidget(
//                     weekday: "Mon",
//                     onChangedCallback: onChangedCallback,
//                   ),
//                   TimeslotDaySelectionWidget(
//                     weekday: "Tue",
//                     onChangedCallback: onChangedCallback,
//                   ),
//                   TimeslotDaySelectionWidget(
//                     weekday: "Wed",
//                     onChangedCallback: onChangedCallback,
//                   ),
//                   TimeslotDaySelectionWidget(
//                     weekday: "Thu",
//                     onChangedCallback: onChangedCallback,
//                   ),
//                   TimeslotDaySelectionWidget(
//                     weekday: "Fri",
//                     onChangedCallback: onChangedCallback,
//                   ),
//                   TimeslotDaySelectionWidget(
//                     weekday: "Sat",
//                     onChangedCallback: onChangedCallback,
//                   ),
//                   TimeslotDaySelectionWidget(
//                     weekday: "Sun",
//                     onChangedCallback: onChangedCallback,
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 16,
//             ),
//             dialogRowControls(context, () {}),
//           ],
//         ),
//       ),
//     );
//   }
// }
