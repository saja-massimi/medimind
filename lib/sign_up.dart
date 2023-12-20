import 'package:flutter/material.dart';
import 'package:medi_mind/home.dart';


class sign_up extends StatefulWidget {
  const sign_up({super.key});
  @override
  _Sign_up createState() => _Sign_up();
}

class _Sign_up extends State<sign_up> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text('Sign Up',
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                  labelText: 'Username',
                  labelStyle: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.white)),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  labelStyle: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 20.0),
            OutlinedButton(
              onPressed: () {
                // Implement sign-up logic here
                String email = _usernameController.text;
                String password = _passwordController.text;
                String phone_number = _phoneController.text;
                 Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Home()));
                // Perform sign-up operations
                print(
                    'Signing up with email: $email and password: $password and phone number: $phone_number');
              },
              child: const Text(
                'Sign Up',
                style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
            const SizedBox(height: 12.0),
            OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Go back',
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                ))
          ],
        ),
      ),
    );
  }
}
