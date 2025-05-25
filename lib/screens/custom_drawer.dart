import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import 'sign_in_screen.dart';
import 'customers_screen.dart';
import 'products_screen.dart';
import 'enquiry_screen.dart';
import 'qualified_leads_screen.dart';
import 'bad_leads_screen.dart';
import 'visits_screen.dart';
import 'calls_screen.dart';
import 'reports_screen.dart';
import 'settings_screen.dart';
import 'home_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppTheme.primaryColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: AppTheme.whiteColor,
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: AppTheme.primaryColor,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'User Name',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.whiteColor,
                  ),
                ),
                Text(
                  'user@example.com',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppTheme.whiteColor.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text('Dashboard'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const HomeScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('Customers'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const CustomersScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('Products'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const ProductsScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.question_answer),
            title: const Text('Enquiry'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const EnquiryScreen()),
              );
            },
          ),
          ExpansionTile(
            leading: const Icon(Icons.leaderboard),
            title: const Text('Leads'),
            children: [
              ListTile(
                title: const Text('Qualified Leads'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const QualifiedLeadsScreen()),
                  );
                },
              ),
              ListTile(
                title: const Text('Bad Leads'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const BadLeadsScreen()),
                  );
                },
              ),
            ],
          ),
          ListTile(
            leading: const Icon(Icons.event),
            title: const Text('Visits'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const VisitsScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.phone),
            title: const Text('Calls'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const CallsScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.description),
            title: const Text('Reports'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const ReportsScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const SettingsScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const SignInScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}