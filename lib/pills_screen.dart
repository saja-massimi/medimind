import 'package:flutter/material.dart';

import '../model/pills.dart';



class PillsScreen extends StatelessWidget {
  const PillsScreen({super.key, required this.title, required this.Pills
  
  });
final String title;
final List<pills> Pills;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(title: Text(title), 
      backgroundColor: Colors.brown,
       ),
      body: const SingleChildScrollView(
        child: Card(
          child: InkWell(
            child: Stack(
              children: [
        //ADD EVERY PILL DETAIL
        Text('hi name is saja'),
              ],
            ),
          )
        ),
      ),


    );
  }
}