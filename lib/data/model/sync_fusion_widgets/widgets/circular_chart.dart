import 'package:flutter/material.dart';
import 'package:niveles_formacion/data/model/sync_fusion_items/sync_fusion_widget_item.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'chartData.dart';

class CircularChart extends StatelessWidget{
  @override
  CircularChart(
      this.syncFusionItem,
      [this.backgroundColor = Colors.white,
      this.title = "Titulo por defecto",
        this.list = const []]);

  final Color backgroundColor;
  final String title;
  final List<ChartData> list;
  final SyncFusionWidget syncFusionItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                width: 480,
                height: 560,
                child: SfCircularChart(
                  backgroundColor: syncFusionItem.backgroundColor,
                  // Chart title text
                    title: ChartTitle(text: syncFusionItem.title),
                    legend: Legend(isVisible: true),
                    series: <CircularSeries>[
                      // Render pie chart
                      PieSeries<ChartData, String>(
                          dataSource: syncFusionItem.rawList,
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
