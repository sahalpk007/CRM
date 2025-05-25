import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main_layout.dart';
import 'qualified_leads_screen.dart';
import 'bad_leads_screen.dart';

class LeadsScreen extends StatelessWidget {
  const LeadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      currentPage: LeadsScreen,
      content: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Leads Overview',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildLeadCard(context, 'Qualified Leads', '150', Icons.check_circle, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const QualifiedLeadsScreen()),
                  );
                }),
                _buildLeadCard(context, 'Bad Leads', '50', Icons.cancel, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const BadLeadsScreen()),
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLeadCard(BuildContext context, String title, String count, IconData icon, VoidCallback onTap) {
    return Expanded(
      child: Card(
        color: const Color(0xFFF3E5F5), // Light purple background for cards
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  Icon(icon, color: Colors.black),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                count,
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: onTap,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7B1FA2), // Purple button color
                  foregroundColor: Colors.white,
                ),
                child: Text(
                  'View Details',
                  style: GoogleFonts.poppins(fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}