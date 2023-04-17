import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'chartData.dart';

class CircularChart extends StatelessWidget{
  @override
  CircularChart(
      this.list, [this.backgroundColor = Colors.white,
    this.title = "Titulo por defecto"]);

  final Color backgroundColor;
  final String title;
  final List<ChartData> list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                width: 480,
                height: 560,
                child: SfCircularChart(
                  backgroundColor: backgroundColor,
                  // Chart title text
                    title: ChartTitle(text: title),
                    legend: Legend(isVisible: true),
                    series: <CircularSeries>[
                      // Render pie chart
                      PieSeries<ChartData, String>(
                          dataSource: list,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y,
                          dataLabelSettings:DataLabelSettings(isVisible : true)
                      )
                    ]
                )
            )
        )
    );
  }
}
