



import 'package:face_card/core/constants/colors.dart';
import 'package:face_card/core/constants/date_time_formates.dart';
import 'package:face_card/core/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../core/enums/view_state.dart';
import '../sendZap/send_zaps_provider.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
class ZipRequests extends StatelessWidget {

  final selectedUser;
  final getZaps;
  ZipRequests({this.selectedUser,this.getZaps});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>SendZapsProvider(),
      child: Consumer<SendZapsProvider>(
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
                  onPressed: () {},
                  icon: Icon(Icons.settings, size: 30),
                )
              ],
              centerTitle: true,
            ),
            body: ModalProgressHUD(
              progressIndicator: CircularProgressIndicator(
                color: purpleColor,
              ),
              inAsyncCall: model.state == ViewState.busy,
              child: Container(
                decoration: gradients,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Center(
                          child: Text(
                            'your are seding zaps to ${selectedUser.userName}.',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          )),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 80, left: 25, right: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //Image and Text Row Container
                          Container(
                            padding: EdgeInsets.only(
                              top: 5,
                            ),
                            child: CircleAvatar(
                              radius: 55.0,

                              // backgroundImage: AssetImage(
                              //     'assets/images/ani-kolleshi-7jjnJ-QA9fY-unsplash.jpg'),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 5, left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  selectedUser.userName,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  selectedUser.description == ""
                                      ? 'No description'
                                      : selectedUser.description,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 25),
                    Container(
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
                    SizedBox(height: 20),
                    getZaps == null ? SizedBox() : Text(
                      "${getZaps}",
                      style: TextStyle(color: Colors.white, fontSize: 28),
                    ),
                    SizedBox(height: 20),
                    Container(
                        padding: EdgeInsets.only(left: 25, right: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // InkWell(
                            //   child: Container(
                            //     height: 55.0,
                            //     width: 150.0,
                            //     decoration: ShapeDecoration(
                            //       color: purpleColor,
                            //       shape: RoundedRectangleBorder(
                            //         borderRadius: BorderRadius.circular(10.0),
                            //       ),
                            //     ),
                            //     child: Row(
                            //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            //       crossAxisAlignment: CrossAxisAlignment.center,
                            //       children: [
                            //         Icon(
                            //           Icons.share,
                            //           size: 30,
                            //           color: Colors.yellow.shade600,
                            //         ),
                            //         Text(
                            //           "Share",
                            //           style: TextStyle(color: Colors.white, fontSize: 20),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            //   onTap: () {
                            //     print('Share Button Clicked');
                            //   },
                            // ),
                            InkWell(
                              child: Container(
                                height: 55.0,
                                padding: EdgeInsets.only(left: 15, right: 15),
                                decoration: ShapeDecoration(
                                  color: purpleColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [

                                    Text(
                                      "Send Zaps",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: 25,
                                      color: Colors.yellow.shade600,
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {

                                model.zapRequestModel.senderName = model.locater.appUser.userName.toString();
                                model.zapRequestModel.numberOfZaps=getZaps.toDouble()+selectedUser.zaps;
                                model.zapRequestModel.senderId = model.locater.appUser.appUserId;
                                model.zapRequestModel.receiverId = selectedUser.appUserId;
                                model.zapRequestModel.sentAt = DateTime.now();
                                model.sendZapsRequest(model.zapRequestModel,context);
                                // model.sendZapsRequest();
                              },
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
