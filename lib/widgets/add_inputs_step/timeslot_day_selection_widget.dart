import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uctg/constants/colors.dart';

class TimeslotDaySelectionWidget extends StatefulWidget {
  final String weekday;

  const TimeslotDaySelectionWidget({
    super.key,
    required this.weekday,
  });

  @override
  State<TimeslotDaySelectionWidget> createState() =>
      _TimeslotDaySelectionWidgetState();
}

class _TimeslotDaySelectionWidgetState
    extends State<TimeslotDaySelectionWidget> {
  List<bool> selectedTimeslots = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          children: [
            Text(
              widget.weekday,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: selectedTimeslots[0] ? Colors.blue : Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          focusColor: Colors.white,
                          activeColor: kDarkGrayColor,
                          value: selectedTimeslots[0],
                          onChanged: (value) {
                            setState(() {
                              selectedTimeslots[0] = !selectedTimeslots[0];
                            });
                          },
                        ),
                        Text(
                          "7AM-12PM",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            color: selectedTimeslots[0]
                                ? Colors.white
                                : const Color(0xff2e2e2e),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: selectedTimeslots[1] ? Colors.blue : Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          activeColor: kDarkGrayColor,
                          focusColor: Colors.white,
                          value: selectedTimeslots[1],
                          onChanged: (value) {
                            setState(() {
                              selectedTimeslots[1] = !selectedTimeslots[1];
                            });
                          },
                        ),
                        Text(
                          "1PM-4PM",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            color: selectedTimeslots[1]
                                ? Colors.white
                                : const Color(0xff2e2e2e),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: selectedTimeslots[2] ? Colors.blue : Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: selectedTimeslots[2],
                          activeColor: kDarkGrayColor,
                          focusColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selectedTimeslots[2] = !selectedTimeslots[2];
                            });
                          },
                        ),
                        Text(
                          "4:30PM-\n9:30PM",
                          style: GoogleFonts.inter(
                            color: selectedTimeslots[2]
                                ? Colors.white
                                : const Color(0xff2e2e2e),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
