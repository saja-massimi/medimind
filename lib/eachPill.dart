import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medi_mind/addMed.dart';
import 'package:medi_mind/data/dummyData.dart';
import 'package:medi_mind/model/pills.dart';
import 'package:medi_mind/pills_screen.dart';

class eachPill extends StatefulWidget {
   eachPill({super.key, required this.pillItem});


  final pills pillItem;

  @override
  State<eachPill> createState() => _eachPillState();
}

class _eachPillState extends State<eachPill> {
  final TextEditingController _medNameController = TextEditingController();
  final formatter = DateFormat().add_yMd();
  TimeOfDay? _selectedTime;
  DateTime? _selectedDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        title: Text(widget.pillItem.pillName),
        backgroundColor: Colors.brown,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 10),
            TextField(
              controller: _medNameController,
              decoration: const InputDecoration(
                labelText: 'Medicine Name',
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Enter daily dose",
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 50),
            Row(
              children: [
                const Text(
                  'Start Date',
                  style: TextStyle(color: Colors.white),
                ),
                IconButton(
                  onPressed: () async{
               final  DateTime? pickedDate= await showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2035),
                      initialDate: DateTime.now(),
                    );
                     setState(() {
                _selectedDate = pickedDate;
              });
               
                  },
                  icon: const Icon(Icons.calendar_month),
                 
                
                ),
                Text(_selectedDate==null?'':
      
                DateFormat().add_yMd().format(_selectedDate!)
                
                ),
                const SizedBox(width: 10),
                const Text(
                  'Time',
                  style: TextStyle(color: Colors.white),
                ),
                IconButton(
                  onPressed: () async {
                    final selectedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (selectedTime != null) {
                      setState(() {
                        _selectedTime = selectedTime;
                      });
                    }
                  },
                  icon: const Icon(Icons.access_time),
                ),
                Text(_selectedTime==null? '':           
                DateFormat.Hm().format(DateTime(2024,1,1,_selectedTime!.hour,_selectedTime!.minute))

                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(height: 70),
                const Text(
                  ' Repeat ',
                  style: TextStyle(color: Colors.white),
                ),
                DropdownButton2(
                  items: Numbers.map(
                    (String numbers) => DropdownMenuItem(
                      value: numbers,
                      child: Text(numbers),
                    ),
                  ).toList(),
                  value: selectedValue1,
                  onChanged: (String? value) {
                    setState(() {
                      selectedValue1 = value;
                    });
                  },
                ),
                const Text(
                  'Times a',
                  style: TextStyle(color: Colors.white),
                ),
                DropdownButton2(
                  items: Timely.map(
                    (String timely) => DropdownMenuItem<String>(
                      value: timely,
                      child: Text(
                        timely,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
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
                    width: 100,
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    height: 40,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(width: 100),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    
                      /*  void _navigateToSecondPage() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SecondPage(dataFromFirstPage: dataFromSecondPage),
      ),
    );

    // When the second page is popped, the updated value will be received here
    setState(() {
      dataFromSecondPage = result ?? dataFromSecondPage; // Update with the new value or keep the old value
    });
  }*/
                   setState(() {
                      
                      
                      widget.pillItem.pillName = _medNameController.text;
                      widget.pillItem.date = _selectedDate!;
                      widget.pillItem.formatter = _selectedTime!;
                      widget.pillItem.isTaken = false;
                      
Navigator.pop(context, widget.pillItem);

                         });
                    
                   
                  },
                  child: const Text('Save Changes'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
