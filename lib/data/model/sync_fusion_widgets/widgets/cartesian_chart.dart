import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';

class CartesianChart extends StatelessWidget{
  @override
  const CartesianChart([this.backgroundColor =  Colors.white, this.title = "Titulo por defecto" ] );

  final Color backgroundColor;
  final String title;

  @override
  Widget build (BuildContext context){

    final List<_CartesianData> data = <_CartesianData> [
      _CartesianData("Lunes", 7.8, 9.0, 5.2),
      _CartesianData("Martes", 6.4, 9.2, 10.0),
      _CartesianData("Miercoles", 3.4, 4.5, 6.5),
      _CartesianData("Jueves", 5.4, 5.6, 5.1),
      _CartesianData("Viernes", 4.5, 6.5, 7.2),
    ];

    return  SfCartesianChart(
      backgroundColor: backgroundColor,
      title: ChartTitle(text: title),
      legend: Legend(isVisible: true),
      primaryXAxis: CategoryAxis(),
      series: <LineSeries<_CartesianData, String>>[
      LineSeries(
      enableTooltip: true,
      dataSource: data,
      name : "Alumno 1",
      xValueMapper: (_CartesianData alumnoUno,  _) => alumnoUno.x ,
      yValueMapper: (_CartesianData alumnoUno, _) => alumnoUno.y,
      dataLabelSettings: const DataLabelSettings(isVisible: true),
      ),
      LineSeries(
      enableTooltip: true,
      dataSource: data,
      name: "Alumno 2",
      xValueMapper: (_CartesianData alumnoDos, _) => alumnoDos.x,
      yValueMapper: (_CartesianData alumnoDos, _) => alumnoDos.y2,
      dataLabelSettings: const DataLabelSettings(isVisible: true),
      ),
      LineSeries(
      enableTooltip: true,
      dataSource: data,
      name: "Alumno 3",
      xValueMapper: (_CartesianData alumnoTres, _) => alumnoTres.x,
      yValueMapper: (_CartesianData alumnoTres, _) => alumnoTres.y3,
      dataLabelSettings: const DataLabelSettings(isVisible: true),
      ),
      ],
    );
  }
}

class _CartesianData{
  _CartesianData(this.x, this.y, this.y2, this.y3);
  final String x;
  final double y;
  final double y2;
  final double y3;
}