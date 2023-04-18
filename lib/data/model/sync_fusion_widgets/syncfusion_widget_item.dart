import 'dart:ui';
import 'package:dashboard/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'widgets/circular_chart.dart';
import 'sync_fusion_widget_item_options.dart';
import 'widgets/chartData.dart';

abstract class SyncFusionWidgetItem extends DashboardItem{

  @override
  SyncFusionWidgetItem({
    required super.width,
    required super.height,
    required this.title,
    required this.backgroundColor,
    required this.rawList,
    required super.identifier,
    required this.widget,
    required this.widgetType,
    required this.options,
});

  SyncFusionWidgetItemOptions options;
  Widget? widget;
  String widgetType;
  String title;
  Color backgroundColor;
  List<ChartData> rawList;



}