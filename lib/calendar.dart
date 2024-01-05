import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:medi_mind/model/pills.dart';

class CalendarPage extends StatefulWidget {
  final List<pills> pillsList;

  const CalendarPage({Key? key, required this.pillsList}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late CalendarFormat _calendarFormat;
  late DateTime _focusedDay;
  late DateTime _selectedDay;

  List<Color> pillColors = [
    const Color.fromARGB(255, 212, 243, 33),
    const Color.fromARGB(255, 3, 131, 15),
    Color.fromARGB(255, 103, 105, 103),
  ];

  @override
  void initState() {
    super.initState();
    _calendarFormat = CalendarFormat.month;
    _focusedDay = DateTime.now();
    _selectedDay = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 172, 170, 170),
      appBar: AppBar(
        title: const Text('Calendar'),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: Column(
        children: [
          TableCalendar(
            calendarFormat: _calendarFormat,
            focusedDay: _focusedDay,
            firstDay: DateTime.utc(2023, 1, 1),
            lastDay: DateTime.utc(2024, 12, 31),
            startingDayOfWeek: StartingDayOfWeek.sunday,
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            calendarStyle: const CalendarStyle(
              selectedDecoration: BoxDecoration(
                color: Colors.blue,
              ),
              todayDecoration: BoxDecoration(
                color: Colors.red,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Selected Day: ${DateFormat('yyyy-MM-dd').format(_selectedDay)}',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: widget.pillsList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(widget.pillsList[index].pillName),
                  tileColor: pillColors[index % pillColors.length],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
