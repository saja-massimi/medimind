import 'package:flutter/material.dart';
import 'package:medi_mind/sign_up.dart';

class Sign_In extends StatefulWidget {
  const Sign_In({super.key});
  _Sign_in createState() => _Sign_in();
}

class _Sign_in extends State<Sign_In> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                'images/logo.png',
                width: 200,
                height: 200,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                      labelStyle: TextStyle(color: Colors.white))),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(foregroundColor: Color(50)),
              child: const Text(
                'Forget Password?',
                style: TextStyle(color: Colors.black45),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton(
              onPressed: () {
                String username = _usernameController.text;
                String password = _passwordController.text;
                // Perform sign-up operations
                print(
                    'Signing up with email: $username and password: $password ');
              },
              style: OutlinedButton.styleFrom(
                  foregroundColor: Color.fromARGB(255, 255, 255, 255)),
              child: const Text('Sign in'),
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => sign_up()));
              },
              style: OutlinedButton.styleFrom(
                  foregroundColor: Color.fromARGB(255, 255, 255, 255)),
              child: const Text('Sign up'),
            ),
          ],
        ),
      ),
    );
  }
}
