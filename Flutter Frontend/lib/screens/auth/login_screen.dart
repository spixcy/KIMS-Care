import 'package:flutter/material.dart';
import 'package:kims_care/theme/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  
  String identifier = ''; // Email or Roll Number
  
  bool isLoading = false;

  Future<void> submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() => isLoading = true);
      
      // MOCK LOGIN: Currently the Spring backend doesn't have a login endpoint with passwords.
      // We simulate a login delay. In a real app, you'd call a /login endpoint.
      await Future.delayed(const Duration(seconds: 1));
      
      setState(() => isLoading = false);
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Logged in successfully as $identifier!')),
      );
      
      // Here you would navigate to the Home screen
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login', style: TextStyle(color: AppTheme.getPrimaryText(context))),
        backgroundColor: AppTheme.getBackground(context),
        iconTheme: IconThemeData(color: AppTheme.getPrimaryText(context)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Icon(Icons.lock_outline, size: 80, color: AppTheme.getAccent(context)),
              const SizedBox(height: 20),
              Text(
                'Welcome Back!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.getPrimaryText(context),
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email or Roll Number',
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(color: AppTheme.getPrimaryText(context)),
                validator: (val) => val!.isEmpty ? 'Please enter your ID' : null,
                onSaved: (val) => identifier = val!,
              ),
              const SizedBox(height: 30),
              isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.getAccent(context),
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    onPressed: submit,
                    child: const Text('Login', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
