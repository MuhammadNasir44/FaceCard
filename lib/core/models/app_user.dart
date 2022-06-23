import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppUser extends ChangeNotifier {
  String? appUserId;
  String? userName;
  String? profileImage;
  String? userEmail;
  String? userLocation;
  String? phoneNumber;
  String? description;
  String? password;
  // String? confirmPassword;
  bool? isFirstLogin;
  DateTime? createdAt;
  DateTime? deliveryDate;
  double? initialWeight;
  String? monthYear;
  DateTime? lastEntry;

  AppUser({
    this.appUserId,
    this.profileImage,
    this.userEmail,
    this.userName,
    this.userLocation,
    this.phoneNumber,
    this.description,
    this.password,
    // this.confirmPassword,
    this.isFirstLogin,
    this.createdAt,
    this.deliveryDate,
    this.initialWeight,
    this.monthYear,
    this.lastEntry,
  });


  AppUser.fromJson(json,id){
    this.appUserId = id;
    this.profileImage = json['profileImage'];
    this.userName = json['userName'] ?? '';
    this.userEmail = json['userEmail'];
    this.userLocation = json['userLocation'];
    this.password = json['password'];
    this.phoneNumber = json['phoneNumber'] ?? '';
    this.description = json['description'] ?? '';
    this.isFirstLogin = json['isFirstLogin'];
    this.createdAt = json['createdAt'].toDate();
    this.initialWeight=json['initialWeight'];
    this.monthYear = json['monthYear'];
    this.lastEntry = json['lastEntry'].toDate();

  }
  toJson() {
    return {
      'appUserId': this.appUserId,
      'profileImage':profileImage,
      'userName': this.userName,
      'userEmail': this.userEmail,
      'phoneNumber': this.phoneNumber,
      'password': this.password,
      'description': this.description,
      'isFirstLogin': this.isFirstLogin,
      'createdAt': this.createdAt,
      'deliveryDate':this.deliveryDate,
      'initialWeight':this.initialWeight,
      'monthYear':this.monthYear,
      'lastEntry':this.lastEntry,
      'userLocation':this.userLocation,
    };
  }

}
