import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:face_card/core/models/zap_requst_model.dart';
import 'package:face_card/core/services/auth_services.dart';
import 'package:intl/intl.dart';
import '../locator.dart';
import '../models/app_user.dart';

class DatabaseServices {
  final firebaseFireStore = FirebaseFirestore.instance;

  // final currentAppUser = locator<AuthServices>();

  ///
  /// Add user
  ///
  registerUser(AppUser appUser) {
    try {
      firebaseFireStore
          .collection("AppUser")
          .doc(appUser.appUserId)
          .set(appUser.toJson());
    } catch (e) {
      print('Exception $e');
    }
  }

  ///
  /// Get user
  ///
  Future<AppUser> getUser(id) async {
    print('GetUser id: $id');
    try {
      final snapshot = await firebaseFireStore.collection('AppUser')
          .doc(id)
          .get();
      // print('Current app User Data: ${snapshot.data()}');
      return AppUser.fromJson(snapshot.data(), snapshot.id);
    } catch (e) {
      print('Exception @DatabaseService/getUser $e');
      return AppUser();
    }
  }

  ///
  /// get all app users
  ///
  Future<List<AppUser>> getAppUsers() async {
    final List<AppUser> appUserList = [];
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('AppUser').where(
          'appUserId', isNotEqualTo: locator<AuthServices>().appUser.appUserId)
          .get();
      if (snapshot.docs.length > 0) {
        snapshot.docs.forEach((element) {
          appUserList.add(AppUser.fromJson(element, element.id));
          print("getUser => ${element['userName']}");
        });
      } else {
        print("No data found");
      }
    } catch (e) {
      print('Exception @DatabaseService/GetAllUsers $e');
    }
    return appUserList;
  }

  ///
  /// get all app users
  ///
  Future<List<AppUser>> getTopThreeUsers() async {
    final List<AppUser> appUserList = [];
    try {
      QuerySnapshot snapshot = await firebaseFireStore.collection('AppUser').orderBy('zaps',descending: true)
          .get();
      if (snapshot.docs.length > 0) {
        snapshot.docs.forEach((element) {
          appUserList.add(AppUser.fromJson(element, element.id));
          print("getUser => ${element['userName']}");
        });
      } else {
        print("No data found");
      }
    } catch (e) {
      print('Exception @DatabaseService/GetAllUsers $e');
    }
    return appUserList;
  }


  updateUserProfile(AppUser appUser) async {
    try {
      await firebaseFireStore
          .collection('AppUser')
          .doc(appUser.appUserId)
          .update(appUser.toJson());
    } catch (e) {
      print('Exception@UpdateUserProfile=>$e');
    }
  }


  updateotherUserProfile(double zaps,String userId) async {
    try {
      await firebaseFireStore
          .collection('AppUser')
          .doc(userId.toString())
          .update({
        'zaps':zaps,
      });
    } catch (e) {
      print('Exception@UpdateUserProfile=>$e');
    }
  }


  sendZapsRequest(ZapRequestModel zapRequestModel,String recieverId) async {

    try {
      await firebaseFireStore
          .collection('ZapRequests')
          .doc(recieverId).collection("setRequest").doc()
          .set(zapRequestModel.toJson());
    } catch (e) {
      print('Exception@Zaps requests=>$e');
    }



  }


  //
  // setWeight(WeightTracking weightTracking) async {
  //   try{
  //
  //     await firebaseFireStore.collection("WeightTracking").doc(weightTracking.appUserId).collection("setWeight").doc().set(weightTracking.toJson());
  //
  //   } catch (e){
  //     print('Exception@WeightTracking=>$e');
  //
  //   }
  //
  //
  // }
  //
  //
  // Stream<QuerySnapshot>? getWeeklyWeight(String userId){
  //
  //   try {
  //     Stream<QuerySnapshot> snapshot = firebaseFireStore
  //         .collection('WeightTracking')
  //         .doc(userId)
  //         .collection('setWeight').orderBy('dateTime',descending: false).limit(36)
  //         .snapshots();
  //     print("Successfully Fetched");
  //     return snapshot;
  //   } catch (e) {
  //     print('Exception@ GetWeeklyWeight ==> $e');
  //     return null;
  //   }
  //
  // }
  //
  // setKickCounter(KickCounterModel kickCounterModel)async{
  //
  //   try{
  //     await firebaseFireStore.collection("KickCounting").doc(kickCounterModel.appUserId)
  //         .collection("setKickCounting").doc().set(kickCounterModel.toJson());
  //   //
  //
  //   }catch (e){
  //     print('Exception@KickCounter=>$e');
  //   }
  // }
  // endKickCounter(KickCounterModel kickCounterModel) async {
  //
  //   try{
  //     await firebaseFireStore.collection("KickCounting").doc(kickCounterModel.appUserId)
  //         .collection("setKickCounting").doc(DateFormat('dd-MM-yyyy').format(DateTime.now())).collection("SetKickCountingData").doc().set(kickCounterModel.toJson());
  //
  //   }catch (e){
  //     print('Exception@KickCounter=>$e');
  //   }
  //
  // }
  //
  //
  //
  // setCalenderData(CalenderModel calenderModel) async {
  //
  //   try{
  //
  //     await firebaseFireStore.collection("CalenderData").doc(calenderModel.appUserId).collection("SetCalende").doc().set(calenderModel.toJson());
  //
  //   }catch (e){
  //     print('Exception@Calender=>$e');
  //
  //   }
  // }
  //
  //
  // Stream<QuerySnapshot>? getCalenderData(String userId){
  //   try {
  //     Stream<QuerySnapshot> snapshot = firebaseFireStore
  //         .collection('CalenderData')
  //         .doc(userId)
  //         .collection('SetCalende').orderBy('selectedDate',descending: false).limit(36)
  //         .snapshots();
  //     print("Successfully Fetched");
  //     return snapshot;
  //   } catch (e) {
  //     print('Exception@ GetWeeklyWeight ==> $e');
  //     return null;
  //   }
  //
  // }
  //
  //
  // setBloodPressureData(BloodPressureModel bloodPressureModel) async {
  //   try{
  //
  //     await firebaseFireStore.collection("BloodPressure").doc(bloodPressureModel.appUserId).collection("SetBloodPressure").doc().set(bloodPressureModel.toJson());
  //
  //   }catch (e){
  //     print('Exception@BloodPressure=>$e');
  //
  //   }
  //
  // }
  //
  //
  // Stream<QuerySnapshot>? getBloodPressure(String userId){
  //
  //   try {
  //     Stream<QuerySnapshot> snapshot = firebaseFireStore
  //         .collection('BloodPressure')
  //         .doc(userId)
  //         .collection('SetBloodPressure').orderBy('currentDate',descending: false).limit(36)
  //         .snapshots();
  //     print("Successfully Fetched");
  //     return snapshot;
  //   } catch (e) {
  //     print('Exception@ GetWeeklyWeight ==> $e');
  //     return null;
  //   }
  //
  // }
  //
  //
  // Stream<QuerySnapshot>? getHelpfulTip(){
  //
  //   try {
  //     Stream<QuerySnapshot> snapshot = firebaseFireStore
  //         .collection('HelpfulTips')
  //         .orderBy('selectedDate',descending: false).limit(36)
  //         .snapshots();
  //     print("Successfully Fetched");
  //     return snapshot;
  //   } catch (e) {
  //     print('Exception@ GetBloodPressure ==> $e');
  //     return null;
  //   }
  //
  // }
  //
  // setNoteData(AddNoteModel addNoteModel) async {
  //   try{
  //
  //     await firebaseFireStore.collection("notesData").doc(addNoteModel.appUserId).collection("SetNotesData").doc().set(addNoteModel.toJson());
  //
  //   }catch (e){
  //     print('Exception@addNoteData=>$e');
  //
  //   }
  //
  // }




  // updateUserProfile(AppUser appUser) async {
  //   try {
  //     await firebaseFireStore
  //         .collection('AppUser')
  //         .doc(appUser.appUserId)
  //         .update(appUser.toJson());
  //   } catch (e) {
  //     print('Exception@UpdateUserProfile=>$e');
  //   }
  // }
  //
  // ///
  // /// Update first login value
  // ///
  // updateFirstLoginValue(AppUser appUser, String id) async {
  //   try {
  //     await firebaseFireStore.collection("AppUser").doc(id).update(
  //         appUser.toJson());
  //   } catch (e) {
  //     print('Exception @DatabaseService/updateFirstLoginValue $e');
  //   }
  // }
  //
  // ///
  // /// get all app users
  // ///
  // Future<List<AppUser>> getAllAppUser() async {
  //   final List<AppUser> appUserList = [];
  //   try {
  //     QuerySnapshot snapshot = await firebaseFireStore.collection('AppUser')
  //         .where(
  //         "userEmail", isNotEqualTo: locator<AuthServices>().appUser.userEmail)
  //         .where('makeProfilePrivate', isEqualTo: false)
  //         .get();
  //     if (snapshot.docs.length > 0) {
  //       snapshot.docs.forEach((element) {
  //         appUserList.add(AppUser.fromJson(element, element.id));
  //         print("getUser => ${element['userName']}");
  //       });
  //     } else {
  //       print("No data found");
  //     }
  //   } catch (e) {
  //     print('Exception @DatabaseService/GetAllUsers $e');
  //   }
  //   return appUserList;
  // }
  //
  // ///
  // /// get all app users
  // ///
  // Future<List<AppUser>> getAppUsers() async {
  //   final List<AppUser> appUserList = [];
  //   try {
  //     QuerySnapshot snapshot = await firebaseFireStore.collection('AppUser')
  //         .where('makeProfilePrivate', isEqualTo: false)
  //         .get();
  //     if (snapshot.docs.length > 0) {
  //       snapshot.docs.forEach((element) {
  //         appUserList.add(AppUser.fromJson(element, element.id));
  //         print("getUser => ${element['userName']}");
  //       });
  //     } else {
  //       print("No data found");
  //     }
  //   } catch (e) {
  //     print('Exception @DatabaseService/GetAllUsers $e');
  //   }
  //   return appUserList;
  // }
  //
  // ///
  // /// add Questionnaires
  // ///
  // addQuestionnaires(QuestionnairesModel questionnairesModel, String id) async {
  //   try {
  //     await firebaseFireStore.collection('Questionnaires').doc(id).set(
  //         questionnairesModel.toJson());
  //   } catch (e) {
  //     print('Exception @DatabaseService/addQuestionnaires $e');
  //   }
  // }
  //
  // ///
  // /// update Questionnaires
  // ///
  // updateQuestionnaires(QuestionnairesModel questionnairesModel,
  //     String userId) async {
  //   try {
  //     await firebaseFireStore.collection('Questionnaires').doc(userId).update(
  //         questionnairesModel.toJson());
  //   } catch (e) {
  //     print('Exception @DatabaseService/updateQuestionnaires $e');
  //   }
  // }
  //
  // ///
  // /// User basic Questions / App setup
  // ///
  // Future<QuestionnairesModel> getQuestionnaires(String id) async {
  //   print('Questionnaires User id=> $id');
  //   try {
  //     final snapshot = await firebaseFireStore.collection('Questionnaires').doc(
  //         id).get();
  //     print('Questionnaires Data: ${snapshot.data()}');
  //     return QuestionnairesModel.fromJson(snapshot.data(), snapshot.id);
  //   } catch (e) {
  //     print('Exception @DatabaseService/QuestionnairesData $e');
  //     return QuestionnairesModel();
  //   }
  // }
  //
  //
  // Future<bool> myCheckRecordFun(String id) async {
  //   try {
  //     var dateTime = DateTime.now();
  //     var onlyDate = DateFormat('dd-MM-yyyy');
  //     String formattedDate = onlyDate.format(dateTime).toString();
  //     var existsDoc = await firebaseFireStore.collection("Journals").doc(id)
  //         .collection("UserJournals").doc(formattedDate)
  //         .get();
  //
  //     if (!existsDoc.exists) {
  //       print("Document does not exist");
  //       return false;
  //     } else if (existsDoc.exists) {
  //       print("doucoment exist ==");
  //       print(
  //           "Today record exists ==============================================");
  //       return true;
  //     }
  //   } catch (e) {
  //
  //   }
  //   return false;
  // }
  //
  // ///
  // /// Add user behaviours and score
  // ///
  // Future<bool> addUserBehaviour(String id, Behaviour behaviour) async {
  //   var dateTime = DateTime.now();
  //   var onlyDate = DateFormat('dd-MM-yyyy');
  //   String formattedDate = onlyDate.format(dateTime).toString();
  //
  //   try {
  //     var existsDoc = await firebaseFireStore.collection("Journals").doc(id)
  //         .collection("UserJournals").doc(formattedDate)
  //         .get();
  //
  //     print("Checking condition bro ========== " + "${existsDoc.exists}");
  //
  //     print("Here is the user ID: " + id);
  //
  //     if (!existsDoc.exists) {
  //       await firebaseFireStore.collection("Journals").doc(id).collection(
  //           "UserJournals").doc(formattedDate).set(behaviour.toJson());
  //     } else if (existsDoc.exists) {
  //       print(
  //           "Today record exists ==============================================");
  //       return true;
  //     }
  //   } catch (e) {
  //     print('Exception @DatabaseService/addUserBehaviour$e');
  //   }
  //   return false;
  // }
  //
  // ///
  // /// Get user behaviour stream
  // ///
  //
  // Stream<QuerySnapshot>? getUserBehaviourStream(String currentUserId) {
  //   try {
  //     Stream<QuerySnapshot> snapShot = firebaseFireStore
  //         .collection("Journals")
  //         .doc(currentUserId)
  //         .collection("UserJournals")
  //         .orderBy('addedAt', descending: true)
  //         .snapshots();
  //     return snapShot;
  //   } catch (e) {
  //     print("Exception@UserBehaviour$e");
  //     return null;
  //   }
  // }
  //
  // Future<List<Behaviour>> getUserJournal(String uid) async {
  //   final List<Behaviour> behaviourList = [];
  //   print('User id for Journals: $uid');
  //   try {
  //     QuerySnapshot snapshot = await firebaseFireStore
  //         .collection("Journals")
  //         .doc(uid)
  //         .collection("UserJournals")
  //         .orderBy('addedAt', descending: true)
  //         .get();
  //     if (snapshot.docs.length > 0) {
  //       snapshot.docs.forEach((DocumentSnapshot doc) {
  //         behaviourList.add(Behaviour.fromJson(doc, doc.id));
  //         print("Journals behaviours => ${doc['behaviours']}");
  //         print("Journals score => ${doc['scores']}");
  //       });
  //     } else {
  //       print('No data in the list');
  //     }
  //   } catch (e) {
  //     print('Exception @DatabaseService/getUserBehaviour => $e');
  //   }
  //   return behaviourList;
  // }
  //
  // Future<Behaviour> getTodayJournal(String uid, String docId) async {
  //   Behaviour behaviour = Behaviour();
  //   try {
  //     final snapshot = await firebaseFireStore.collection('Journals').doc(uid)
  //         .collection('UserJournals').doc(docId)
  //         .get();
  //     if (snapshot.exists) {
  //       print('Today Journal : ${snapshot.data()}');
  //       return Behaviour.fromJson(snapshot.data(), snapshot.id);
  //     } else {
  //       return behaviour;
  //     }
  //   } catch (e) {
  //     print('Exception @DatabaseService/getTodayJournal $e');
  //     return Behaviour();
  //   }
  // }
  //
  // ///
  // /// get recent journal
  // ///
  // Future<List<Behaviour>> getRecentJournal(String uid) async {
  //   List<Behaviour> behaviours = [];
  //   try {
  //     final snapshot = await firebaseFireStore.collection('Journals').doc(uid)
  //         .collection('UserJournals').orderBy('addedAt', descending: true)
  //         .limit(1)
  //         .get();
  //     if (snapshot.docs.length > 0) {
  //       snapshot.docs.forEach((DocumentSnapshot doc) {
  //         behaviours.add(Behaviour.fromJson(doc, doc.id));
  //         print("Journals behaviours => ${doc['behaviours']}");
  //         print("Journals score => ${doc['scores']}");
  //       });
  //     } else {
  //       print('No data in the list');
  //     }
  //   } catch (e) {
  //     print('Exception @DatabaseService/getRecentJournal $e');
  //   }
  //   return behaviours;
  // }
  //
  // ///
  // /// Edit User journal
  // ///
  // updateUserJournal(String userId, Behaviour behaviour) {
  //   try {
  //     firebaseFireStore
  //         .collection('Journals')
  //         .doc(userId)
  //         .collection("UserJournals")
  //         .doc(behaviour.behaviorId)
  //         .update(behaviour.toJson());
  //   } catch (e) {
  //     print('Exception@ updateJournalData ==> $e');
  //   }
  // }
  //
  // ///====================================///
  // ///============== chat ===============///
  // ///===================================///
  //
  // addUserMessage(AppUser currentAppUser, String toUserId,
  //     Conversation conversation, AppUser toAppUser) async {
  //   try {
  //     // await firebaseFireStore.collection("Conversations").doc("$fromUserId").set(appUser.toJson());
  //     // await firebaseFireStore.collection("Conversations").doc("$fromUserId$toUserId").collection("Messages").add(conversation.toJson());
  //     ///
  //     /// From User message
  //     ///
  //     await firebaseFireStore
  //         .collection("Conversations")
  //         .doc("${currentAppUser.appUserId}")
  //         .collection("Chats")
  //         .doc("$toUserId")
  //         .collection("messages")
  //         .add(conversation.toJson());
  //     await firebaseFireStore
  //         .collection("Conversations")
  //         .doc("${currentAppUser.appUserId}")
  //         .collection("Chats")
  //         .doc("$toUserId")
  //         .set(toAppUser.toJson());
  //
  //     ///
  //     /// to user message
  //     ///
  //     await firebaseFireStore
  //         .collection("Conversations")
  //         .doc("$toUserId")
  //         .collection("Chats")
  //         .doc("${currentAppUser.appUserId}")
  //         .collection("messages")
  //         .add(conversation.toJson());
  //     await firebaseFireStore
  //         .collection("Conversations")
  //         .doc("$toUserId")
  //         .collection("Chats")
  //         .doc("${currentAppUser.appUserId}")
  //         .set(currentAppUser.toJson());
  //   } catch (e) {
  //     print('Exception@sentUserMessage$e');
  //   }
  // }
  //
  // ///
  // /// Get conversation users list
  // ///
  // Stream<QuerySnapshot>? getUserConversationList(AppUser appUser) {
  //   try {
  //     Stream<QuerySnapshot> snapshot = firebaseFireStore
  //         .collection("Conversations")
  //         .doc(appUser.appUserId)
  //         .collection("Chats")
  //         .orderBy('lastMessageAt', descending: false)
  //         .snapshots();
  //     return snapshot;
  //   } catch (e) {
  //     print('Exception@GetUserConversationList$e');
  //     return null;
  //   }
  // }
  //
  // ///
  // /// get user all messages
  // ///
  // // Future<List<Conversation>> getAllMessages(String currentUserId, String toUserId) async{
  // //   final List<Conversation> chatList = [];
  // //   print("FromUserId=> $currentUserId");
  // //   print("ToUserId=> $toUserId");
  // //   try{
  // //     QuerySnapshot snapshot = await firebaseFireStore.collection("Conversations")
  // //         .doc(currentUserId).collection("Chats").doc(toUserId)
  // //         .collection("messages").orderBy('sentAt',descending: false).get();
  // //     print("messages length => ${snapshot.docs.length}");
  // //
  // //     if(snapshot.docs.length > 0){
  // //       snapshot.docs.forEach((element) {
  // //         chatList.add(Conversation.formJson(element, element.id));
  // //         print("Message => ${chatList[0].messageText}");
  // //         print(element['messageText']);
  // //         print(element.id);
  // //       });
  // //       print("Message obj => ${chatList[1]}");
  // //     }else{
  // //       print("No messages found");
  // //     }
  // //   }catch(e){
  // //     print('Exception@GetUserMessages$e');
  // //   }
  // //   return chatList;
  // // }
  //
  // ///
  // /// Stream Messages
  // ///
  // ///
  //
  // Stream<QuerySnapshot>? getRealTimeChat(String currentUserId,
  //     String toUserId) {
  //   try {
  //     Stream<QuerySnapshot> messageSnapshot = firebaseFireStore
  //         .collection("Conversations")
  //         .doc(currentUserId)
  //         .collection("Chats")
  //         .doc(toUserId)
  //         .collection("messages")
  //         .orderBy('sentAt', descending: true)
  //         .snapshots();
  //     return messageSnapshot;
  //   } catch (e) {
  //     print('Exception@GetUserMessagesStream=>$e');
  //     return null;
  //   }
  // }
  //
  // ///
  // /// Contact us
  // ///
  // addContactUsDetails(String userId, ContactModel contactModel) async {
  //   try {
  //     await firebaseFireStore
  //         .collection('ContactUs')
  //         .doc(userId)
  //         .collection('UserContacts')
  //         .add(contactModel.toJson());
  //   } catch (e) {
  //     print("Exception@addContactUsDetails => $e");
  //   }
  // }
  //
  // sendMessageToCoach(String userId, String message) async {
  //   try {
  //     await firebaseFireStore.collection('UserMessageToCoach').doc(userId).set(
  //         {
  //           'userId': userId,
  //           'message': message,
  //           'messageAt': DateTime.now(),
  //         }
  //     );
  //   } catch (e) {
  //     print("Exception@UserMessageToCoach => $e");
  //   }
  // }
  //
  // ///
  // /// In App user feedback
  // ///
  // Future<bool> addUserFeedback(String userId, int rating,
  //     String userFeedback) async {
  //   bool isFeedbackAdded = false;
  //   try {
  //     await firebaseFireStore.collection('Feedback&Suggestions')
  //         .doc(userId)
  //         .collection('feedback')
  //         .add(
  //         {
  //           'rating': rating,
  //           'userFeedback': userFeedback,
  //           'FeedbackAt': DateTime.now(),
  //         }
  //     );
  //     isFeedbackAdded = true;
  //   } catch (e) {
  //     print("Exception@Feedback&Suggestions => $e");
  //     isFeedbackAdded = false;
  //   }
  //   return isFeedbackAdded;
  // }
  //
  //
  // Future<AllJournals> getJournalsData() async {
  //
  //   List<AllJournals> getSetJournals = [];
  //
  //   try {
  //     var snapshot = await FirebaseFirestore.instance.collection("AddingJournals").doc("9J92nJJiIyioiIdwyiMv").get();
  //
  //
  //     return AllJournals.fromJson(snapshot.data(), snapshot.id);
  //
  //   } catch (e) {
  //
  //     return AllJournals();
  //     // List.from(value.data()!['AddingJournals']).forEach((element) {
  //     //   getSetJournals.add(element);
  //     // })   print('Exception error here => $e');
  //   }
  //
  // }


}
