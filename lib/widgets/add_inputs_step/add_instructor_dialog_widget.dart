import 'package:flutter/material.dart';
import 'package:uctg/widgets/add_inputs_step/dialog_title_widget.dart';
import 'package:uctg/widgets/add_inputs_step/input_utils.dart';
import 'package:uctg/widgets/add_inputs_step/selection_widget.dart';

class AddInstructorDialogWidget extends StatefulWidget {
  final void Function(void Function()) innerSetState;
  const AddInstructorDialogWidget({
    super.key,
    required this.innerSetState,
  });

  @override
  State<AddInstructorDialogWidget> createState() =>
      _AddInstructorDialogWidgetState();
}

class _AddInstructorDialogWidgetState extends State<AddInstructorDialogWidget> {
  List<String> roomOpts = [];
  String selectedRoomType = "lecture";
  TextEditingController roomNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      width: 400,
      height: 324,
      child: Column(
        children: [
          DialogTitleWidget(title: "Add room data"),
          SizedBox(
            height: 16,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: roomNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Room name",
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                SelectionWidget(
                    options: roomOpts,
                    selected: selectedRoomType,
                    selectionCallback: (String value) {
                      widget.innerSetState(() {
                        selectedRoomType = value;
                      });
                    }),
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          dialogRowControls(
            context,
            () {
              setState(() {
                // dataRows[2].add(
                //   DataRow(cells: [
                //     DataCell(Text(roomNameController.text)),
                //     DataCell(Text(selectedRoomType)),
                //   ]),
                // );
              });
            },
          ),
        ],
      ),
    );
  }
}
