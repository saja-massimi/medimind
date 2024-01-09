import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medi_mind/home.dart';
import 'package:medi_mind/sign_up.dart';

 final _firebase = FirebaseAuth.instance;

class Sign_In extends StatefulWidget {
  const Sign_In({Key? key}) : super(key: key);

  @override
  _Sign_in createState() => _Sign_in();
}

class _Sign_in extends State<Sign_In> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  Future<void> signIn() async {
    String username = _usernameController.text;
    String password = _passwordController.text;

    
    
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
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.white),
                ),
                controller: _usernameController,
              ),
            ),
             Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.white),
                ),
                controller: _passwordController,
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(foregroundColor: const Color(0x00000032)),
              child: const Text(
                'Forget Password?',
                style: TextStyle(color: Colors.black45),
              ),
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: () async{
              try {
                final UserCredential userCredential= 
              await _firebase.signInWithEmailAndPassword(
                email: _usernameController.text, password: _passwordController.text);

              } on FirebaseAuthException catch (e) {
                
                  ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(e.message?? 'Incorrect Name or Password'))
                  );
                 
              } 
               
              },
              style: OutlinedButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 255, 255, 255)),
              child: const Text('Sign in'),
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const SignUp()));
              },
              style: OutlinedButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 255, 255, 255)),
              child: const Text('Sign up'),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
