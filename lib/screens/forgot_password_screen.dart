import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailFormKey = GlobalKey<FormState>();
  final _passwordFormKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isEmailStep = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submitEmail() {
    if (_emailFormKey.currentState!.validate()) {
      // Simulate sending a reset email (replace with actual logic, e.g., Firebase)
      setState(() {
        _isEmailStep = false;
      });
    }
  }

  void _resetPassword() {
    if (_passwordFormKey.currentState!.validate()) {
      // Implement password reset logic here (e.g., via AuthProvider)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password reset successfully')),
      );
      Navigator.pop(context); // Return to SignInScreen
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F6FF), // Matches SignInScreen background
      body: Center(
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Container(
            width: 400,
            padding: const EdgeInsets.all(24.0),
            child: _isEmailStep ? _buildEmailForm() : _buildPasswordForm(),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailForm() {
    return Form(
      key: _emailFormKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Enter your email to reset password',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1A1A1A),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              hintText: 'Enter email',
              filled: true,
              fillColor: const Color(0xFFF5F5F5),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none,
              ),
              hintStyle: GoogleFonts.poppins(
                color: const Color(0xFFA0A0A0),
                fontSize: 14,
              ),
              labelStyle: GoogleFonts.poppins(
                color: const Color(0xFF1A1A1A),
                fontSize: 14,
              ),
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter an email';
              }
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return 'Enter a valid email';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _submitEmail,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF5B2D87),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text(
                'Reset Password',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordForm() {
    return Form(
      key: _passwordFormKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Choose your new password',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1A1A1A),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: 'Password',
              hintText: 'Enter password',
              filled: true,
              fillColor: const Color(0xFFF5F5F5),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none,
              ),
              hintStyle: GoogleFonts.poppins(
                color: const Color(0xFFA0A0A0),
                fontSize: 14,
              ),
              labelStyle: GoogleFonts.poppins(
                color: const Color(0xFF1A1A1A),
                fontSize: 14,
              ),
            ),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter a password';
              }
              if (value.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _confirmPasswordController,
            decoration: InputDecoration(
              labelText: 'Confirm Password',
              hintText: 'Re-Enter password',
              filled: true,
              fillColor: const Color(0xFFF5F5F5),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none,
              ),
              hintStyle: GoogleFonts.poppins(
                color: const Color(0xFFA0A0A0),
                fontSize: 14,
              ),
              labelStyle: GoogleFonts.poppins(
                color: const Color(0xFF1A1A1A),
                fontSize: 14,
              ),
            ),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Confirm your password';
              }
              if (value != _passwordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _resetPassword,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF5B2D87),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text(
                'Submit',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Navigate back to SignInScreen
            },
            child: Text(
              'Back to Log In',
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: const Color(0xFF007AFF),
              ),
            ),
          ),
        ],
      ),
    );
  }
}