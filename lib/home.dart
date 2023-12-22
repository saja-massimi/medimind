import 'package:flutter/material.dart';
import 'package:medi_mind/addMed.dart';
import 'package:medi_mind/data/dummyData.dart';
import 'package:medi_mind/widgets/pill_grid_item.dart';


class Home extends StatelessWidget {
   Home({super.key});
 
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
        Expanded(child: PillsList(pill_list: availablePills)),
        
        ],
          ),
      ),

      floatingActionButton:   FloatingActionButton(
                  onPressed: () {
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>  const addMed()));
                  },
                
                  backgroundColor: Colors.brown.shade300, 
                  foregroundColor: Colors.brown.shade700,
                  hoverColor: Colors.brown,
                  child: const Icon(Icons.add),
                ),
  
    );
  }
}

