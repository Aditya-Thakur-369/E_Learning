import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StaticsScreen extends StatelessWidget {
  const StaticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          Center(
            child: Text(
              "Statics Screen",
              style: GoogleFonts.plusJakartaSans(
                  // color: Colors.grey.shade500,
                  fontSize: 40,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Spacer()
        ],
      ),
    );
  }
}
