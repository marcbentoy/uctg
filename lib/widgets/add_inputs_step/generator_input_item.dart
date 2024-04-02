import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uctg/constants/colors.dart';

class GeneratorInputItem extends StatelessWidget {
  final IconData icon;
  final String itemName;
  final int index;
  final int currentIndex;
  final void Function(int) clickCallback;

  const GeneratorInputItem({
    super.key,
    required this.icon,
    required this.itemName,
    required this.index,
    required this.currentIndex,
    required this.clickCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: () {
          clickCallback(index);
        },
        child: Container(
          height: 36,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: index == currentIndex ? kLightGrayColor : Colors.white,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                size: 16,
                color: index == currentIndex ? Colors.white : Colors.black38,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                itemName,
                style: GoogleFonts.inter(
                  color: index == currentIndex
                      ? Colors.white
                      : const Color(0xff2e2e2e),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
