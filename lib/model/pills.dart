import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid= Uuid();

class pills {
  final String id;
  final String pillName;
  final TimeOfDay formatter; 

pills(  
 {required this.pillName,required this.formatter}):id = uuid.v4();



}
