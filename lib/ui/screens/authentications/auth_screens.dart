



import 'package:face_card/core/constants/colors.dart';
import 'package:face_card/ui/screens/authentications/signup/sign_up_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/custom_button.dart';
class AuthScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff18234D),
      body: Container(
        margin: EdgeInsets.only(left: 15,right: 5),
        child: Column(
          children: [
            Container(
              height: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(0),
                    bottomLeft: Radius.circular(250)),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomLeft,
                    colors: [Colors.blue, Colors.purple]),
              ),
              child: Center(
                child: Column(children: [
                  SizedBox(height: 50,),
                  Container(
                    child: SvgPicture.asset(
                      "assets/icons/logo.svg",
                      height: 100,
                    ),
                  ),
                  Text(
                    'FaceCard',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ]),
              ),
            ),
            SizedBox(height: 30),
            Container(

              child: RaisedButton(
                color: Colors.white,
                child: Row(
                  children: [
                  SvgPicture.asset(
                  "assets/icons/googleicon.svg",

                ),
                    SizedBox(
                      width: 5,
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: 50, top: 20, bottom: 20),
                      child: Text(
                        'SignUp with Google',
                      ),
                    ),
                  ],
                ),
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10),
                ), onPressed: () {  },
              ),
            ),
    //         CustomButton(
    //           color: Colors.white,
    //           icon:Icons.facebook,
    //           title: 'SignUp with Google',
    //           Style: TextStyle(color: Color.fromARGB(255, 88, 88, 88)),
    //           onPressed: () {},
    // ),
            SizedBox(height: 30),

            CustomButton(
              color:purpleColor,
              icon: Icons.facebook,
              title: 'SignUp with Facebook',
              Style: TextStyle(color: Colors.white),
              onPressed: () {},
            ),
            SizedBox(height: 10),
            Text(
              "OR",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 10),
            CustomButton(

              color: yellowColor,
              icon: Icons.edit,
              title: 'SignUp with Manually',
              Style: TextStyle(color: Colors.white),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
              },
            ),

            SizedBox(height: 20,),
            RichText(
              text: TextSpan(
                  text: 'Already have an account? ',
                  style: TextStyle(
                      color: Colors.grey, fontSize: 15),
                  children: <TextSpan>[
                    TextSpan(text: 'Log In ',
                        style: TextStyle(
                            color: Color(0xffF2C921), fontSize: 15),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // navigate to desired screen
                          }
                    ),



                  ]
              ),
            ),
            SizedBox(height: 10)
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
