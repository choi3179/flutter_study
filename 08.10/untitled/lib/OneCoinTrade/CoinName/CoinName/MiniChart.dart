import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SalesData {
  final double year;
  final double sales;

  SalesData(this.year, this.sales);
}

List<SalesData> getChartData() {
  final List<SalesData> chartData = [
    SalesData(2012, 0),
    SalesData(2013, 25),
    SalesData(2014, 18),
    SalesData(2015, 14),
    SalesData(2016, 20),
    SalesData(2017, 25),
    SalesData(2018, 12),
    SalesData(2019, 24),
    SalesData(2020, 18),
    SalesData(2021, 31),
  ];
  return chartData;
}

class MiniChart extends StatefulWidget {
  @override
  _MiniChartState createState() => _MiniChartState();

}

class _MiniChartState extends State<MiniChart> {

  late List<SalesData> _chartData;

  @override
  void initState() {
    _chartData = getChartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        height: 35,
        width: 116.w,
        alignment: Alignment.topCenter,
        //width: width,
        child: SfCartesianChart(
          series: <ChartSeries>[
            AreaSeries<SalesData, double>(dataSource: _chartData,
              xValueMapper: (SalesData sales, _) => sales.year,
              yValueMapper: (SalesData sales, _) => sales.sales,
              //gradient: LinearGradient(colors: color,stops: stops,begin: Alignment.bottomCenter,end: Alignment.topCenter),
              animationDuration: 0,
              /*gradient: LinearGradient(
                  colors: <Color>[
                    Colors.white,
                    Color(0xffD8352C).withOpacity(0.1)
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter
              ),*/
              color: Color(0xffFFECEC),
              borderWidth: 1.w,
              borderColor: Color(0xffD8352C),
              //dataLabelSettings: DataLabelSettings(isVisible:true),   /// 데이터 라벨링
            )
          ],
          primaryXAxis: NumericAxis(isVisible: false,),
          primaryYAxis: NumericAxis(
              isVisible: false, minimum: 0, maximum: 31,
              /*plotBands: <PlotBand>[
                PlotBand(
                    isVisible: true,
                    verticalTextPadding: '5%',
                    horizontalTextPadding: '5%',
                    textAngle: 0,
                    start: 20,
                    end: 20,
                    borderColor: Color(0xff737373),
                    borderWidth: 0.5,
                    dashArray: <double>[5, 5]
                )
              ]*/
          ),
          plotAreaBorderWidth: 0,
        )
    );
  }
}