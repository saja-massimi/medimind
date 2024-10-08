import 'package:flutter/material.dart';
import 'package:medi_mind/UserProfile.dart';
import 'package:medi_mind/addMed.dart';
import 'package:medi_mind/calendar.dart';
import 'package:medi_mind/charts.dart';
import 'package:medi_mind/data/dummyData.dart';
import 'package:medi_mind/model/pills.dart';
import 'package:medi_mind/widgets/pill_grid_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  void _removePill(pills pill) {
    setState(() {
      availablePills.remove(pill);
    });
  }

  void _addPills(pills pill) {
    setState(() {
      availablePills.add(pill);
    });
  }
 
 


 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('Your Profile'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Profile()));
                  }),
              ListTile(
                leading: const Icon(Icons.calendar_month_outlined),
                title: const Text('Calender'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CalendarPage(pillsList: availablePills))
                              
                              );
                },
              ),
             ListTile(
                leading: const Icon(Icons.bar_chart),
                title: const Text('Stats'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Charts(availablePills)));
                },
              )
,
                ListTile(
                leading: const Icon(Icons.exit_to_app),
                title: const Text('Sign Out'),
                onTap: () {
                  FirebaseAuth.instance.signOut(); 
                  
                },
              )




            ],
          ),
        ),
        backgroundColor: Colors.brown,
        appBar: AppBar(
          backgroundColor: Colors.brown,
          title: const Text('Pill Reminder'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: PillsList(
                pill_list: availablePills,
                onRemovePill: _removePill,
              )),
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => addMed(
                            onAddPill: _addPills,
                          )),
                );
              },
              backgroundColor: Colors.brown.shade300,
              foregroundColor: Colors.brown.shade700,
              hoverColor: Colors.brown,
              child: const Icon(Icons.add),
            ),
          ],
        ));
  }
}
