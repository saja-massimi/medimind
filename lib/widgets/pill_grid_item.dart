import 'package:flutter/material.dart';
import 'package:medi_mind/pills_screen.dart';

import '../model/pills.dart';

class PillGridItem extends StatelessWidget {
  const PillGridItem({super.key, required this.Pills});
final pills Pills;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
        
        Navigator.of(context).push(
          MaterialPageRoute(builder: (ctx)=>PillsScreen(
            title:Pills.pillName,
            Pills: const[],
          )
         )
        );
      },
    splashColor: Theme.of(context).primaryColor,
    borderRadius: BorderRadius.circular(16),

      child: Container(
  
        decoration:  BoxDecoration(
      
           borderRadius: BorderRadius.circular(16),
          gradient:  
        LinearGradient(colors: [
          Colors.grey.withOpacity(0.54),
          Colors.grey.withOpacity(0.9),
        ],
        begin: Alignment.topLeft,   
        end: Alignment.bottomRight 
        )),
        child: Text(Pills.pillName)
        
        ),
    );
  }
}