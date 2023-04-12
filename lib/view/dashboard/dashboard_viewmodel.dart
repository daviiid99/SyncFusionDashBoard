import 'package:dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:niveles_formacion/data/model/sync_fusion_widgets/sync_fusion_widget_item_options.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../data/model/sync_fusion_items/sync_fusion_widget_item.dart';
import '../../data/model/sync_fusion_items/sync_fusion_widget_item_options.dart';
import '../../data/model/sync_fusion_widgets/widgets/circular_chart.dart';
import '../../data/model/sync_fusion_widgets/widgets/cartesian_chart.dart';

class DashboardViewModel extends BaseViewModel implements Initialisable {
  DashboardItemController<SyncFusionWidget> dashboardItemController =
      DashboardItemController(
          items: []);

  // Widget creation variables
  TextEditingController titleController = TextEditingController(text: "");
  TextEditingController identifierController = TextEditingController(text: "");
  TextEditingController uidController = TextEditingController(text: "");
  String title = "";
  String identifier = "";
  String uid = "";
  Color backgroundColor = Colors.purpleAccent;
  int width = 4;
  int height = 4;
  int selectedWidth = 0;
  int selectedHeight = 0;
  String selectedWidget = "Circular Chart";


  List<DropdownMenuItem<int>> widthValues = [
    DropdownMenuItem(child: Text("0"),value: 0),
    DropdownMenuItem(child: Text("1"),value: 1),
    DropdownMenuItem(child: Text("2"),value: 2),
    DropdownMenuItem(child: Text("3"),value: 3),
    DropdownMenuItem(child: Text("4"),value: 4),
    DropdownMenuItem(child: Text("5"),value: 5),
    DropdownMenuItem(child: Text("6"),value: 6),
    DropdownMenuItem(child: Text("7"),value: 7),
    DropdownMenuItem(child: Text("8"),value: 8),
  ];

  List<DropdownMenuItem<int>> heightValues = [
    DropdownMenuItem(child: Text("0"),value: 0),
    DropdownMenuItem(child: Text("1"),value: 1),
    DropdownMenuItem(child: Text("2"),value: 2),
    DropdownMenuItem(child: Text("3"),value: 3),
    DropdownMenuItem(child: Text("4"),value: 4),
    DropdownMenuItem(child: Text("5"),value: 5),
    DropdownMenuItem(child: Text("6"),value: 6),
    DropdownMenuItem(child: Text("7"),value: 7),
    DropdownMenuItem(child: Text("8"),value: 8),
  ];

  List<DropdownMenuItem<String>> syncFusionValues = [
    DropdownMenuItem(child: Text("Circular Chart"),value: "Circular Chart"),
    DropdownMenuItem(child: Text("Cartesian Chart"),value: "Cartesian Chart"),
  ];


  @override
  void initialise(){
  }


  getWidget(){
    if(selectedWidget == "Circular Chart") {
      return CircularChart (
      backgroundColor,
      title
    );
    } else if (selectedWidget == "Cartesian Chart"){
      return CartesianChart (
          backgroundColor,
          title
      );
    }
  }


  Future<SyncFusionWidget> createWidget() async {
    // This method allow user to create a widget of his preferences
    return SyncFusionWidget(
      width: width,
      height: height,
      identifier: identifier,
      options: SyncFusionOptions(uid: uid),
      widget: getWidget(),
    );
  }

  addWidgetToDashBoard() async {
    SyncFusionWidget current = await createWidget();
    try{
      dashboardItemController.add(current); // First, create widget with given attributes
    } catch (e){
      print(e);
    }
  }

  void changeEditMode() {
    dashboardItemController.isEditing ? dashboardItemController.isEditing = false : dashboardItemController.isEditing = true;
    notifyListeners();
  }

}
