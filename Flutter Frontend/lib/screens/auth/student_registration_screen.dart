import 'package:flutter/material.dart';
import 'package:kims_care/theme/app_colors.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StudentRegistrationScreen extends StatefulWidget {
  const StudentRegistrationScreen({super.key});

  @override
  State<StudentRegistrationScreen> createState() => _StudentRegistrationScreenState();
}

class _StudentRegistrationScreenState extends State<StudentRegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  
  String rollNumber = '';
  String name = '';
  String email = '';
  String phoneNumber = '';
  String course = '';
  String branch = '';
  int year = 1;
  
  bool isLoading = false;

  Future<void> submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() => isLoading = true);
      
      try {
        final response = await http.post(
          Uri.parse('http://localhost:8080/students'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode({
            'rollNumber': rollNumber,
            'name': name,
            'email': email,
            'phoneNumber': phoneNumber,
            'course': course,
            'branch': branch,
            'year': year,
          }),
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Registration Successful!')),
          );
          Navigator.pop(context); // Go back to welcome
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
        title: Text('KIIT Student Registration', style: TextStyle(color: AppTheme.getPrimaryText(context))),
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
                decoration: const InputDecoration(labelText: 'Roll Number'),
                style: TextStyle(color: AppTheme.getPrimaryText(context)),
                validator: (val) => val!.isEmpty ? 'Required' : null,
                onSaved: (val) => rollNumber = val!,
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
              TextFormField(
                decoration: const InputDecoration(labelText: 'Course'),
                style: TextStyle(color: AppTheme.getPrimaryText(context)),
                validator: (val) => val!.isEmpty ? 'Required' : null,
                onSaved: (val) => course = val!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Branch'),
                style: TextStyle(color: AppTheme.getPrimaryText(context)),
                validator: (val) => val!.isEmpty ? 'Required' : null,
                onSaved: (val) => branch = val!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Year (e.g. 1, 2)'),
                keyboardType: TextInputType.number,
                style: TextStyle(color: AppTheme.getPrimaryText(context)),
                validator: (val) => val!.isEmpty ? 'Required' : null,
                onSaved: (val) => year = int.tryParse(val!) ?? 1,
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
