import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main_layout.dart';

class BadLeadsScreen extends StatelessWidget {
  const BadLeadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      currentPage: BadLeadsScreen,
      content: Center(
        child: Text(
          'Bad Leads Screen',
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}