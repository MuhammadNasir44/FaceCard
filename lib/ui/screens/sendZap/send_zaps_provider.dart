

import 'package:face_card/core/constants/colors.dart';
import 'package:face_card/core/models/base_view_model.dart';
import 'package:face_card/core/models/zap_requst_model.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:face_card/ui/screens/bottom_navigation/bottom_naigation.dart';
import 'package:face_card/ui/screens/purchaszaps/purchap_zaps_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/enums/view_state.dart';
import '../../../core/locator.dart';
import '../../../core/models/app_user.dart';
import '../../../core/services/auth_services.dart';
import '../../../core/services/database_services.dart';

class SendZapsProvider extends BaseViewModal{




  final databaseServices = DatabaseServices();
  ZapRequestModel zapRequestModel = ZapRequestModel();


  List<AppUser> allAppUsers = [];
  List<AppUser> searchedUsers = [];
  final locater = locator<AuthServices>();
  final appUser = AppUser();
  bool isSearching = false;


  SendZapsProvider(){

    getAllAppUsers();


  }
  getAllAppUsers()async{

    setState(ViewState.busy);
    allAppUsers = await databaseServices.getAppUsers();
    notifyListeners();
    setState(ViewState.idle);
  }


  sendZapsRequest(ZapRequestModel zapRequestModel,BuildContext ctx) async {

    var getFaceCardNO;

    setState(ViewState.busy);

    await databaseServices.sendZapsRequest(zapRequestModel, zapRequestModel.receiverId.toString());

    await databaseServices.updateotherUserProfile(zapRequestModel.numberOfZaps!.toDouble(),zapRequestModel.receiverId.toString());

    getFaceCardNO = locater.appUser.faceCardNumber;

    print("Here is the getFacevard number:"+getFaceCardNO.toString());
    if(getFaceCardNO!=null){
      locater.appUser.faceCardNumber = getFaceCardNO+1;
    }
    notifyListeners();

    print("Here is the getFacevard number:"+locater.appUser.faceCardNumber.toString());


    await databaseServices.updateUserProfile(locater.appUser);

    setState(ViewState.idle);

    CoolAlert.show(
      backgroundColor: purpleColor,
      title: "Nice",
      lottieAsset: 'assets/icons/completed.json',
      barrierDismissible: false,
      loopAnimation: true,
      context: ctx,
      type: CoolAlertType.confirm,
      text: 'Zaps successfully sent',
      confirmBtnText: 'Okay',
      cancelBtnText: ' ',
      confirmBtnColor:purpleColor,
      onConfirmBtnTap: ()  {

        Navigator.pop(ctx);

        Navigator.pushAndRemoveUntil<dynamic>(ctx, MaterialPageRoute<dynamic>(builder: (BuildContext context) => BottomNavigation(),),
              (route) => false,//if you want to disable back feature set to false
        );
        //
        // print("Exit exit");
        // Navigator.pop(ctx);
        // Navigator.of(ctx, rootNavigator: true).pop();

        // await model.locateUser.logoutUser();
        // Navigator.pushReplacement(
        //     context, CustomPageRoute(child: SplashScreen()));
      },
      onCancelBtnTap: () {
        Navigator.of(ctx, rootNavigator: true).pop();
        // Navigator.pop(context);
        // Navigator.of(context, rootNavigator: true).pop();
      },
    );


  }



  ///
  /// search user by name
  ///
  searchUserByName(String keyword) {
    print("Searched keyword : $keyword");
    keyword.isEmpty ? isSearching = false : isSearching = true;
    searchedUsers = allAppUsers
        .where((e) => (e.userName!.toLowerCase().contains(keyword.toLowerCase()))).toList();

    searchedUsers = allAppUsers.where((e) => (e.userName!.toLowerCase().contains(keyword.toLowerCase()))).toList();

    notifyListeners();
  }




}