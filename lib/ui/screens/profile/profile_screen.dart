




import 'package:face_card/core/constants/colors.dart';
import 'package:face_card/core/constants/style.dart';
import 'package:face_card/ui/screens/profile/profile_provider.dart';
import 'package:face_card/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/icons_texts.dart';
class ProfileScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(context)=>ProfileProvider(),
      child: Consumer<ProfileProvider>(
        builder: (context,model,child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xff5C2CC8),
              automaticallyImplyLeading: false,
              elevation: 0,
              title: Row(
                children: [

                  GestureDetector(onTap: (() {}), child: Icon(Icons.menu)),
                  SizedBox(width: 20,),
                  Text('Edit Profile'),


                ],
              ),

              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: GestureDetector(onTap: () {}, child: Icon(Icons.edit)),
                ),
              ],
            ),
            body: Container(
              decoration: gradients,
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage(
                        'images/batman.png',
                      ),
                      child: Text(''),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            model.appUser.userName==null?'Theresa Khan':model.appUser.userName.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Your Text Second Lines Goes Here',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          icon_texts(
                              icon: Icons.call,
                              txt1: 'Phone Number',
                              txt2: model.appUser.phoneNumber==null?'+xx 000 00000':model.appUser.phoneNumber.toString()),
                          SizedBox(
                            height: 15,
                          ),
                          icon_texts(
                            icon: Icons.location_city,
                            txt1: 'Location',
                            txt2: model.appUser.userLocation==null?'US':model.appUser.userLocation.toString(),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          icon_texts(
                            icon: Icons.mail,
                            txt1: 'Email Address',
                            txt2: model.appUser.userEmail==null?'EmailAddress@gmail.com':model.appUser.userEmail.toString(),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          icon_texts(
                            icon: Icons.password_outlined,
                            txt1: 'Password',
                            txt2: '**********',
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          icon_texts(
                            icon: Icons.privacy_tip_rounded,
                            txt1: 'Privacy Policy',
                            txt2: "",
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          icon_texts(
                            onPressed: ()async{
                              await model.locateUser.logoutUser();
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>SplashScreen()));
                            },
                            icon: Icons.logout,
                            txt1: 'LogOut',
                            txt2: '',
                          ),
                        ],
                      ),
                    ),
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
