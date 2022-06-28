

import 'package:firebase_auth/firebase_auth.dart';
import '../models/app_user.dart';
import 'auth_exception_message.dart';
import 'custom_auth_result.dart';
import 'database_services.dart';

class AuthServices{

   final databaseServices = DatabaseServices();
  final customAuthResult = CustomAuthResult();
  final authInstant = FirebaseAuth.instance;
  bool? isLogin;
  User? user;
  AppUser appUser = AppUser();

  //
  AuthServices(){
    init();
  }

  init() async{
    user = authInstant.currentUser;
    if (user != null) {
      isLogin = true;
      this.appUser = await databaseServices.getUser(user!.uid);
      print('userId => ${this.appUser.appUserId}');
    } else {
      isLogin = false;
    }
  }
  // //
  Future<CustomAuthResult> signUpUser(AppUser appUser) async{
    try{
      final credential = await authInstant.createUserWithEmailAndPassword(
          email: appUser.userEmail!,
          password: appUser.password!
      );
      if(credential.user != null){
        print('user registered');
        this.appUser = appUser;
        this.appUser.appUserId = credential.user!.uid;
         this.isLogin = true;
        print("SignUpUserId=> ${this.appUser.appUserId}");
        this.appUser.zaps = 50;
        this.appUser.faceCardNumber = 0;
        await databaseServices.registerUser(appUser);
        this.appUser = await databaseServices.getUser(credential.user!.uid);
        customAuthResult.user = credential.user;
      }
    }
    catch(e){
      print('Exception@signUpUser oooops $e');
      customAuthResult.errorMessage = AuthExceptionsMessages.generateExceptionMessage(e);
    }
    return customAuthResult;
  }


   ///
   /// Login user
   ///
   Future<CustomAuthResult> loginUser(AppUser appUser)async{
     try{
       final credentials = await authInstant.signInWithEmailAndPassword(
           email: appUser.userEmail!,
           password: appUser.password!
       );
       print("User logined successfully");
       if(credentials.user != null){
         customAuthResult.user = credentials.user;
         this.appUser = appUser;
         this.appUser.appUserId = credentials.user!.uid;
         this.isLogin = true;
         ///
         /// Get user
         ///
         this.appUser = await databaseServices.getUser(credentials.user!.uid);
       }
     }
     catch(e){
       print('Exception@LoginUser $e');
       customAuthResult.errorMessage = AuthExceptionsMessages.generateExceptionMessage(e);
     }
     return customAuthResult;
   }

   ///
   /// Reset user password
   ///
   resetUserPassword(String email) async{
     print('Reset User password Email=>$email');
     await authInstant.sendPasswordResetEmail(email: email);
     print('Link sent to Email=>$email');
   }


  ///
   ///
   /// logout
  Future<void> logoutUser() async {
    await authInstant.signOut();
    this.isLogin = false;
    this.appUser = AppUser();
    this.user = null;

    print("User logout successfully.........");
  }

}