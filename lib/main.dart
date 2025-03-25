import 'package:flutter/material.dart';
import 'homepage_FSDC.dart';
import 'signup_fsdc.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.green,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.black,
      ),
      textTheme: TextTheme(
        bodyMedium: TextStyle(
          fontSize: 18,
          color: Colors.amberAccent,
        ),
      ),
    ),
    home: Scaffold(
      appBar: AppBar(
        title: Text('FlutterDemo'),
      ),
      body: Center(
        child: LoginForm(),
      ),
    ),
  ));
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleLogin() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username.isNotEmpty && password.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Homepage_FSDC()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter both your username and password'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Image.asset(
        'assets/catpng.png',
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      ),
      Text('Sign In',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      Text('Please enter your details'),
      TextField(
        controller: _usernameController,
        decoration: InputDecoration(labelText: 'Username'),
      ),
      TextField(
        controller: _passwordController,
        decoration: InputDecoration(labelText: 'Password'),
        obscureText: true,
      ),
      SizedBox(
        height: 20,
      ),
      ElevatedButton(
        onPressed: _handleLogin,
        child: Text('Login'),
      ),
      SizedBox(
        height: 20,
      ),
      ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignUp()),
          );
        },
        child: Text('Sign Up'),
      ),
    ]);
  }
}
