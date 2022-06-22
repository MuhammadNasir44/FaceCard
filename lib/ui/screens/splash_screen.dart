




import 'package:face_card/ui/screens/authentications/auth_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constants/style.dart';


class SplashScreen extends StatefulWidget {
  // const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


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
    
    Navigator.push(context, MaterialPageRoute(builder: (context)=>AuthScreen()));


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
