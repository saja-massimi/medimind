import 'package:flutter/material.dart';

import '../model/pills.dart';

List<pills> availablePills = [
  pills(
      pillName: 'Panadol',
      formatter: TimeOfDay.now(),
      date: DateTime(2024),
      isTaken: false),
  pills(
      pillName: 'Brufen',
      formatter: const TimeOfDay(hour: 3, minute: 36),
      date: DateTime(2024),
      isTaken: false),
  pills(
      pillName: 'Pill3',
      formatter: const TimeOfDay(hour: 7, minute: 30),
      date: DateTime(2024),
      isTaken: false)
];
