import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main_layout.dart';

class EnquiryScreen extends StatelessWidget {
  const EnquiryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      currentPage: EnquiryScreen,
      content: Center(
        child: Text(
          'Enquiry Screen',
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