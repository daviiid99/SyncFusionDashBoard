import 'package:flutter/material.dart';
import 'package:niveles_formacion/data/model/sync_fusion_items/sync_fusion_widget_item.dart';
import 'package:niveles_formacion/view/dashboard/dashboard_viewmodel.dart';
import 'package:niveles_formacion/view/dashboard/widgets/propertiesDialog.dart';

class ActionDialog extends StatelessWidget{
  @override
  const ActionDialog({
    required this.viewModel,
    required this.item,
    super.key});

  final DashboardViewModel viewModel;
  final SyncFusionWidget item;

  @override
  Widget build(BuildContext context){

    return Scaffold(
      body: Stack(
        children: [
          // Background Theme
          const BackgroundTheme(),

          // Elevated Menu
          ElevatedMenu(viewModel: viewModel, item: item,),
        ],
      ),
    );
  }
}

class BackgroundTheme extends StatelessWidget{
  @override
  const BackgroundTheme({super.key});

  @override
  Widget build(BuildContext context){
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.white
      ),
    );
  }
}

class ElevatedMenu extends StatelessWidget{
  @override
  const ElevatedMenu({
    required this.item,
    required this.viewModel,
    super.key});

  final DashboardViewModel viewModel;
  final SyncFusionWidget item;

  @override
  Widget build(BuildContext context){

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.maxFinite,
      height: height * 0.4,
      margin: EdgeInsets.only(top: height * 0.2, bottom: height * 0.2),
      child: Column(
        children: [
          // Edit Button
          Container(
            width: double.maxFinite,
            height: height * 0.16,
            margin: EdgeInsets.only(top: height * 0.03, bottom: height * 0.02, left: width * 0.05, right: width * 0.05 ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30)
              ),
              child : TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.orangeAccent.withOpacity(0.7)
                ),
                onPressed : (){
                  // Allow editing of selected widget
                  viewModel.enableActionMenu = false;
                  viewModel.cleanPropertiesDialog();
                  viewModel.reverseChartDataToLists(item.rawList);
                  PropertiesDialog editDialog = PropertiesDialog(viewModel, true, item);
                  editDialog.menuOptions(context);
                  // Just force refresh inside alertdialog to display changes
                  (context as Element).reassemble();
              },
                child: Text("Editar", style: TextStyle(color: Colors.black.withOpacity(0.9), fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
              ),
            ),
          ),

          // Delete Button
          Container(
            width: double.maxFinite,
            height: height * 0.16,
            margin: EdgeInsets.only(bottom: height * 0.03, left: width * 0.05, right: width * 0.05),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              child : TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.redAccent.withOpacity(0.7)
                ),

                onPressed : (){
                  // Allow user to delete selected widget
                  viewModel.deleteSelectedWidget();
                  viewModel.enableActionMenu = false;
                  viewModel.notifyListeners();
                },

                child: Text("Eliminar", style: TextStyle(color: Colors.black.withOpacity(0.9), fontWeight: FontWeight.bold, fontSize: 25), textAlign: TextAlign.center,),
            ),
            )
          ),
        ],
      ),
    );
  }
}