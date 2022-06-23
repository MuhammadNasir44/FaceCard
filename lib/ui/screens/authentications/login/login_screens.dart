import 'package:face_card/core/constants/style.dart';
import 'package:face_card/ui/screens/authentications/auth_provider.dart';
import 'package:face_card/ui/screens/bottom_navigation/bottom_naigation.dart';
import 'package:face_card/ui/screens/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:face_card/core/constants/style.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/enums/view_state.dart';
import '../../widgets/custom_textfield.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
class LoginScreens extends StatelessWidget {
  const LoginScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>AuthenticationProvider(),
      child: Consumer<AuthenticationProvider>(
        builder: (context, model,child) {
          return Scaffold(
            body: ModalProgressHUD(
              progressIndicator: CircularProgressIndicator(
                color: purpleColor,
              ),
              inAsyncCall: model.state == ViewState.busy,
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height,

                  decoration: gradients,
                  child: Container(

                    child: Form(
                      key: model.formKey,
                      child: Column(
                        children: [

                          SizedBox(height: 50,),
                          Center(
                            child: Container(
                              child: SvgPicture.asset(
                                "assets/icons/logo.svg",

                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,),

                          Text(
                            'Welcome Back',
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: EdgeInsets.only(left: 20, right: 20),
                            child: customTextField(
                              onChanged: (value){
                                model.appUser.userEmail=value;
                              },
                              hinttext: 'Enter your  Email',
                              prefixIcon: Icon(
                                Icons.mail,
                                color: Colors.yellow,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: EdgeInsets.only(left: 20, right: 20),
                            child: customTextField(
                              onChanged: (value) {
                                model.appUser.password =value;

                              },
                              hinttext: 'Enter your Pasword ',
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.yellow,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 50,
                            child: RaisedButton(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              color: Color(0xff482E91),
                              child: Text(
                                "             Login             ",
                                style: TextStyle(color: Colors.white),
                              ),
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10),
                              ),
                              onPressed: () {
                                model.loginUser(model.appUser, context);
                              },
                            ),
                          ),
                        ],
                      ),
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
