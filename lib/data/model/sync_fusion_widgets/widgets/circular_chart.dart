import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CircularChart extends StatelessWidget{
  @override
  CircularChart(
  [this.backgroundColor = Colors.white,
    this.title = "Titulo por defecto"]);

  final Color backgroundColor;
  final String title;

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
                    series: <CircularSeries>[
                      // Render pie chart
                      PieSeries<ChartData, String>(
                          dataSource: [
                            // Bind data source
                            ChartData('Jan', 35),
                            ChartData('Feb', 28),
                            ChartData('Mar', 34),
                            ChartData('Apr', 32),
                            ChartData('May', 40)
                          ],
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y
                      )
                    ]
                )
            )
        )
    );
  }
}

class ChartData{
  ChartData(this.x,this.y);

  final String x;
  final int y;
  
}