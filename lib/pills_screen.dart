import 'package:flutter/material.dart';
import 'package:medi_mind/data/dummyData.dart';
import 'package:medi_mind/eachPill.dart';
import 'package:medi_mind/widgets/pill_grid_item.dart';
import '../model/pills.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PillsScreen extends StatefulWidget {


  
  PillsScreen({
    Key? key,
    required this.title,
    required this.pillItem,
    required this.isTaken,
    required this.pillColor,
  }) : super(key: key);

  final String title;
  final pills pillItem;
  bool isTaken;
  final Color pillColor;


  @override
  State<PillsScreen> createState() => _PillsScreenState();
}

class _PillsScreenState extends State<PillsScreen> {
  bool isTaken=false;



  

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => eachPill(
                pillItem: widget.pillItem, ),
          ),
        );
      },
      child: Card(
        color: widget.pillColor,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5, 10, 15, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.pillItem.pillName),
              const SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  Text(widget.pillItem.formatter.format(context)),
                  const Spacer(),
                  Checkbox(
                    value: isTaken,
                    onChanged: (bool? flag) {
                      setState(() {
                      isTaken  = flag!;
                      

                      });
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
