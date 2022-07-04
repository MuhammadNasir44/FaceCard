








import 'package:face_card/core/constants/colors.dart';
import 'package:face_card/ui/screens/profile/profile_provider.dart';
import 'package:face_card/ui/screens/widgets/custom_button.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../core/enums/view_state.dart';
import '../widgets/custom_textfield.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>ProfileProvider(),
      child: Consumer<ProfileProvider>(
        builder: (context,model,child) {
          return Scaffold(

            appBar: AppBar(
              backgroundColor: Color(0xff5C2CC8),
              automaticallyImplyLeading: true,
              elevation: 0,
              title: Row(
                children: [
                  //
                  // GestureDetector(onTap: (() {}), child: Icon(Icons.menu)),

                  Text('Edit Profile'),


                ],
              ),
            ),

            body: ModalProgressHUD(
              progressIndicator: CircularProgressIndicator(
                color: purpleColor,
              ),
              inAsyncCall: model.state == ViewState.busy,
              child: Container(
                margin: EdgeInsets.all(15),
                child: SingleChildScrollView(
                  child: Column(
                    children: [

                      SizedBox(height: 20,),

                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                            // margin: EdgeInsets.only(bottom: 30),

                            child: CircleAvatar(
                              radius: 60,
                              backgroundImage: model.userImage != null
                                  ? FileImage(model.userImage!)
                                  : AssetImage('assets/icons/prof.png')
                              as ImageProvider,

                            ),
                          ),
                          Container(
                            // margin: EdgeInsets.only(right: 8, bottom: 28),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: purpleColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                minimumSize: Size.zero,
                                padding: EdgeInsets.only(),
                                tapTargetSize: MaterialTapTargetSize
                                    .shrinkWrap,
                              ),
                              onPressed: () {
                                 model.pickImageFromGallery();
                              },
                              child: Icon(
                                Icons.add_a_photo,
                                color: Colors.white,
                                size: 22,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 20,),


                      customTextField(
                        controller: model.nameController,
                        textInputAction: TextInputAction.next,
                        onChanged:(value){
                           model.appUser.password = value;
                        },
                        hinttext: 'UserName',

                      ),
                      SizedBox(height: 20,),

                      customTextField(
                        controller: model.phoneNumberController,
                        textInputAction: TextInputAction.next,
                        onChanged:(value){
                          model.appUser.phoneNumber = value;
                        },
                        hinttext: 'Phone Number',

                      ),
                      SizedBox(height: 20,),

                      customTextField(
                        controller: model.locationController,
                        textInputAction: TextInputAction.next,
                        onChanged:(value){
                          model.appUser.userLocation = value;
                        },
                        hinttext: 'Location',

                      ),
                      SizedBox(height: 20,),
                      customTextField(
                        maxLine: 5,
                        controller: model.descriptonController,
                        textInputAction: TextInputAction.next,
                        onChanged:(value){
                          model.appUser.description = value;
                        },
                        hinttext: 'Description',

                      ),
                      SizedBox(height: 20,),

                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        height: 50,
                        child: RaisedButton(
                          color: Color(0xff482E91),
                          child: Text(
                            "Update Profile",
                            style: TextStyle(color: Colors.white),
                          ),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10),
                          ),
                          onPressed: () {
                            
                            model.updateProfile();





                            // model.signUpUser(model.appUser, context);
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => LoginScreens()));
                          },
                        ),
                      ),




                    ],
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
