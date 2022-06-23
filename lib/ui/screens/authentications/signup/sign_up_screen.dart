import 'package:face_card/core/constants/colors.dart';
import 'package:face_card/ui/screens/authentications/auth_provider.dart';
import 'package:face_card/ui/screens/authentications/login/login_screens.dart';
import 'package:face_card/ui/screens/widgets/custom_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/enums/view_state.dart';
import '../../widgets/custom_textfield.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
class SignUpScreen extends StatelessWidget {
  final checkBoxNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>AuthenticationProvider(),
      child: Consumer<AuthenticationProvider>(
        builder: (context,model,child) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(80),
              child: AppBar(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(10),
                  ),
                ),
                title: Text('Sign Up'),
                backgroundColor: purpleColor,
                leading: InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.arrow_back_ios_new,
                  ),
                ),
              ),
            ),
            body: ModalProgressHUD(
              progressIndicator: CircularProgressIndicator(
                color: purpleColor,
              ),
              inAsyncCall: model.state == ViewState.busy,
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  child: Form(
                    key: model.formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Center(
                            child: CircleAvatar(
                              radius: 40,
                              child: Icon(
                                Icons.person,
                                size: 50,
                                color: Colors.white,
                              ),
                              backgroundColor: purpleColor,
                            ),
                          ),
                        ),
                        Text(
                          'Upload Profile Photo',
                          style: TextStyle(
                            color: Color.fromARGB(255, 122, 119, 119),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        customTextField(
                          onChanged:(value){
                            model.appUser.userName = value;
                          },
                          hinttext: 'User Name',
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.yellow,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        customTextField(
                          onChanged:(value){
                            model.appUser.phoneNumber = value;
                          },
                          hinttext: 'Mobile Number',
                          prefixIcon: Icon(
                            Icons.call,
                            color: Colors.yellow,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        customTextField(
                          onChanged:(value){
                            model.appUser.userLocation = value;
                          },
                          hinttext: 'Location',
                          prefixIcon: Icon(
                            Icons.location_history,
                            color: Colors.yellow,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        customTextField(
                          onChanged:(value){
                            model.appUser.userEmail = value;
                          },
                          hinttext: 'Email',
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.yellow,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        customTextField(
                          onChanged:(value){
                            model.appUser.password = value;
                          },
                          hinttext: 'Pasword',
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.yellow,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: ListTile(
                                horizontalTitleGap: 0.0,
                                contentPadding: EdgeInsets.zero,
                                leading: Checkbox(
                                  focusNode: checkBoxNode,
                                  value: false,
                                  onChanged: (newValue) {
                                    print(newValue);
                                    // model.termsAndConditions(newValue);
                                  },
                                  activeColor: Colors.red,
                                ),
                                title: RichText(
                                  text: TextSpan(
                                      text: 'I agree with the ',
                                      style:
                                      TextStyle(color: Colors.grey, fontSize: 18),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: 'Terms & Conditions ',
                                            style: TextStyle(
                                                color: Color(0xffF2C921),
                                                fontSize: 15),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                // navigate to desired screen
                                              }),
                                        TextSpan(
                                            text: 'and the ',
                                            style: TextStyle(
                                                color: Colors.grey, fontSize: 15),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                // navigate to desired screen
                                              }),
                                        TextSpan(
                                            text: 'Privacy Policy ',
                                            style: TextStyle(
                                                color: Color(0xffF2C921),
                                                fontSize: 15),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                // navigate to desired screen
                                              }),
                                        TextSpan(
                                            text: 'of FaceCard.',
                                            style: TextStyle(
                                                color: Colors.grey, fontSize: 15),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                // navigate to desired screen
                                              }),
                                      ]),
                                ),
                                // Text('By signing up you must agree to our Terms and Conditions',),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          height: 50,
                          child: RaisedButton(
                            color: Color(0xff482E91),
                            child: Text(
                              "Continue",
                              style: TextStyle(color: Colors.white),
                            ),
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10),
                            ),
                            onPressed: () {

                              model.signUpUser(model.appUser, context);
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => LoginScreens()));
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        RichText(
                          text: TextSpan(
                              text: 'Already have an account? ',
                              style: TextStyle(color: Colors.grey, fontSize: 15),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Log In ',
                                    style: TextStyle(
                                        color: Color(0xffF2C921), fontSize: 15),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        // navigate to desired screen
                                      }),
                              ]),
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
