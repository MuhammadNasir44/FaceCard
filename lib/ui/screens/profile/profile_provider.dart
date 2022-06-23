





import 'package:face_card/core/models/base_view_model.dart';
import 'package:face_card/core/services/auth_services.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/locator.dart';
import '../../../core/models/app_user.dart';

class ProfileProvider extends BaseViewModal{

  AuthServices authServices = AuthServices();

  AppUser appUser = AppUser();
  final formKey = GlobalKey<FormState>();
  final locateUser = locator<AuthServices>();


  ProfileProvider(){

    this.appUser = locateUser.appUser;
  }


}