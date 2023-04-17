import 'package:flutter/material.dart';
import 'package:niveles_formacion/data/model/sync_fusion_items/sync_fusion_widget_item.dart';
import 'package:niveles_formacion/view/dashboard/dashboard_viewmodel.dart';
import 'package:niveles_formacion/view/dashboard/widgets/propertiesDialog.dart';
import 'package:niveles_formacion/view/dashboard_item/dashboard_item_view.dart';
import 'package:stacked/stacked.dart';
import 'package:dashboard/dashboard.dart';

class DashboardView extends StackedView<DashboardViewModel> {
  const DashboardView({super.key});

  @override
  Widget builder(
      BuildContext context, DashboardViewModel viewModel, Widget? child) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueAccent,
        elevation:  0.0,
        title: Row(
          children: const [
            const Spacer(),
            const Text("SyncFusion DashBoard", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),),
            const Spacer(),
          ],
        ),
      ),
        body: Center(
            child: Dashboard<SyncFusionWidget>(
                dashboardItemController: viewModel.dashboardItemController,

                itemStyle: ItemStyle(
                    color: Colors.transparent,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),

                physics: const RangeMaintainingScrollPhysics(),
                editModeSettings: EditModeSettings(
                    paintBackgroundLines: true,
                    resizeCursorSide: 15,
                    curve: Curves.easeOut,
                    duration: const Duration(milliseconds: 300),
                    backgroundStyle: const EditModeBackgroundStyle(
                        lineColor: Colors.black38,
                        lineWidth: 0.5,
                        dualLineHorizontal: true,
                        dualLineVertical: true)),

                itemBuilder: (SyncFusionWidget item) {

                  return InkWell(

                      onTap : (){
                        // Saves current widget ID into a variable
                        viewModel.selectedWidgetsID.contains(item.identifier) ? viewModel.selectedWidgetID = "" : viewModel.selectedWidgetID = item.identifier;
                        viewModel.selectedWidgetsID.contains(item.identifier) ? viewModel.selectedWidgetsID.remove(item.identifier) :  viewModel.selectedWidgetsID.add(item.identifier);
                        print("SELECTED ID  : ${viewModel.selectedWidgetID}");
                        print("LIST ID  : ${viewModel.selectedWidgetsID}");

                        viewModel.notifyListeners();
                      },
                      child : Container(
                        decoration: BoxDecoration(
                          color: viewModel.selectedWidgetsID.contains(item.identifier) ? Colors.white.withOpacity(0.9) : Colors.transparent
                        ),
                        child : Stack(
                          children: [
                            //Syncfusion Widget
                            item.widget,

                            // Check
                            if (viewModel.selectedWidgetsID.contains(viewModel.selectedWidgetID))
                              Container(
                                width: width * 0.2 ,
                                height: height * 0.2,
                                margin: EdgeInsets.only(top: height * 0.8, left: width * 0.7, right: width * 0.01),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(width * 0.02)
                                ),
                                child : const Icon(Icons.check_rounded, color: Colors.white,),
                              )
                          ],
                        )
                      ),
                  );
                }
            )
        ),

      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
            child : BottomNavigationBar(
              backgroundColor: Colors.blueAccent,
              items: [
                BottomNavigationBarItem(
                    icon: IconButton(
                      icon: const Icon(Icons.edit_rounded, size: 25, color: Colors.white, ),
                      onPressed: (){
                        viewModel.changeEditMode();
                      },
                    ),
                label: ""),

                if (!viewModel.editModeEnabled)
                  BottomNavigationBarItem(
                      icon: IconButton(
                        icon: const Icon(Icons.delete_rounded, size: 25, color: Colors.white,),
                        onPressed: (){
                          viewModel.deleteSelectedWidget();
                        },
                      ),
                      label: ""
                  ),

                BottomNavigationBarItem(
                    icon: IconButton(
                      icon: const Icon(Icons.add_rounded, size: 25, color: Colors.white, ),
                      onPressed: (){
                        PropertiesDialog dialog = PropertiesDialog(viewModel :  viewModel);
                        dialog.menuOptions(context);
                      },
                    ),
                    label: ""),
              ],
            ),
      ),
    );
  }

  @override
  DashboardViewModel viewModelBuilder(BuildContext context) =>
      DashboardViewModel();
}
