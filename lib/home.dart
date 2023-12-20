
import 'package:flutter/material.dart';
import 'package:medi_mind/addMed.dart';
import 'package:medi_mind/data/dummyData.dart';
import 'package:medi_mind/widgets/pill_grid_item.dart';


class Home extends StatelessWidget {
  const Home({super.key});
  
  @override
  Widget build(BuildContext context) {

  
    return  Scaffold(
      backgroundColor: Colors.brown,
     appBar: AppBar(

        backgroundColor: Colors.brown,
        title: const Text('Pill Reminder'), 
  
      ),
      body: Container(
         
        child: GridView(
          
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
          
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1
          
          ),
         
          children: [
            for(final pill in availablePills)
            PillGridItem(Pills:pill ),
            
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