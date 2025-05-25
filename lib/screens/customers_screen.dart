import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main_layout.dart';

class CustomersScreen extends StatelessWidget {
  const CustomersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      currentPage: CustomersScreen,
      content: Center(
        child: Text(
          'Customers Screen',
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