import 'package:flutter/material.dart';

class addMed extends StatefulWidget {
  const addMed({super.key});

  @override
  State<addMed> createState() => _addMedState();
}

class _addMedState extends State<addMed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
appBar: AppBar(
  backgroundColor: Colors.brown,
title: const Text('Add a New Medicine'),

),
        body: Container(
padding: const EdgeInsets.all(20),
child:   Column(
              children: [

                const SizedBox(height: 20),

                const TextField(
                decoration: InputDecoration(
                labelText: 'Medicine Name',
                labelStyle: TextStyle(color: Colors.white),
               
                ),
                ),

              const SizedBox(height: 10),

              const TextField(
              decoration:  InputDecoration(labelText: "Enter daily dose"
              ,labelStyle: TextStyle(color: Colors.white),),
              keyboardType: TextInputType.number,
              
            ),
             const SizedBox(height: 10),

             Row(
                children: [
                  const Text('Start Date'),
                  IconButton(onPressed: (){
                    showDatePicker(context: context,
                     firstDate: DateTime.now(), 
                     lastDate: DateTime(2035)).then((value) => null);
                    },
                     icon: const Icon(Icons.calendar_month)),
                  const SizedBox(width: 10),
                   const Text('End Date'),
                   IconButton(onPressed: (){
                    showDatePicker(context: context,
                     firstDate: DateTime.now(), 
                     lastDate: DateTime(2027));
                    }, 
                    icon: const Icon(Icons.calendar_month)),
                ],
              ),

              ],
            ),

        ),


    );
  }
}