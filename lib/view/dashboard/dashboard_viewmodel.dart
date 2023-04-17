import 'package:dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:niveles_formacion/data/model/sync_fusion_widgets/sync_fusion_widget_item_options.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../data/model/sync_fusion_items/sync_fusion_widget_item.dart';
import '../../data/model/sync_fusion_items/sync_fusion_widget_item_options.dart';
import '../../data/model/sync_fusion_widgets/widgets/circular_chart.dart';
import '../../data/model/sync_fusion_widgets/widgets/cartesian_chart.dart';
import '../../data/model/sync_fusion_widgets/widgets/chartData.dart';

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
  String selectedWidgetID = "";
  List<String> selectedWidgetsID = [];
  bool editModeEnabled = false;
  List<TextEditingController> xElements = [
    TextEditingController(text: ""),
    TextEditingController(text: ""),
    TextEditingController(text: ""),
    TextEditingController(text: ""),

  ];
  List<TextEditingController> yElements = [
    TextEditingController(text: ""),
    TextEditingController(text: ""),
    TextEditingController(text: ""),
    TextEditingController(text: ""),
  ];

  List<ChartData> rawlist = [];

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
        rawlist,
        backgroundColor,
        title,

    );
    } else if (selectedWidget == "Cartesian Chart"){
      return CartesianChart (
          rawlist,
          backgroundColor,
          title,
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

  createDataList() async {
    // A method to combine both TextEditingController lists
    // Into a data list for the target widget

    if (selectedWidget == "Circular Chart"){
      int counter = 0;

      while(counter < xElements.length){
        ChartData currentRow = ChartData(xElements[counter].text, int.parse(yElements[counter].text));
        rawlist.add(currentRow);
        counter ++;
      }
      counter = 0;
      notifyListeners();
    }
  }

  addWidgetToDashBoard() async {
    await createDataList();
    SyncFusionWidget current = await createWidget();
    try{
      dashboardItemController.add(current); // First, create widget with given attributes
    } catch (e){
      print(e);
    }
  }

  deleteSelectedWidget() {
    // This method rmeoves current widget from controller

    for (String id in selectedWidgetsID){
      dashboardItemController.delete(id);
    }

    selectedWidgetID = "";
    selectedWidgetsID = [];
    notifyListeners();
  }

  void changeEditMode() {
    dashboardItemController.isEditing ? editModeEnabled = false : editModeEnabled = true;
    dashboardItemController.isEditing ? dashboardItemController.isEditing = false : dashboardItemController.isEditing = true;
    notifyListeners();
  }

}
