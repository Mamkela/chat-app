import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';

  Future<void> _login() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (error) {
      print('Login failed: $error');
    }
  }

  Future<void> _signUp() async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (error) {
      print('Sign-up failed: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login/Signup')),
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(labelText: 'Email'),
            onChanged: (value) => setState(() {
              email = value;
            }),
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
            onChanged: (value) => setState(() {
              password = value;
            }),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: _login,
                child: const Text('Login'),
              ),
              ElevatedButton(
                onPressed: _signUp,
                child: const Text('Sign Up'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
