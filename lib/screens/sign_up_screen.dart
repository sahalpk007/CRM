import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import 'sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _signUp() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      // Simulate a sign-up process without AuthProvider
      await Future.delayed(const Duration(seconds: 1)); // Simulate a delay
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Sign-up successful! Please sign in.'),
        ),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const SignInScreen()),
      );
    }
  }

  Future<void> _launchGoogle() async {
    final Uri url = Uri.parse('https://www.google.com');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Could not launch Google.'),
          backgroundColor: AppTheme.errorColor,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return SingleChildScrollView(
              child: _buildForm(context, constraints.maxWidth),
            );
          } else {
            return Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    color: AppTheme.backgroundColor,
                    child: Center(
                      child: SizedBox(
                        width: 450,
                  height: 450, // Matches SignInScreen.dart
                        child: Image.asset(
                          'assets/images/signin_image.jpg',
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) => Icon(
                            Icons.error,
                            color: AppTheme.errorColor,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    color: AppTheme.whiteColor,
                    child: SingleChildScrollView(
                      child: _buildForm(context, 350),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildForm(BuildContext context, double maxWidth) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Sign Up',
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.textColor,
                ),
              ),
              const SizedBox(height: 24),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // User Name
                    RichText(
                      text: TextSpan(
                        text: 'User Name ',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppTheme.textColor,
                        ),
                        children: const [
                          TextSpan(
                            text: '*',
                            style: TextStyle(
                              color: AppTheme.errorColor,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        hintText: 'Enter your name',
                      ),
                      style: GoogleFonts.poppins(fontSize: 12),
                      validator: (value) =>
                          value == null || value.isEmpty ? 'Enter your name' : null,
                    ),
                    const SizedBox(height: 16),
                    // Email
                    RichText(
                      text: TextSpan(
                        text: 'Email ',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppTheme.textColor,
                        ),
                        children: const [
                          TextSpan(
                            text: '*',
                            style: TextStyle(
                              color: AppTheme.errorColor,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        hintText: 'Enter email',
                      ),
                      style: GoogleFonts.poppins(fontSize: 12),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'Enter an email';
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    // Phone Number
                    RichText(
                      text: TextSpan(
                        text: 'Phone Number ',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppTheme.textColor,
                        ),
                        children: const [
                          TextSpan(
                            text: '*',
                            style: TextStyle(
                              color: AppTheme.errorColor,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _phoneController,
                      decoration: const InputDecoration(
                        hintText: 'Enter phone number',
                      ),
                      style: GoogleFonts.poppins(fontSize: 12),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'Enter a phone number';
                        if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                          return 'Enter a valid 10-digit phone number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    // Password
                    RichText(
                      text: TextSpan(
                        text: 'Password ',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppTheme.textColor,
                        ),
                        children: const [
                          TextSpan(
                            text: '*',
                            style: TextStyle(
                              color: AppTheme.errorColor,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        hintText: 'Enter password',
                      ),
                      style: GoogleFonts.poppins(fontSize: 12),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'Enter a password';
                        if (value.length < 6) return 'Password must be 6+ characters';
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    // Confirm Password
                    RichText(
                      text: TextSpan(
                        text: 'Confirm Password ',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppTheme.textColor,
                        ),
                        children: const [
                          TextSpan(
                            text: '*',
                            style: TextStyle(
                              color: AppTheme.errorColor,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _confirmPasswordController,
                      decoration: const InputDecoration(
                        hintText: 'Re-enter password',
                      ),
                      style: GoogleFonts.poppins(fontSize: 12),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'Confirm your password';
                        if (value != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    _isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: _signUp,
                              style: Theme.of(context).elevatedButtonTheme.style,
                              child: Text(
                                'Sign Up',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                    const SizedBox(height: 16),
                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Already have an account? ',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppTheme.secondaryTextColor,
                            ),
                          ),
                          TextButton(
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const SignInScreen()),
                            ),
                            child: Text(
                              'Login here',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppTheme.accentColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Expanded(child: Divider()),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'or',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppTheme.secondaryTextColor,
                            ),
                          ),
                        ),
                        const Expanded(child: Divider()),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: _launchGoogle,
                        icon: Image.asset(
                          'assets/images/google_logo2.png',
                          width: 24,
                          height: 24,
                          errorBuilder: (context, error, stackTrace) => Icon(
                            Icons.error,
                            color: AppTheme.errorColor,
                            size: 24,
                          ),
                        ),
                        label: Text(
                          'Sign up with Google',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppTheme.textColor,
                          ),
                        ),
                        style: Theme.of(context).textButtonTheme.style,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}