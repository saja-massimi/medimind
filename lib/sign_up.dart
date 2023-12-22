import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:medi_mind/home.dart';

final List<String> Gender = ['female', 'male', 'prefer not to say'];
String? selectedValue;

// ignore: camel_case_types
class sign_up extends StatefulWidget {
  const sign_up({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _Sign_up createState() => _Sign_up();
}

// ignore: camel_case_types
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
                // Implement sign-up logic here
                String email = _usernameController.text;
                String password = _passwordController.text;
                // ignore: non_constant_identifier_names
                String phone_number = _phoneController.text;
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Home()));
                // Perform sign-up operations
                // ignore: avoid_print
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
