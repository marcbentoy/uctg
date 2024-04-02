import 'package:flutter/material.dart';
import 'package:uctg/main.dart';
import 'package:uctg/models/timetable.dart';
import 'package:uctg/widgets/add_inputs_step/dialog_title_widget.dart';
import 'package:uctg/widgets/add_inputs_step/input_utils.dart';
import 'package:uctg/widgets/add_inputs_step/selection_widget.dart';

class AddRoomDialogWidget extends StatefulWidget {
  final void Function(void Function()) innerSetState;
  final Room? currentRoom;

  const AddRoomDialogWidget({
    super.key,
    required this.innerSetState,
    this.currentRoom,
  });

  @override
  State<AddRoomDialogWidget> createState() => _AddRoomDialogWidgetState();
}

class _AddRoomDialogWidgetState extends State<AddRoomDialogWidget> {
  TextEditingController nameController = TextEditingController();
  String selectedRoomType = "lecture";

  @override
  void initState() {
    super.initState();

    if (widget.currentRoom != null) {
      setState(() {
        nameController.text = widget.currentRoom!.name;
        selectedRoomType =
            widget.currentRoom!.type == SubjectType.lab ? "lab" : "lecture";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        width: 400,
        height: 324,
        child: Column(
          children: [
            const DialogTitleWidget(title: "Add room data"),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Room name",
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SelectionWidget(
                        options: const ["lecture", "lab"],
                        selected: selectedRoomType,
                        selectionCallback: (String value) {
                          widget.innerSetState(() {
                            selectedRoomType = value;
                          });
                        }),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            dialogRowControls(
              context,
              () {
                setState(() {
                  Room roomToAdd = Room();
                  roomToAdd.name = nameController.text;
                  roomToAdd.type = selectedRoomType == "lecture"
                      ? SubjectType.lecture
                      : SubjectType.lab;

                  var newRooms = List<Room>.from(currentTimetable.rooms);

                  // if room is not null, edit
                  if (widget.currentRoom != null) {
                    newRooms[newRooms.indexWhere(
                            (element) => element == widget.currentRoom)] =
                        roomToAdd;
                    currentTimetable.rooms = newRooms;
                    isarService.saveTimetable(currentTimetable);
                    return;
                  }

                  newRooms.add(roomToAdd);
                  currentTimetable.rooms = newRooms;
                  isarService.saveTimetable(currentTimetable);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
