import 'package:flutter/cupertino.dart';
import 'package:niveles_formacion/data/model/sync_fusion_items/sync_fusion_widget_item.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';
import 'chartData.dart';

class CartesianChart extends StatelessWidget{
  @override
  const CartesianChart(
      this.item,
      [this.backgroundColor =  Colors.white,
        this.title = "Titulo por defecto",
        this.list = const []]);

  final SyncFusionWidget item;
  final Color backgroundColor;
  final String title;
  final List<ChartData> list;

  @override
  Widget build (BuildContext context){

    return  SfCartesianChart(
      backgroundColor: item.backgroundColor,
      title: ChartTitle(text: item.title),
      legend: Legend(isVisible: true),
      primaryXAxis: CategoryAxis(),
      series: <ChartSeries>[
        // Initialize line series
        LineSeries<ChartData, String>(
          dataSource: item.rawList,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
        )
      ],
    );
  }
}
