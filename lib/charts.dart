import 'dart:js_interop';
import 'dart:math';

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:flutter/material.dart';

import 'package:medi_mind/model/pills.dart';

class Charts extends StatelessWidget {
   List<pills> availablePills;


  Charts(this.availablePills);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bar Charts'),
        backgroundColor: Colors.brown,
      ),
      body: 
      
      Column(
        
        
        children: [
          //Initialize the chart widget
          SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              // Chart title
              title: const ChartTitle(text: 'Pills Adherence'),
              // Enable legend
              legend: const Legend(isVisible: true),
              // Enable tooltip
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <CartesianSeries<pills, String>>[
                LineSeries<pills, String>(
                    dataSource: availablePills,
                    xValueMapper: (pills pill1, _) => pill1.pillName,
                    yValueMapper: (pills pill1, _) => 1,
                    name: 'Pills',
                    // Enable data label
                    dataLabelSettings: const DataLabelSettings(isVisible: true))
              ]),
         
        ])
    );
  }
}
    


  class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}

