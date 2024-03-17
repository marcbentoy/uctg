import 'package:flutter/material.dart';
import 'package:uctg/models/timetable.dart';

class CustomSidebar extends StatefulWidget {
  final List<Timetable> timetables;
  final Function(int) onItemSelected;

  const CustomSidebar({
    super.key,
    required this.timetables,
    required this.onItemSelected,
  });

  @override
  State<CustomSidebar> createState() => _CustomSidebarState();
}

class _CustomSidebarState extends State<CustomSidebar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 256,
      color: Colors.white,
      child: Column(
        children: [
          // logo
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Center(child: Text("UCTG")),
            ),
          ),

          // timetables
          Expanded(
            child: ListView.builder(
              itemCount: widget.timetables.length,
              itemBuilder: (ctx, index) {
                return ListTile(
                  title: Text(widget.timetables[index].name),
                  onTap: () {
                    debugPrint("timetable clicked with index: $index");
                    widget.onItemSelected(index);
                  },
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FilledButton(
              onPressed: () {},
              child: const Text("New Timetable"),
            ),
          ),
        ],
      ),
    );
  }
}
