




import 'package:face_card/ui/screens/authentications/auth_screens.dart';
import 'package:face_card/ui/screens/bottom_navigation/bottom_naigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../core/constants/style.dart';
import '../../core/locator.dart';
import '../../core/services/auth_services.dart';


class SplashScreen extends StatefulWidget {
  // const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final _authService = locator<AuthServices>();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashScreenDelay();
  }


  splashScreenDelay() async {
    ///
    /// splash screen delay
    ///
    await Future.delayed(Duration(seconds: 3));

    if (_authService.appUser.appUserId != null && _authService.isLogin!) {
      if (_authService.appUser.isFirstLogin ?? false) {
        Get.offAll(() => BottomNavigation(),
        );
      } else {
        Get.offAll(() => BottomNavigation());
        print('User id=> ${_authService.appUser.appUserId}');
        Future.delayed(Duration(seconds: 1));
        // Get.snackbar("Congrats", "message",snackStyle: SnackStyle.FLOATING,isDismissible: true);
      }
    } else if (_authService.appUser == null && !_authService.isLogin!) {
      Get.offAll(() => AuthScreen());
      print("App user name ${_authService.appUser.userName}");
      print("isLogin ${_authService.isLogin}");
    } else {
      Get.offAll(() => AuthScreen());
      print("User email ${_authService.appUser.userEmail}");
      print("isLogin ${_authService.isLogin}");
    }
    
    // Navigator.push(context, MaterialPageRoute(builder: (context)=>AuthScreen()));


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: gradients,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    child: SvgPicture.asset(
                      "assets/icons/logo.svg",
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                    child: Text(
                      "FaceCard",
                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
    // :Text("You are not connected to the internet");
  }
}
