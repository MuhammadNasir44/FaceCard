import 'package:face_card/core/constants/style.dart';
import 'package:face_card/ui/screens/bottom_navigation/bottom_naigation.dart';
import 'package:face_card/ui/screens/top_zapper/top_zipper_provider.dart';
import 'package:face_card/ui/screens/ziprequests/zip_request_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/constants/colors.dart';
import '../../../core/enums/view_state.dart';
import '../../../core/models/appusers_model.dart';
import '../widgets/search_bar.dart';
import 'package:provider/provider.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
class TopZapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>TopZipperProvider(),
      child: Consumer<TopZipperProvider>(
        builder: (context,model,child) {
          return Container(
            decoration: gradients,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Color(0xff5C2CC8),
                elevation: 0,
                title: Text('Top Zapper'),
                leading: IconButton(
                  onPressed: (){


                    Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavigation()));

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
              body: ModalProgressHUD(
                progressIndicator: CircularProgressIndicator(
                  color: purpleColor,
                ),
                inAsyncCall: model.state == ViewState.busy,
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(left: 15,right: 15),
                    child: Column(
                      children: [
                        SearchBar(
                          hintText: 'Search Million Number of .Zaps',
                          onChanged: (value){

                            model.searchUserByName(value);
                          },
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount:model.isSearching==false? model.allAppUsers.length:model.searchedUsers.length,
                          physics: ScrollPhysics(),
                          itemBuilder: (context, index) {
                            final currentPerson = personList[index];
                            return model.isSearching==false?Stack(
                              children: [
                                InkWell(
                                  onTap: () {
                                   Navigator.push(
                                        context, MaterialPageRoute(builder: (context) => ZipRequests(selectedUser: model.allAppUsers[index])));

                                    },
                                  child: Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Row(
                                      children: [
                                         Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child:CircleAvatar(
                                            radius: 30,
                                            backgroundImage:model.allAppUsers[index].profileImage.toString() != null
                                                ? NetworkImage("${model.allAppUsers[index].profileImage.toString()}")
                                                : AssetImage('assets/images/pregnant_img.png') as ImageProvider,
                                            child: Text(''),
                                          ),
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
                                                      Text(model.allAppUsers[index].userName==null?"Username":model.allAppUsers[index].userName.toString(),
                                                        style: TextStyle(
                                                            fontWeight: FontWeight
                                                                .bold),),
                                                      Text(model.allAppUsers[index].description==""?"Here will be description":model.allAppUsers[index].description.toString(),
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
                                                      Text(model.allAppUsers[index].zaps==null?"No zaps":model.allAppUsers[index].zaps!.toStringAsFixed(0)),

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
                                Positioned(
                                    right: 20,
                                    bottom: 0,
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade200,
                                          borderRadius: BorderRadius.circular(60)),
                                      child: Center(
                                        child: IconButton(
                                          icon: Center(
                                            child: Icon(
                                              Icons.favorite,
                                              color: Colors.red,
                                              size: 20,
                                            ),
                                          ),
                                          onPressed: () {},

                                          padding: EdgeInsets.all(0),
                                        ),
                                      ),
                                    )),
                              ],
                            ):Stack(
                              children: [
                                InkWell(
                                  onTap: () {

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ZipRequests(selectedUser: model.allAppUsers[index],)));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Row(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: CircleAvatar(
                                            radius: 30,
                                            // backgroundImage:
                                            // AssetImage('images/person.jpg'),
                                          ),
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
                                                      Text(model.searchedUsers[index].userName==null?"Username":model.searchedUsers[index].userName.toString(),
                                                        style: TextStyle(
                                                            fontWeight: FontWeight
                                                                .bold),),
                                                      Text(model.searchedUsers[index].description==""?"Here will be description":model.searchedUsers[index].description.toString(),
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
                                                      Text(model.searchedUsers[index].zaps==null?"No zaps":model.searchedUsers[index].zaps!.toStringAsFixed(0)),

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
                                Positioned(
                                    right: 20,
                                    bottom: 0,
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade200,
                                          borderRadius: BorderRadius.circular(60)),
                                      child: Center(
                                        child: IconButton(
                                          icon: Center(
                                            child: Icon(
                                              Icons.favorite,
                                              color: Colors.red,
                                              size: 20,
                                            ),
                                          ),
                                          onPressed: () {},

                                          padding: EdgeInsets.all(0),
                                        ),
                                      ),
                                    )),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
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
