import 'package:flutter/material.dart';
import 'package:uctg/widgets/add_inputs_step/dialog_title_widget.dart';
import 'package:uctg/widgets/add_inputs_step/input_utils.dart';
import 'package:uctg/widgets/add_inputs_step/selection_widget.dart';

class AddRoomDataWidget extends StatefulWidget {
  const AddRoomDataWidget({super.key});

  @override
  State<AddRoomDataWidget> createState() => _AddRoomDataWidgetState();
}

class _AddRoomDataWidgetState extends State<AddRoomDataWidget> {
  @override
  Widget build(BuildContext context) {
    String selectedOption = "good";
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(16),
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DialogTitleWidget(title: "Add new room"),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: Column(
                children: [
                  SelectionWidget(
                    options: ["something", "good"],
                    selected: selectedOption,
                    selectionCallback: (String value) {
                      setState(() {
                        selectedOption = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            dialogRowControls(context, () {}),
          ],
        ),
      ),
    );
  }
}
