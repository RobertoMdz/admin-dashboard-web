import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GroupMenuTitle extends StatelessWidget {
  final String title;
  const GroupMenuTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.only(bottom: 5),
      child: Text(
        title,
        style: GoogleFonts.roboto(
          color: Colors.white.withOpacity(0.3),
          fontSize: 12,
        ),
      ),
    );
  }
}
