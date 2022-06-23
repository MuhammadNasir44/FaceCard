

import 'package:face_card/ui/screens/bottom_navigation/bottom_naigation.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/date_time_formates.dart';
import '../../../core/enums/view_state.dart';
import '../../../core/locator.dart';
import '../../../core/models/app_user.dart';
import '../../../core/services/auth_services.dart';
import '../../../core/services/custom_auth_result.dart';
import 'package:face_card/core/models/base_view_model.dart';
import 'package:intl/intl.dart';

import '../widgets/custom_page_route.dart';

class AuthenticationProvider extends BaseViewModal {

  AuthenticationProvider(){

    print("AuthenticationPRovider built");
  }

  var renderScreen=0;
  DateTime selectedDate = DateTime.now();
  var selectedDateString;
  var forgotPasswordEmail;
  var checkingText = "HEllo there";
  var emailSendingMsg;


  final _authServices = locator<AuthServices>();
  CustomAuthResult customAuthResult = CustomAuthResult();
  AppUser appUser = AppUser();
  final formKey = GlobalKey<FormState>();


  void changeDateFun(var d)
  {
    print("here is also printint"+d.toString());
    selectedDate = d;

    print("here is Selected "+selectedDate.toString());
    selectedDateString = DateFormat.yMMMMd("en_US").format(selectedDate).toString();
    notifyListeners();
  }




  void renderScreenFun(int getRenderScreen)
  {
    renderScreen = getRenderScreen;

    notifyListeners();

  }


  void checkingFun(var getText)
  {
    checkingText =getText;
    notifyListeners();
  }


  ///
  ///
  /// Reset Password

  resetPassword(String email) async {
    if (email != null) {
      print('Reset User password Email=>${appUser.userEmail}');
      await _authServices.resetUserPassword(email);

    }else
    {
      print("hellllllllooo");
    }

  }

  void updateEmailSendingMsgFun(var email)
  {
    emailSendingMsg = "Email has been sent to "+"$email"+"please check your spam if you have not received";
    notifyListeners();
  }





  /// Sign Up user===================================================================================================================

  signUpUser(AppUser appUser, BuildContext context) async {
    if (formKey.currentState!.validate()) {
      print("User Name: ${appUser.userName}");
      print("User Email: ${appUser.userEmail}");
      print("User Password: ${appUser.password}");
      // print("User ConfirmPassword: ${appUser.confirmPassword}");
      appUser.isFirstLogin = true;
      setState(ViewState.busy);
      appUser.createdAt = DateTime.now();
      appUser.lastEntry = DateTime.now();
      appUser.monthYear = monthYear.format(DateTime.now());
      ///================== Getting Pregnency Date ================
      customAuthResult = await _authServices.signUpUser(appUser);
      setState(ViewState.idle);
      if (customAuthResult.user != null) {
        print("SignUpUserId=> ${_authServices.appUser.appUserId}");
        Navigator.pushReplacement(
            context, CustomPageRoute(child: BottomNavigation()));
      } else {
        print(customAuthResult.errorMessage.toString());
        // showSnackBar(context, customAuthResult.errorMessage!);
        // Get.defaultDialog(
        //   title: "Error Message",
        //   confirmTextColor: Colors.white,
        //   onConfirm: () {
        //     Navigator.pop(context);
        //   },
        //   content: Text(customAuthResult.errorMessage!),
        // );
      }
    }
    else
    {
      print("not showing true");
    }
    // Get.offAll(()=>WalkThroughScreen());
  }



  ///
  /// Login user
  ///
  loginUser(AppUser appUser, BuildContext context) async {
    if (formKey.currentState!.validate()) {
      print("App user emailllllll: ${appUser.userEmail}");
      print("App user Password: ${appUser.password}");
      setState(ViewState.busy);
      customAuthResult = await _authServices.loginUser(appUser);

      setState(ViewState.idle);

      if (customAuthResult.user != null) {
        print("App user Id: ${_authServices.appUser.appUserId}");
        print("Is first Login=> ${_authServices.appUser.isFirstLogin}");
        if (_authServices.appUser.isFirstLogin == true) {
          Navigator.pushReplacement(
              context, CustomPageRoute(child: BottomNavigation()));
        } else if (_authServices.appUser.isFirstLogin == false) {
          // Navigator.pushReplacement(context, CustomPageRoute(child: BottomNavigation()));
        }
      } else {
        // showSnackBar(
        //   context,
        //   "${customAuthResult.errorMessage!}",
        //   duration: 5000,
        // );
        // Get.defaultDialog(
        //     title: "Error",
        //     content: Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Text(
        //         "${customAuthResult.errorMessage!}",
        //       ),
        //     ),
        //     confirm: FlatButton(
        //       color: Color(0xFF568C48),
        //       onPressed: () {
        //         Get.back();
        //       },
        //       child: Text("OK", style: TextStyle(color: Colors.white)),
        //     ));
        ///////////
        // title: "Error Message",
        // confirmTextColor: Colors.white,
        // onConfirm: () {
        //   Navigator.pop(context);
        // },
        // content: Text(customAuthResult.errorMessage!),
        // );
      }
      // Get.offAll(()=>WalkThroughScreen());
      // login
    }
  }



}