import 'package:flutter/material.dart';
import 'package:medi_mind/addMed.dart';
import 'package:medi_mind/data/dummyData.dart';
import 'package:medi_mind/model/pills.dart';
import 'package:medi_mind/widgets/pill_grid_item.dart';


class Home extends StatefulWidget {
   Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {
  void _removePill(pills pill)
  {

    setState(() {
      availablePills.remove(pill);
    });
  }
  void _addPills(pills pill){
    setState(() {
      availablePills.add(pill);
    });

  }
  
  @override
  Widget build(BuildContext context) {

  
    return  Scaffold(
      backgroundColor: Colors.brown,
     appBar: AppBar(

        backgroundColor: Colors.brown,
        title: const Text('Pill Reminder'), 
  
      ),
      
      body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Expanded(child: PillsList(pill_list: availablePills, onRemovePill: _removePill,)),
        
        ],
          ),
      ),

      floatingActionButton:   FloatingActionButton(
                  onPressed: () {
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>   addMed(onAddPill: _addPills)));
                  },
                
                  backgroundColor: Colors.brown.shade300, 
                  foregroundColor: Colors.brown.shade700,
                  hoverColor: Colors.brown,
                  child: const Icon(Icons.add),
                ),
  
    );
  }
}

