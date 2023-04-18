import 'package:flutter/material.dart';
import 'package:niveles_formacion/data/model/sync_fusion_items/sync_fusion_widget_item.dart';
import 'package:niveles_formacion/view/dashboard/dashboard_viewmodel.dart';
import 'package:niveles_formacion/view/dashboard/widgets/propertiesDialog.dart';
import 'package:niveles_formacion/view/dashboard_item/dashboard_item_view.dart';
import 'package:stacked/stacked.dart';
import 'package:dashboard/dashboard.dart';
import 'widgets/actionDialog.dart';

class DashboardView extends StackedView<DashboardViewModel> {
  const DashboardView({super.key});

  @override
  Widget builder(
      BuildContext context, DashboardViewModel viewModel, Widget? child) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return WillPopScope(
        onWillPop: () => viewModel.closeActionMenu() ,
        child : Scaffold(
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
            body: viewModel.enableActionMenu?
            ActionDialog(viewModel: viewModel, item: viewModel.item,) :
            Center(
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

                          onLongPress: (){
                            if (!viewModel.editModeEnabled){
                              viewModel.item = item;
                              viewModel.markWidgetAsSelected(item);
                              viewModel.enableActionMenu = true;
                              viewModel.notifyListeners();
                            }
                          },

                          child : item.widget,

                                // Check
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

                    BottomNavigationBarItem(
                        icon: IconButton(
                          icon: const Icon(Icons.add_rounded, size: 25, color: Colors.white, ),
                          onPressed: (){
                            viewModel.cleanPropertiesDialog(); // clean fields
                            PropertiesDialog dialog = PropertiesDialog(viewModel, false);
                            dialog.menuOptions(context);
                          },
                        ),
                        label: ""),
                  ],
                ),
          ),
        ),
    );
  }

  @override
  DashboardViewModel viewModelBuilder(BuildContext context) =>
      DashboardViewModel();
}
