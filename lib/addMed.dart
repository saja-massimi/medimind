import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medi_mind/model/pills.dart';

final List<String> Timely = ['Day', 'Month', 'Year'];
String? selectedValue;

final List<String> Numbers = [
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
  ' 10'
];
var seen = Set<String>();
List<String> uniqueList =
    Numbers.where((numbers) => seen.add(numbers)).toList();

String? selectedValue1;

class addMed extends StatefulWidget {
  const addMed({Key? key, required this.onAddPill});
  final void Function(pills pill) onAddPill;

  @override
  State<addMed> createState() => _addMedState();
}

class _addMedState extends State<addMed> {
  final TextEditingController _medNameController = TextEditingController();
  final formatter = DateFormat().add_yMd();
  TimeOfDay? _selectedTime;

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
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2035),
                      initialDate: DateTime(2024),
                    ).then((value) => null);
                  },
                  icon: const Icon(Icons.calendar_month),
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
              ],
            ),
            Row(
              children: [
                const SizedBox(height: 70),
                const Text(
                  'Repeat',
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
                    widget.onAddPill(pills(
                        pillName: _medNameController.text,
                        formatter: _selectedTime!,
                        date: DateTime(2024),
                        isTaken: false));
                    Navigator.pop(context);
                  },
                  child: const Text('Save'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
