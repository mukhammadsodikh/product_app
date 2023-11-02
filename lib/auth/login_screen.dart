import 'package:flutter/material.dart';

import '../screens/main_screen.dart';
import '../service/firebase_manager.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
    final FirebaseManager _manager = FirebaseManager();
    final email = TextEditingController();
    final password = TextEditingController();
    bool _isLoading = false;

    void login() {
      setState(() {
        _isLoading = true;
      });
      _manager.login(email.text, password.text).then((value) {
        if (value == "Success") {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => MainScreen())
          );
        }
      });
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Color(0xff90afff),
                      shape: BoxShape.circle
                  ),
                  child: Icon(
                      Icons.person,
                      size: 70,
                      color: Color(0xff074cff)
                  ),
                ),

                SizedBox(height: 16),
                Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: email,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  controller: password,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 16),
              _isLoading ? CircularProgressIndicator() : ElevatedButton(onPressed: login, child: Text("Login"))
              ],
            ),
          ),
        ),
      );
    }
  }