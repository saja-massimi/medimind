import 'package:flutter/material.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:medi_mind/model/pills.dart';

class Charts extends StatelessWidget {
  final List<pills> availablePills;

  Charts(this.availablePills);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bar Chart Page'),
        backgroundColor: Colors.brown,
      ),
      body: Container(
        // Wrap the Scaffold with Container for background color
        color: Colors.brown.shade100, // Set your desired background color
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: charts.BarChart(
            _createBarData(),
            animate: true,
          ),
        ),
      ),
    );
  }

  List<charts.Series<OrdinalSales, String>> _createBarData() {
    final Map<String, int> totalPills = {};

    for (var pill in availablePills) {
      totalPills['Total Pills'] = (totalPills['Total Pills'] ?? 0) + 1;
    }

    final List<OrdinalSales> data = totalPills.entries.map((entry) {
      return OrdinalSales(entry.key, entry.value);
    }).toList();

    return [
      charts.Series<OrdinalSales, String>(
        id: 'Total Pills',
        domainFn: (OrdinalSales sales, _) => sales.label,
        measureFn: (OrdinalSales sales, _) => sales.count,
        data: data,
      )
    ];
  }
}

class OrdinalSales {
  final String label;
  final int count;

  OrdinalSales(this.label, this.count);
}
