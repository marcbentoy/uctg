import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uctg/constants/colors.dart';
import 'package:uctg/main.dart';
import 'package:uctg/models/timetable.dart';
import 'package:uctg/widgets/add_inputs_step/dialog_title_widget.dart';
import 'package:uctg/widgets/add_inputs_step/input_utils.dart';

class RoomsSelectionDialogWidget extends StatefulWidget {
  final void Function(void Function()) innerSetState;
  final Room currentSelectedRoom;
  final void Function(Room) onSelectionSave;

  const RoomsSelectionDialogWidget({
    super.key,
    required this.innerSetState,
    required this.currentSelectedRoom,
    required this.onSelectionSave,
  });

  @override
  State<RoomsSelectionDialogWidget> createState() =>
      RoomssSelectionDialogWidgetState();
}

class RoomssSelectionDialogWidgetState
    extends State<RoomsSelectionDialogWidget> {
  late Room selectedRoom;

  @override
  void initState() {
    super.initState();
    selectedRoom = widget.currentSelectedRoom;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(16),
        width: 500,
        height: 600,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DialogTitleWidget(title: "Select a section"),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  children: currentTimetable.rooms.map((e) {
                    return GestureDetector(
                      onTap: () {
                        widget.innerSetState(() {
                          selectedRoom = e;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Chip(
                          backgroundColor:
                              e == selectedRoom ? kDarkGrayColor : Colors.white,
                          label: Text(
                            e.name,
                            style: GoogleFonts.inter(
                              color: e == selectedRoom
                                  ? Colors.white
                                  : kDarkGrayColor,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            dialogRowControls(context, () {
              widget.onSelectionSave(selectedRoom);
            }),
          ],
        ),
      ),
    );
  }
}
