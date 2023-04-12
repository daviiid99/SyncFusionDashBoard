import 'package:flutter/material.dart';
import 'package:niveles_formacion/data/model/sync_fusion_items/sync_fusion_widget_item.dart';
import 'package:niveles_formacion/view/dashboard_item/dashboard_item_viewmodel.dart';
import 'package:stacked/stacked.dart';

class DashboardItemView extends StackedView {
  const DashboardItemView(this.item, {super.key});

  final SyncFusionWidget  item;

  @override
  Widget builder(
      BuildContext context, ChangeNotifier viewModel, Widget? child) {
    return Container(color: Colors.blue);
  }

  @override
  ChangeNotifier viewModelBuilder(BuildContext context) => DashboardItemViewModel();
}