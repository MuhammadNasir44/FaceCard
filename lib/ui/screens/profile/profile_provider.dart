





import 'dart:io';

import 'package:face_card/core/models/base_view_model.dart';
import 'package:face_card/core/services/auth_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/enums/view_state.dart';
import '../../../core/locator.dart';
import '../../../core/models/app_user.dart';
import '../../../core/services/database_services.dart';
import '../../../core/services/database_storage_services.dart';
import 'package:get/get.dart';
class ProfileProvider extends BaseViewModal{

  XFile? image;
  File? userImage;
  String? imageUrl;
  final ImagePicker imagePicker = ImagePicker();
  DatabaseStorageServices databaseStorageServices = DatabaseStorageServices();
  DatabaseServices databaseServices = DatabaseServices();

  AuthServices authServices = AuthServices();

  AppUser appUser = AppUser();
  final formKey = GlobalKey<FormState>();
  final locateUser = locator<AuthServices>();

  var nameController;
  var descriptonController;
  var locationController;
  var phoneNumberController;



  ProfileProvider(){
    this.appUser = locateUser.appUser;
    nameController = TextEditingController(text: appUser.userName);
    descriptonController = TextEditingController(text: appUser.description);
    locationController = TextEditingController(text: appUser.userLocation);
    phoneNumberController = TextEditingController(text: appUser.phoneNumber);
  }

  pickImageFromGallery() async {
    image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      userImage = File(image!.path);
      // print("UserImagePath=>${userImage!.path}");
      notifyListeners();
    }
  }



  updateProfile()
  async{

    if(userImage!=null)
    {
      setState(ViewState.busy);
      imageUrl = await databaseStorageServices.uploadUserImage(
          userImage!, locateUser.appUser.appUserId!);

      print("Here is the image URl:=======>"+imageUrl.toString());

      locateUser.appUser.profileImage= imageUrl;
      await databaseServices.updateUserProfile(appUser);
      Get.snackbar(
        "Updated",
        "Your profile has been updated",
        snackPosition: SnackPosition.BOTTOM,
      );
      setState(ViewState.idle);
      print("User Image url=> $imageUrl");
      notifyListeners();
    }else
    {
      setState(ViewState.busy);
      await databaseServices.updateUserProfile(appUser);
      setState(ViewState.idle);
      Get.snackbar(
        "Updated",
        "Your profile has been updated",
        snackPosition: SnackPosition.BOTTOM,
      );

    }

  }


}