import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main_layout.dart';

class QualifiedLeadsScreen extends StatelessWidget {
  const QualifiedLeadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      currentPage: QualifiedLeadsScreen,
      content: Center(
        child: Text(
          'Qualified Leads Screen',
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