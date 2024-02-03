import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:medi_mind/home.dart';
import 'package:medi_mind/sign_up.dart';

class Profile extends StatefulWidget {
 const  Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final TextEditingController _usernameController1 = TextEditingController();
  final TextEditingController _passwordController1 = TextEditingController();
  final TextEditingController _emailController1 = TextEditingController();
  

  late String username;
  late String password ;
  late String email ;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
appBar: AppBar(title: const Text('Your Profile'),backgroundColor: Colors.brown,),

body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController1,
              decoration: const InputDecoration(
                  labelText: 'Username',
                  labelStyle: TextStyle(color: Colors.white)),
             
            ),
            const SizedBox(height: 16.0),
            TextField(
              
              controller: _passwordController1,
              decoration: const InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.white)),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _emailController1,
              decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.white)),
            ),
            Row(
              children: [
                const SizedBox(height: 70),
                const Text(
                  'Gender',
                  style: TextStyle(color: Colors.white),
                ),
                DropdownButton2(
                  items: Gender.map(
                    (String gender) => DropdownMenuItem<String>(
                      value: gender,
                      child: Text(
                        gender,
                        style: const TextStyle(
                            fontSize: 14, color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                  ).toList(),
                  value: selectedValue,
                  onChanged: (String? value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    height: 40,
                    width: 170,
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    height: 40,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            OutlinedButton(
              onPressed: () {
                 username = _usernameController1.text;
                 password = _passwordController1.text;
                email = _emailController1.text;
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const Home()));
              },
              child: const Text(
                'Save Changes',
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