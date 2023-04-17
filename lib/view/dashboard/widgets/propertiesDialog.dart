import 'package:flutter/material.dart';
import 'package:niveles_formacion/view/dashboard/dashboard_viewmodel.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class PropertiesDialog extends StatelessWidget{
  @override
  PropertiesDialog({
    required this.viewModel,
});

  final DashboardViewModel viewModel;

  @override
  Widget build(BuildContext context){


    return Scaffold(
      body: Stack(
        children: [
        ],
      ),
    );

  }

  menuOptions(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {

        final height = MediaQuery.of(context).size.height;
        final width = MediaQuery.of(context).size.width;

        return ClipRRect(
          borderRadius: BorderRadius.circular(30),
            child : AlertDialog(
            backgroundColor: Colors.blueAccent,
              content: Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blueAccent,
                ),
                child: Stack(
                  children: [
                    // Widget type selector

                    ListView(
                      children : [

                        Text("Crear Widget", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: width * 0.1), textAlign: TextAlign.center,),

                        Container(
                          width: width * 0.8,
                          height: height * 0.1,
                          margin: EdgeInsets.only(left: width * 0.05, right: width * 0.05, top: height * 0.05),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white.withOpacity(0.4)
                          ),
                          child: Row(
                            children: [
                              const Spacer(),
                              const Text("Width : ", style: TextStyle(color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                                textAlign: TextAlign.left,),
                              const Spacer(),
                              DropdownButton(
                                value: viewModel.selectedWidth,
                                items: viewModel.widthValues,
                                onChanged: (int? newWidth) {
                                  viewModel.selectedWidth = newWidth!;
                                  viewModel.notifyListeners();
                                  // Just force refresh inside alertdialog to display changes
                                  (context as Element).reassemble();
                                },
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),

                        Container(
                            width: width * 0.8,
                            height: height * 0.1,
                            margin: EdgeInsets.only(left: width * 0.05, right: width * 0.05, top: height * 0.02),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white.withOpacity(0.4)
                            ),
                            child: Row(
                              children: [
                                const Spacer(),
                                const Text("Height : ", style: TextStyle(color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left,),
                                const Spacer(),
                                DropdownButton(
                                  value: viewModel.selectedHeight,
                                  items: viewModel.heightValues,
                                  onChanged: (int? newHeight) {
                                    viewModel.selectedHeight = newHeight!;
                                    viewModel.notifyListeners();
                                    // Just force refresh inside alertdialog to display changes
                                    (context as Element).reassemble();
                                  },
                                ),
                                const Spacer(),
                              ],
                            )
                        ),

                        Container(
                            width: width * 0.8,
                            height: height * 0.1,
                            margin: EdgeInsets.only(left: width * 0.05, right: width * 0.05, top: height * 0.02),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white.withOpacity(0.4)
                            ),
                            child: Row(
                              children: [
                                const Spacer(),
                                const Text("Widget : ", style: TextStyle(color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left,),
                                const Spacer(),
                                DropdownButton(
                                  value: viewModel.selectedWidget,
                                  items: viewModel.syncFusionValues,
                                  onChanged: (String? newWidget) {
                                    viewModel.selectedWidget = newWidget!;
                                    viewModel.notifyListeners();
                                    // Just force refresh inside alertdialog to display changes
                                    (context as Element).reassemble();
                                  },
                                ),
                                const Spacer(),
                              ],
                            )
                        ),

                        Container(
                          width: double.maxFinite,
                          height: height * 0.3,
                          margin: EdgeInsets.only(top: height * 0.02, left: width * 0.05, right: width * 0.05 ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white.withOpacity(0.4),
                          ),
                          child: Column(
                              children  : [
                                SizedBox(height: height * 0.01,),
                                Text("Color", style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                                SizedBox(height: height * 0.02,),

                                BlockPicker(
                                  availableColors: const [
                                    Colors.black,
                                    Colors.grey,
                                    Colors.brown,
                                    Colors.white,
                                    Colors.blueAccent,
                                    Colors.pinkAccent,
                                    Colors.greenAccent,
                                    Colors.orangeAccent,
                                    Colors.purpleAccent,
                                    Colors.redAccent,
                                    Colors.deepPurpleAccent,
                                    Colors.indigoAccent
                                  ],
                                    pickerColor: viewModel.backgroundColor,
                                    onColorChanged: (color) {
                                      viewModel.backgroundColor = color;
                                      viewModel.notifyListeners();
                                      // Just force refresh inside alertdialog to display changes
                                      (context as Element).reassemble();
                                    }
                                ),
                              ]
                          ),
                        ),

                        Container(
                          width: double.maxFinite,
                          height: height * 0.2,
                          margin: EdgeInsets.only(top: height * 0.02, left: width * 0.05, right: width * 0.05),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white.withOpacity(0.4),
                          ),
                          child: Column(
                            children: [
                              // Title
                              SizedBox(height: height * 0.01,),
                              Text("Título", style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                              SizedBox(height: height * 0.02,),
                              Container(
                                margin: EdgeInsets.only(left: width * 0.02, right: width * 0.02, top: height * 0.05),
                                child : ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child : TextField(
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                    textAlign: TextAlign.center,
                                    controller: viewModel.titleController,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white.withOpacity(0.5),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          width: double.maxFinite,
                          height: height * 0.2,
                          margin: EdgeInsets.only(top: height * 0.02, left: width * 0.05, right: width * 0.05),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white.withOpacity(0.4),
                          ),
                          child: Column(
                            children: [
                              // Title
                              SizedBox(height: height * 0.01,),
                              Text("Identificador", style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                              SizedBox(height: height * 0.01,),
                              Text("(Debe ser único)", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                              SizedBox(height: height * 0.02,),
                              Container(
                                margin: EdgeInsets.only(left: width * 0.02, right: width * 0.02, top: height * 0.02),
                                child : ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child : TextField(
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                    textAlign: TextAlign.center,
                                    controller: viewModel.identifierController,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white.withOpacity(0.5),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          width: double.maxFinite,
                          height: height * 0.2,
                          margin: EdgeInsets.only(top: height * 0.02, left: width * 0.05, right: width * 0.05),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white.withOpacity(0.4),
                          ),
                          child: Column(
                            children: [
                              // Title
                              SizedBox(height: height * 0.01,),
                              Text("UID", style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                              SizedBox(height: height * 0.02,),
                              Container(
                                margin: EdgeInsets.only(left: width * 0.02, right: width * 0.02, top: height * 0.05),
                                child : ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child : TextField(
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                    textAlign: TextAlign.center,
                                    controller: viewModel.uidController,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white.withOpacity(0.5),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),



                        Container(
                          width: double.maxFinite,
                          height: height * 0.07,
                          margin: EdgeInsets.only(top: height * 0.05, bottom: height * 0.05),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child : TextButton(
                              onPressed : (){
                                if(viewModel.uidController.text.isNotEmpty && viewModel.identifierController.text.isNotEmpty){
                                  viewModel.title = viewModel.titleController.text;
                                  viewModel.identifier = viewModel.identifierController.text;
                                  viewModel.uid = viewModel.uidController.text;
                                  viewModel.notifyListeners();
                                  viewModel.addWidgetToDashBoard();
                                  Navigator.pop(context);
                                }
                              },

                              style: TextButton.styleFrom(
                                backgroundColor: Colors.greenAccent,
                              ),
                              child: const Text("Añadir", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30), textAlign: TextAlign.center,),
                            ),
                          ),
                        )

                        ],
                    ),
                  ],
                ),
              ),
            ),
          );
          }
    );
  }
}
