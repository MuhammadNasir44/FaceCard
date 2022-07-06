import 'package:face_card/core/constants/colors.dart';
import 'package:face_card/core/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/locator.dart';
import '../../../core/models/app_user.dart';
import '../../../core/services/auth_services.dart';
class RecievedZaps extends StatelessWidget {

  final locater = locator<AuthServices>();
  final appUser = AppUser();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff5C2CC8),
        elevation: 0,
        title: Text('Zaps'),
        leading: Icon(Icons.arrow_back_ios_new),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              child: Icon(
                Icons.border_all_sharp,
              ),
            ),
          )
        ],
      ),
      body: Container(
        decoration: gradients,
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children:  [


              Text("You Recieved From:",style: TextStyle(color: Colors.white),),

              StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance
                    .collection('ZapRequests')
                    .doc(locater.appUser.appUserId)
                    .collection('setRequest')
                    .snapshots(),
                // FirebaseFirestore.instance.collection("postData").snapshots(),
                builder: (_, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error = ${snapshot.error}');
                  }
                  var checkDate = snapshot.data?.docs.isEmpty;
                  if (checkDate == true) {
                    return Text("Here will be the list of zaps sender. ",style: TextStyle(color: Colors.white),
                    );
                  }
                  if (snapshot.hasData) {
                    final docs = snapshot.data?.docs;
                    return ListView.builder(
                      itemCount: docs?.length,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (context, index) {
                        final data = docs?[index].data();
                        return Stack(
                          children: [
                            InkWell(
                              onTap: () {

                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => ZipRequests(selectedUser: model.allAppUsers[index],)));

                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Row(
                                  children: [
                                     Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        radius: 30,
                                        backgroundImage:data!['senderImage'] != null
                                            ? NetworkImage("${data['senderImage']}")
                                            : AssetImage('assets/images/pregnant_img.png') as ImageProvider,
                                        child: Text(''),
                                      )
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 50,
                                        margin: EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            top: 2,
                                            bottom: 2),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                                10)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(data['senderName'],
                                                    style: TextStyle(
                                                        fontWeight: FontWeight
                                                            .bold),),
                                                  Text(data['senderDescription']==""?"Description":data['senderDescription'],
                                                    style: TextStyle(
                                                        color: Colors.grey),),
                                                ],
                                              ),

                                              Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    "assets/icons/logo.svg",
                                                    width: 10,
                                                  ),
                                                  Text(data['numberOfZaps'].toString()),

                                                ],
                                              )

                                            ],
                                          ),
                                        ),
                                      ),
                                    ),


                                  ],
                                ),
                              ),
                            ),
                            // Positioned(
                            //     right: 20,
                            //     bottom: 0,
                            //     child: Container(
                            //       height: 25,
                            //       width: 25,
                            //       decoration: BoxDecoration(
                            //           color: Colors.grey.shade200,
                            //           borderRadius: BorderRadius.circular(60)),
                            //       child: Center(
                            //         child: IconButton(
                            //           icon: Center(
                            //             child: Icon(
                            //               Icons.favorite,
                            //               color: Colors.red,
                            //               size: 20,
                            //             ),
                            //           ),
                            //           onPressed: () {},
                            //
                            //           padding: EdgeInsets.all(0),
                            //         ),
                            //       ),
                            //     )),

                          ],
                        );
                      },
                    );
                  }
                  return Center(
                      child: CircularProgressIndicator(color: purpleColor));
                },
              ),









            ],
          ),
        ),
      ),
    );
  }
}
