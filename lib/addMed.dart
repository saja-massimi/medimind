import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum Category { day, month, year }

enum Numbers { one, two, three, four, five, six, seven, eight, nine, ten }

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
        child: Column(
          children: [
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Medicine Name',
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 40),
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
                              initialDate: DateTime(2024))
                          .then((value) => null);
                    },
                    icon: const Icon(Icons.calendar_month)),
                const SizedBox(width: 10),
                const Text('End Date', style: TextStyle(color: Colors.white)),
                IconButton(
                  onPressed: () {
                    showDatePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2027),
                        initialDate: DateTime(2024));
                  },
                  icon: const Icon(Icons.calendar_month),
                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(height: 70),
                const Text(
                  'Times a',
                  style: TextStyle(color: Colors.white),
                ),
                DropdownButton(
                    items: Category.values
                        .map(
                          (category) => DropdownMenuItem(
                            value: category,
                            child: Text(
                              category.name.toString(),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {}),
                const Text(
                  ' Repeat ',
                  style: TextStyle(color: Colors.white),
                ),
                DropdownButton(
                    items: Numbers.values
                        .map(
                          (numbers) => DropdownMenuItem(
                            value: numbers,
                            child: Text(
                              numbers.name.toString(),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {}),
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
                    'cancel',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      print(Category.values);
                      print(Numbers.values);
                      Navigator.pop(context);
                    },
                    child: const Text('save'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
