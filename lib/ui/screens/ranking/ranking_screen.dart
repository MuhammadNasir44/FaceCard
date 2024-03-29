






import 'package:face_card/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
class RankingScreen extends StatelessWidget {
   RankingScreen({Key? key}) : super(key: key);

  final List<ChartData> chartData = [
    ChartData(2010, 35, 23),
    ChartData(2011, 38, 49),
    ChartData(2012, 34, 12),
    ChartData(2013, 52, 33),
    ChartData(2014, 40, 30),
    ChartData(2015, 40, 30),
    ChartData(2016, 40, 30),
    ChartData(2017, 40, 30),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.27,
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 20, left: 20),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.2,
                    decoration: BoxDecoration(
                      color:yellowColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),

                        SizedBox(width: 10,),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Good Morning',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 17),
                            ),
                            Text(
                              'Start Your Mission',
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                        )

                      ],
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.13,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      margin: EdgeInsets.only(left: 25, right: 25),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.12,
                      decoration: BoxDecoration(
                        color: Colors.purple.shade900,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Image.asset(
                          //   'assets/images/yellow-lightning-png-44066-Windows_11zon.png',
                          //   height: 100,
                          //   width: 100,
                          // ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Todays Ranking',
                                style: TextStyle(
                                    fontSize: 22, color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 25, right: 25),
              padding: EdgeInsets.only(left: 15, right: 15),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.12,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Country',
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      Text(
                        '345th',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),

                  Container(
                    height: 40,
                    width: 2,
                    color: Colors.grey,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'World',
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      Text(
                        '8765th',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Container(
                    child: ListTile(
                      title: Text(
                        "Performance",
                        style: TextStyle(fontSize: 20),
                      ),
                      trailing: Icon(Icons.arrow_drop_down_outlined),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10,right: 10),
                      child: SfCartesianChart(

                          palette: [
                            purpleColor,
                          ],

                          series: <ChartSeries<ChartData, int>>[
                            // Renders column chart
                            ColumnSeries<ChartData, int>(
                                width: 0.3,
                                spacing: 0.2,


                                dataSource: chartData,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y)
                          ]))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class ChartData {
  ChartData(this.x, this.y, this.y1);
  final int x;
  final double y;
  final double y1;
}