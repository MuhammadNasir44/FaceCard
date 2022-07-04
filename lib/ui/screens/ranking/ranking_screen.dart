






import 'package:face_card/core/constants/colors.dart';
import 'package:face_card/core/constants/style.dart';
import 'package:face_card/ui/screens/ranking/ranking_provider.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:provider/provider.dart';
import '../../../core/models/chart_data.dart';
class RankingScreen extends StatelessWidget {
   RankingScreen({Key? key}) : super(key: key);


   // List<ChartData> chartData  = [
   // ChartData('Go', 597),
   // ChartData("ddd", 599),
   // ChartData('Makk', 601),
   //   ChartData('e', 597),
   //   ChartData("gg", 599),
   //   ChartData('rr', 601),
   // ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>RankingProvider(),
      child: Consumer<RankingProvider>(
        builder: (context,model,child) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.27,
                    child: Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 20, left: 20),
                          width: double.infinity,
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.2,
                          decoration: BoxDecoration(
                            color: yellowColor,
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
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ],
                              )

                            ],
                          ),
                        ),
                        Positioned(
                          top: MediaQuery
                              .of(context)
                              .size
                              .height * 0.13,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.only(left: 15, right: 15),
                            margin: EdgeInsets.only(left: 25, right: 25),
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.12,
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
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.12,
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
                              'HomeTown',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black54),
                            ),
                            Text(
                              model.homeTownRanking.toString(),
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black),
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
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black54),
                            ),
                            Text(
                              model.worldRankingNumber.toString(),
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black),
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
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
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
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: SfCartesianChart(
                              primaryXAxis: CategoryAxis(
                                maximumLabelWidth: 80,
                              ),
                              series: <ChartSeries<ChartData, String>>[
                                ColumnSeries<ChartData, String>(
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomLeft,
                                      colors: [Color(0xff5C2CC8), Colors.purple],
                                  ),
                                    color: purpleColor,
                                    width: 0.2,
                                    dataSource: model.chartData,
                                    xValueMapper: (ChartData data, _) => data.x,
                                    yValueMapper: (ChartData data, _) => data.y
                                ),
                              ]
                          ),
                        ),


                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


