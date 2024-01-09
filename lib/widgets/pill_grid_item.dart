import 'package:flutter/material.dart';
import 'package:medi_mind/data/dummyData.dart';
import 'package:medi_mind/model/pills.dart';
import 'package:medi_mind/pills_screen.dart';

class PillsList extends StatelessWidget {
  const PillsList({
    super.key,
    required this.pill_list,
    required this.onRemovePill,
  });

  final List<pills> pill_list;
  final void Function(pills Pill) onRemovePill;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: availablePills.isEmpty
            ? const Center(child: Text('You havent added any pills yet'))
            : ListView.builder(
                itemBuilder: (context, index) => Dismissible(
                  key: ValueKey(pill_list[index]),
                  onDismissed: (direction) => onRemovePill(pill_list[index]),
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  child: PillsScreen(
                    title: pill_list[index].pillName,
                    pillItem: pill_list[index],
                    isTaken: false,
                    pillColor: const Color.fromARGB(221, 255, 255, 255),
                  ),
                ),
                itemCount: availablePills.length,
              ));
  }
}
