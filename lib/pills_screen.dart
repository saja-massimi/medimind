import 'package:flutter/material.dart';
import 'package:medi_mind/eachPill.dart';
import '../model/pills.dart';



class PillsScreen extends StatefulWidget {
  const PillsScreen({super.key, required this.title, required this.Pill_item
  
  });
final String title;
final pills Pill_item;

  @override
  State<PillsScreen> createState() => _PillsScreenState();
}

class _PillsScreenState extends State<PillsScreen> {
  bool ischecked = false;
  @override
  Widget build(BuildContext context) {
    return   InkWell(
      
      onTap: (){ 
        Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>   eachPill(pillItem: widget.Pill_item)));
      },
      child: Card(
          child: Padding(
          padding:  EdgeInsets.fromLTRB(5, 10, 15, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Text(widget.Pill_item.pillName),
        const SizedBox(height: 4,),
        Row(
            children: [
              Text(widget.Pill_item.formatter),
            const Spacer(),
              Checkbox(value: ischecked, 
              onChanged: (bool? flag){
                setState(() {
                   ischecked= flag!;
                });
              
               
              })
            ],
        )
      ],
        ),
      ),
      
      
        
      
      
      ),
    );
  }
}