
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SalesData{
  final double year;
  final double sales;

  SalesData(this.year,this.sales);
}

List<SalesData> getChartData(){
  final List<SalesData> chartData=[
    SalesData(2017,25),
    SalesData(2018,12),
    SalesData(2019,24),
    SalesData(2020,18),
    SalesData(2021,31),
  ];
  return chartData;
}

class ChartWidget extends StatefulWidget{
  @override
  _ChartState createState() => _ChartState();

}

class _ChartState extends State<ChartWidget>{

  late List<SalesData> _chartData;
  late TrackballBehavior _trackballBehavior;

  int _durationIdx = 0;

  @override
  void initState() {
    _chartData = getChartData();
    _trackballBehavior = TrackballBehavior(
      // Enables the trackball
        enable: true,
        tooltipDisplayMode: TrackballDisplayMode.floatAllPoints,
        tooltipSettings: InteractiveTooltip(
            enable: true,
            color: Colors.black,
            borderColor: Colors.red
        ),
        activationMode: ActivationMode.singleTap
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        height: 373,
        //width: width,
        child: Column(
          children: [
            Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                  child: SfCartesianChart(
                    series: <ChartSeries>[
                      AreaSeries<SalesData,double>(dataSource: _chartData,
                        xValueMapper: (SalesData sales, _) => sales.year,
                        yValueMapper: (SalesData sales, _) => sales.sales,
                        //gradient: LinearGradient(colors: color,stops: stops,begin: Alignment.bottomCenter,end: Alignment.topCenter),
                        gradient: LinearGradient(
                            colors: <Color>[
                              Colors.white,
                              Color(0xffD8352C).withOpacity(0.1)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter
                        ),
                        borderWidth: 2,
                        borderColor: Color(0xffD8352C),
                        animationDuration: 0
                        //dataLabelSettings: DataLabelSettings(isVisible:true),   /// 데이터 라벨링
                      )
                    ],
                    primaryXAxis: NumericAxis(isVisible: false,),
                    primaryYAxis: NumericAxis(isVisible: false ,minimum: 10,maximum: 31,
                        plotBands: <PlotBand>[
                        PlotBand(
                          isVisible: true,
                          verticalTextPadding:'5%',
                          horizontalTextPadding: '5%',
                          textAngle: 0,
                          start: 20,
                          end: 20,
                          borderColor: Color(0xff737373),
                          borderWidth: 0.5,
                          dashArray: <double>[5,5]
                        )
                      ]
                    ),
                    trackballBehavior: _trackballBehavior,
                    plotAreaBorderWidth: 0,
                  ),
                )
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              color: Colors.white,
              height: 39,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DurationTapText(0, '5분'),
                  DurationTapText(1, '10분'),
                  DurationTapText(2, '30분'),
                  DurationTapText(3, '1시간'),
                  DurationTapText(4, '1일'),
                  DurationTapText(5, '1주'),
                ],
              ),
            ),
          ],
        )
    );
  }

  Widget DurationTapText(int op, String text) {
    return Expanded(
        child: Container(
          child: TextButton(
            child: Text(
              '$text',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight:
                op == _durationIdx ? FontWeight.bold : FontWeight.normal,
                color: op == _durationIdx ? Colors.black : Color(0xff737373),
              ),
            ),
            onPressed: () {
              setState(() {
                _durationIdx = op;
              });
            },
            style: TextButton.styleFrom(
              shape: StadiumBorder(),
              backgroundColor:
              op == _durationIdx ? Color(0xffF7F7F7) : Colors.transparent,
            ),
          ),
        ),
        flex: 1);
  }/// 시간 차트 탭
}