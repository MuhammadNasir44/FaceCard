




import 'package:face_card/core/constants/colors.dart';
import 'package:face_card/ui/screens/ranking/ranking_provider.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:provider/provider.dart';
import '../../../core/models/chart_data.dart';
import 'package:flutter_svg/flutter_svg.dart';
class RankingDetailScreen extends StatelessWidget {
  const RankingDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>RankingProvider(),
      child: Consumer<RankingProvider>(
        builder: (context,model,child) {
          return Scaffold(

            appBar: AppBar(
                backgroundColor: Color(0xff5C2CC8),
                elevation: 0,
                title: Text('Ranking Detail'),
                leading: IconButton(
                  onPressed: (){


                    Navigator.pop(context);

                    // Navigator.pop(context);

                  },
                  icon: Icon(Icons.arrow_back_ios_new),
                )
              // actions: [
              //   Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: GestureDetector(
              //       onTap: (){
              //         Navigator.pop(context);
              //       },
              //       child: Icon(
              //         Icons.border_all_sharp,
              //       ),
              //     ),
              //   )
              // ],
            ),

            body: Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                  SizedBox(height: 40,),

                  Center(
                    child: Container(
                      child: SvgPicture.asset(
                        "assets/icons/logo.svg",
                        height: 80,
                      ),
                    ),
                  ),

                  SizedBox(height: 20,),

                  Text("Your Ranking position: ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),

                  SizedBox(height: 20,),


                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),

                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
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
                              width: 0.1,
                              dataSource: model.onlyCurrentUser,
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y
                          ),
                        ]
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
