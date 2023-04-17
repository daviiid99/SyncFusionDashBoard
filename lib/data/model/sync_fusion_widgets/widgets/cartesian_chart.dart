import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';
import 'chartData.dart';

class CartesianChart extends StatelessWidget{
  @override
  const CartesianChart(this.list, [this.backgroundColor =  Colors.white, this.title = "Titulo por defecto"] );

  final Color backgroundColor;
  final String title;
  final List<ChartData> list;

  @override
  Widget build (BuildContext context){

    return  SfCartesianChart(
      backgroundColor: backgroundColor,
      title: ChartTitle(text: title),
      legend: Legend(isVisible: true),
      primaryXAxis: CategoryAxis(),
      series: <ChartSeries>[
        // Initialize line series
        LineSeries<ChartData, String>(
          dataSource: list,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
        )
      ],
    );
  }
}
