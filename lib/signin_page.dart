import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:medi_mind/home.dart';
import 'package:medi_mind/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _firebase = FirebaseAuth.instance;

class Sign_In extends StatefulWidget {
  const Sign_In({Key? key}) : super(key: key);

  @override
  _Sign_in createState() => _Sign_in();
}

class _Sign_in extends State<Sign_In> {
  TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
    bool isLogged=false;

  Future<void> signIn() async {
    String username = _usernameController.text;
    String password = _passwordController.text;

    final response = await http.post(
      Uri.parse(
          'http://localhost/Medimind/sign_in.php'), // Update to the correct path
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      // Handle the response from the server
      final result = jsonDecode(response.body);
      if (result['status'] == 'success') {
        
        // User signed in successfully
        print('User signed in successfully');
        // Navigate to the home page or perform any other actions
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      } else {
        // Handle error from the server
        print('Error: ${result['message']}');
        // Display an error message to the user
      }
    } else {
      // Handle HTTP request failure
      print('HTTP Request failed with status ${response.statusCode}');
      // Display an error message to the user
    }
  }

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
                width: 160,
                height: 150,
              ),
            ),
             Padding(
              padding: EdgeInsets.all(20.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                  labelStyle: TextStyle(color: Colors.white),
        
                ),
  
                controller: _usernameController,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),
          const  SizedBox(height: 10),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(foregroundColor: Color(50)),
              child: const Text(
                'Forget Password?',
                style: TextStyle(color: Colors.black45),
              ),
            ),
            const SizedBox( height: 10),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              style: OutlinedButton.styleFrom(
                  foregroundColor: Color.fromARGB(255, 255, 255, 255)),
              child: const Text('Sign in'),
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SignUp()));
              },
              style: OutlinedButton.styleFrom(
                  foregroundColor: Color.fromARGB(255, 255, 255, 255)),
              child: const Text('Sign up'),
            ),
             const SizedBox(height: 10),
             //****************************************** */
          /*  OutlinedButton(
              onPressed: () {
                setState(() {
                  isLogged = !isLogged; 
                  if(!isLogged){
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const SignUp()));
                    }
                });
               
              },
              style: OutlinedButton.styleFrom(
              foregroundColor:const Color.fromARGB(255, 255, 255, 255)),
              child:  Text(isLogged? 'Create an account': 'I already have an account'),
            ),*/
            //********************************************** */
          ],
        ),
      ),
    );
  }
}
