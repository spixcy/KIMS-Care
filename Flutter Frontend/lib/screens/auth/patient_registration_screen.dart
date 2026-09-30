import 'package:flutter/material.dart';
import 'package:kims_care/theme/app_colors.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PatientRegistrationScreen extends StatefulWidget {
  const PatientRegistrationScreen({super.key});

  @override
  State<PatientRegistrationScreen> createState() => _PatientRegistrationScreenState();
}

class _PatientRegistrationScreenState extends State<PatientRegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  
  String name = '';
  String email = '';
  String phoneNumber = '';
  
  bool isLoading = false;

  Future<void> submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() => isLoading = true);
      
      try {
        final response = await http.post(
          Uri.parse('http://localhost:8080/patients'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode({
            'name': name,
            'email': email,
            'phoneNumber': phoneNumber,
          }),
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Registration Successful!')),
          );
          Navigator.pop(context);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed: ${response.body}')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(content: Text('Error: $e')),
        );
      } finally {
        setState(() => isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Registration', style: TextStyle(color: AppTheme.getPrimaryText(context))),
        backgroundColor: AppTheme.getBackground(context),
        iconTheme: IconThemeData(color: AppTheme.getPrimaryText(context)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                style: TextStyle(color: AppTheme.getPrimaryText(context)),
                validator: (val) => val!.isEmpty ? 'Required' : null,
                onSaved: (val) => name = val!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                style: TextStyle(color: AppTheme.getPrimaryText(context)),
                validator: (val) => val!.isEmpty ? 'Required' : null,
                onSaved: (val) => email = val!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Phone Number'),
                style: TextStyle(color: AppTheme.getPrimaryText(context)),
                validator: (val) => val!.isEmpty ? 'Required' : null,
                onSaved: (val) => phoneNumber = val!,
              ),
              const SizedBox(height: 30),
              isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.getAccent(context),
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    ),
                    onPressed: submit,
                    child: const Text('Register', style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
