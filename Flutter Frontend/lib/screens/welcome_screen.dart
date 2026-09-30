import 'package:flutter/material.dart';
import 'package:kims_care/theme/app_colors.dart';
import 'package:kims_care/screens/auth/student_registration_screen.dart';
import 'package:kims_care/screens/auth/patient_registration_screen.dart';
import 'package:kims_care/screens/auth/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Theme Toggle
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(
                      Theme.of(context).brightness == Brightness.dark
                          ? Icons.light_mode
                          : Icons.dark_mode,
                      color: AppTheme.getPrimaryText(context),
                    ),
                    onPressed: () {
                      AppTheme.toggleTheme();
                    },
                  ),
                ),
                
                const SizedBox(height: 10),
                // Illustration placeholder
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppTheme.getBackground(context),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.getAccent(context).withOpacity(0.1),
                        blurRadius: 100,
                        spreadRadius: 20,
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/mascot.jpg',
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                
                // Welcome Text
                Text(
                  'Welcome to',
                  style: TextStyle(
                    color: AppTheme.getPrimaryText(context),
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'KIMS Care ',
                      style: TextStyle(
                        color: AppTheme.getAccent(context), 
                        fontSize: 36,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const Text(
                      '✨',
                      style: TextStyle(fontSize: 32),
                    ),
                  ],
                ),
                
                const SizedBox(height: 16),
                
                // Subtitle
                Text(
                  'Healthcare made simpler for\nKIIT & KIMS community.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppTheme.getSecondaryText(context),
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
                
                const SizedBox(height: 40),
                
                // Action Buttons
                _buildOptionCard(
                  context,
                  title: 'KIIT Student',
                  subtitle: 'Continue with KIIT',
                  icon: Icons.school_rounded,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const StudentRegistrationScreen(),
                      ),
                    );
                  },
                ),
                
                const SizedBox(height: 16),
                
                _buildOptionCard(
                  context,
                  title: 'Patient',
                  subtitle: 'Continue as Patient',
                  icon: Icons.medical_services_rounded,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PatientRegistrationScreen(),
                      ),
                    );
                  },
                ),
                
                const SizedBox(height: 40),
                
                // Login Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: TextStyle(color: AppTheme.getSecondaryText(context)),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Text(
                            'Login',
                            style: TextStyle(
                              color: AppTheme.getAccent(context),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Icon(
                            Icons.arrow_forward,
                            color: AppTheme.getAccent(context),
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOptionCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          color: AppTheme.getCardColor(context),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isDark ? Colors.white.withOpacity(0.05) : Colors.black.withOpacity(0.05),
          ),
          boxShadow: isDark ? null : [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppTheme.getIconBackground(context),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                icon,
                color: AppTheme.getAccent(context),
                size: 32,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: AppTheme.getPrimaryText(context),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: AppTheme.getSecondaryText(context),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right_rounded,
              color: AppTheme.getSecondaryText(context),
            ),
          ],
        ),
      ),
    );
  }
}

// A simple Dummy Screen to demonstrate navigation
class DummyScreen extends StatelessWidget {
  final String title;
  const DummyScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: TextStyle(color: AppTheme.getPrimaryText(context))),
        backgroundColor: AppTheme.getBackground(context),
        iconTheme: IconThemeData(color: AppTheme.getPrimaryText(context)),
        elevation: 0,
      ),
      body: Center(
        child: Text(
          '$title Page',
          style: TextStyle(
            fontSize: 24,
            color: AppTheme.getPrimaryText(context),
          ),
        ),
      ),
    );
  }
}
