






import 'package:face_card/ui/screens/profile/profile_provider.dart';
import 'package:face_card/ui/screens/profile/profile_screen.dart';
import 'package:face_card/ui/screens/top_zapper/topzapper_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/style.dart';
import '../../../core/enums/view_state.dart';
class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>ProfileProvider(),
      child: Consumer<ProfileProvider>(
        builder: (context,model,child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xff5C2CC8),
              elevation: 0,
              title: Text(
                'PROFILE',
                style: TextStyle(fontSize: 25),
              ),
              automaticallyImplyLeading: true,
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => ProfileScreen()));
                  },
                  icon: Icon(Icons.settings, size: 30),
                )
              ],
              centerTitle: true,
            ),
            body: Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              decoration: gradients,
              child: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        model.locateUser.appUser.userName==null?"thersara khan":model.locateUser.appUser.userName.toString(),
                        style: TextStyle(
                            color: Colors.white, fontSize: 18),
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //Image and Text Row Container
                            Container(
                              padding: EdgeInsets.only(
                                top: 5,
                              ),
                              child:  CircleAvatar(
                                radius: 55,
                                backgroundImage:model.appUser.profileImage != null
                                    ? NetworkImage("${model.appUser.profileImage}")
                                    : AssetImage('assets/images/pregnant_img.png') as ImageProvider,
                                child: Text(''),
                              ),
                            ),
                            SizedBox(height: 10,),

                            Text(
                              model.locateUser.appUser.faceCardNumber==null?"-- FacaCard Number":"FacaCard Number: "+model.locateUser.appUser.faceCardNumber.toString(),
                              style: TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            SizedBox(height: 10,),
                            Text(
                              model.locateUser.appUser.zaps==null?"-- zaps":"Zaps: "+model.locateUser.appUser.zaps.toString(),
                              style: TextStyle(color: Colors.white, fontSize: 15),
                            ),

                            SizedBox(height: 10),
                            Text(model.locateUser.appUser.description==null?"Lorem ipsum dolor at amat, cooperate.":model.locateUser.appUser.description.toString(),
                              style: TextStyle(
                                  color: Colors.white, fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 25),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>TopZapper()));
                        },
                        child: Container(
                          height: 250,
                          width: 250,
                          padding: EdgeInsets.all(30),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 5,
                              color: Colors.yellow.shade600,
                              style: BorderStyle.solid,
                            ),
                          ),
                          child: SvgPicture.asset(
                            "assets/icons/multiplezips.svg",
                            height: 80,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      // Text(
                      //   model.locateUser.appUser.zaps==null?"500":model.locateUser.appUser.zaps.toString(),
                      //   style: TextStyle(color: Colors.white, fontSize: 28),
                      // ),
                      // Container(
                      //     padding: EdgeInsets.only(left: 25, right: 25),
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //       children: [
                      //         InkWell(
                      //           child: Container(
                      //             height: 50.0,
                      //             width: 150.0,
                      //             decoration: ShapeDecoration(
                      //               color: purpleColor,
                      //               shape: RoundedRectangleBorder(
                      //                 borderRadius: BorderRadius.circular(10.0),
                      //               ),
                      //             ),
                      //             child: Row(
                      //               mainAxisAlignment: MainAxisAlignment
                      //                   .spaceEvenly,
                      //               crossAxisAlignment: CrossAxisAlignment.center,
                      //               children: [
                      //                 Icon(
                      //                   Icons.share,
                      //                   size: 25,
                      //                   color: Colors.yellow.shade600,
                      //                 ),
                      //                 Text(
                      //                   "Share",
                      //                   style: TextStyle(
                      //                       color: Colors.white, fontSize: 20),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //           onTap: () {
                      //             print('Share Button Clicked');
                      //           },
                      //         ),
                      //         InkWell(
                      //           child: Container(
                      //             height: 50.0,
                      //             padding: EdgeInsets.only(left: 25, right: 25),
                      //             decoration: ShapeDecoration(
                      //               color: purpleColor,
                      //               shape: RoundedRectangleBorder(
                      //                 borderRadius: BorderRadius.circular(10.0),
                      //               ),
                      //             ),
                      //             child: Row(
                      //               mainAxisAlignment: MainAxisAlignment
                      //                   .spaceEvenly,
                      //               crossAxisAlignment: CrossAxisAlignment.center,
                      //               children: [
                      //
                      //                 Text(
                      //                   "Invite",
                      //                   style: TextStyle(
                      //                       color: Colors.white, fontSize: 20),
                      //                 ),
                      //                 SizedBox(width: 10,),
                      //                 Icon(
                      //                   Icons.arrow_forward_ios,
                      //                   size: 25,
                      //                   color: Colors.yellow.shade600,
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //           onTap: () {
                      //             // model.sendZapsRequest();
                      //           },
                      //         ),
                      //
                      //
                      //
                      //       ],
                      //     ),
                      // ),



                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
