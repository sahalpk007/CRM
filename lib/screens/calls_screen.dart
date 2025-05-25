import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main_layout.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      currentPage: CallsScreen,
      content: Center(
        child: Text(
          'Calls Screen',
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