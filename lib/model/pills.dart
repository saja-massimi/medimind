import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class pills {
  final String id;
  late  String pillName;
  late  TimeOfDay formatter;
  late  bool isTaken;
  late  DateTime date;

  pills(
      {required this.date,
      required this.isTaken,
      required this.pillName,
      required this.formatter})
      : id = uuid.v4();
}
