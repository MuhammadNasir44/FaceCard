


import 'package:face_card/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../profile/profile_screen.dart';
import '../purchaszaps/purchap_zaps_screen.dart';
import '../ranking/ranking_screen.dart';
import '../top_zapper/topzapper_screens.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {

  int pageIndex = 0;

  final pages = [
    RankingScreen(),
    PurchaseZaps(),
    const TopZapper(),
     ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageIndex==0?Colors.white:Colors.purple,
      body: pages[pageIndex],
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: purpleColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [


            BottomNavigationItems(
              getColor: pageIndex==0?yellowColor:Colors.white,
              iconPath: 'assets/icons/ranking.svg',
              onPressed: (){
                setState(() {
                  pageIndex=0;
                });
              },
            ),

            BottomNavigationItems(
              getColor: pageIndex==1?yellowColor:Colors.white,
              iconPath: 'assets/icons/zap.svg',
              onPressed: (){
                setState(() {
                  pageIndex=1;
                });
              },
            ),
            BottomNavigationItems(
              getColor: pageIndex==2?yellowColor:Colors.white,
              iconPath: 'assets/icons/heart.svg',
              onPressed: (){
                setState(() {
                  pageIndex=2;
                });
              },
            ),
            BottomNavigationItems(
              getColor: pageIndex==3?yellowColor:Colors.white,
              iconPath: 'assets/icons/profile.svg',
              onPressed: (){
                setState(() {
                  pageIndex=3;
                });
              },
            ),

          ],
        ),
      ),
    );
  }
}

class BottomNavigationItems extends StatelessWidget {
  final iconPath;
  final onPressed;
  final getColor;
  BottomNavigationItems({this.iconPath,this.onPressed,this.getColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
              iconPath,
            color:getColor,
          ),





        ],
      ),
    );
  }
}

