import 'dart:ui';
import 'package:dashboard/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'widgets/circular_chart.dart';
import 'sync_fusion_widget_item_options.dart';

abstract class SyncFusionWidgetItem extends DashboardItem{

  @override
  SyncFusionWidgetItem({
    required super.width,
    required super.height,
    required super.identifier,
    required this.widget,
    required this.options,
});

  Widget widget;
  SyncFusionWidgetItemOptions options;


}