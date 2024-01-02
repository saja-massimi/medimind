import 'package:flutter/material.dart';

import '../model/pills.dart';

 List<pills> availablePills = [
pills(

  pillName: 'Panadol',
  formatter: TimeOfDay.now(),

),
pills(
 
  pillName:  'Brufen',
   formatter: const TimeOfDay(hour: 3, minute: 36),
),
pills (
pillName: 'Pill3',
formatter: const TimeOfDay(hour: 7, minute: 30)
 

)


];