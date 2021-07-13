import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/twitter-white-logo.png',
            width: 50,
            height: 50,
          ),
          const SizedBox(
            height: 10.0,
          ),
          FittedBox(
            fit: BoxFit.contain,
            child: Text(
              'Happening now!!',
              style: GoogleFonts.montserratAlternates(
                fontSize: 50,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
