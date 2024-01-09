import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
 

 final _firebase = FirebaseAuth.instance;
final List<String> Gender = ['Female', 'Male'];
String? selectedValue;

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUp createState() => _SignUp();
}

class _SignUp extends State<SignUp> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text('Sign Up', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding:  EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.white),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Your Email',
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                const Text('Gender', style: TextStyle(color: Colors.white)),
                const SizedBox(width: 16.0),
                DropdownButton<String>(
                  items: Gender.map(
                    (String gender) => DropdownMenuItem<String>(
                      value: gender,
                      child: Text(
                        gender,
                        style:
                            const TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ),
                  ).toList(),
                  value: selectedValue,
                  onChanged: (String? value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                String username = _usernameController.text;
                String password = _passwordController.text;
                String email = _emailController.text;
try {
  
                 UserCredential userCredential= 
              await _firebase.createUserWithEmailAndPassword(
                email: email, password: password);
              await  FirebaseFirestore.instance.collection('Users').doc( userCredential.user!.uid)
                .set({
                  'username':_usernameController.text,
                  'email':_emailController.text,
                  'gender': selectedValue,

                });

} on FirebaseAuthException catch (e) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(e.message?? 'Authentication Failed'))
  );

}

               
              },
              child: const Text('Sign Up',
                  style: TextStyle(color: Color.fromARGB(255, 95, 94, 94))),
            ),
           const SizedBox(height: 12.0),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child:
                  const Text('Go back', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
