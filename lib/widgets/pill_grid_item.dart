import 'package:flutter/material.dart';
import 'package:medi_mind/data/dummyData.dart';
import 'package:medi_mind/model/pills.dart';
import 'package:medi_mind/pills_screen.dart';

class PillsList extends StatefulWidget {
  const PillsList({
    super.key, required this.pill_list,
  });

 final List<pills>? pill_list;
  @override
  State<PillsList> createState() => _PillsListState();
}

class _PillsListState extends State<PillsList> {
 
 

  @override
  Widget build(BuildContext context) {
   
    return Expanded(child:
    availablePills.isEmpty? const Center(child: 
     Text('You havent added any pills yet')):
     ListView.builder(itemBuilder: (context,index)=> 
     PillsScreen(title: widget.pill_list![index].pillName, Pill_item: widget.pill_list![index])
     ,
     itemCount: availablePills.length,
     )
    
    );
  }
}