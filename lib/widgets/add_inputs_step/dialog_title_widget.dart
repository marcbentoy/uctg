import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DialogTitleWidget extends StatelessWidget {
  final String title;
  const DialogTitleWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: const Color(0xff2e2e2e),
      ),
    );
  }
}
