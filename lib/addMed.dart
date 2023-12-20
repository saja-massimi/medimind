import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class addMed extends StatefulWidget {
  const addMed({super.key});

  @override
  State<addMed> createState() => _addMedState();
}

class _addMedState extends State<addMed> {
DateTime? _selectedDate;
DateTime? _lastSelectedDate; 
final formatter = DateFormat().add_yMd();

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
                 const  Text('Start Date'),
                  const SizedBox(width: 10),
                  Text(_selectedDate==null?'No Date Selected':  formatter.format(_selectedDate!)),
                  IconButton(onPressed:  ()async{

                   final DateTime? pickedDate = await showDatePicker
                   (context: context,
                     firstDate: DateTime.now(), 
                     lastDate: DateTime(2035));
                      setState(() {
                        _selectedDate = pickedDate;
                      });
                    },
                   icon: const Icon(Icons.calendar_month)),
                  const SizedBox(width: 10),
                   const Text('End Date'),
                    const SizedBox(width: 10),
                  Text(_lastSelectedDate==null?'No Date Selected':  formatter.format(_lastSelectedDate!)),
                   IconButton(onPressed: ()async{
                    final DateTime? lastPickedDate=await showDatePicker(context: context,
                     firstDate: DateTime.now(), 
                     lastDate: DateTime(2027));
                     setState(() {
                       _lastSelectedDate = lastPickedDate;
                     });
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