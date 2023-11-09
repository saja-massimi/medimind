
import 'package:flutter/material.dart';

class Sign_In extends StatelessWidget {
  const Sign_In({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
  
 backgroundColor: Colors.brown,
         body: Center(
           child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Padding( 
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset('images/logo.png',width: 200,height: 200,),
                ),
              const Padding (
                 padding:  EdgeInsets.all(20.0),
                 child:  TextField(decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Username',)),
               ),
            const  Padding(
                padding:  EdgeInsets.all(20.0),
                child:   TextField(obscureText: true,decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Password'),),
              ),

                const Padding(padding: EdgeInsets.all(20),
                child: TextButton(onPressed:null, child: Text('Sign in')),

              )

            ],
           ),
         ),

    );
  }
}