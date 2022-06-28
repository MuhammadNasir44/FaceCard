





import 'package:face_card/core/enums/view_state.dart';
import 'package:face_card/core/models/app_user.dart';
import 'package:face_card/core/models/base_view_model.dart';
import 'package:face_card/core/services/database_services.dart';

class TopZipperProvider extends BaseViewModal{



  final databaseServices = DatabaseServices();

  List<AppUser> allAppUsers = [];
  List<AppUser> searchedUsers = [];
  bool isSearching = false;
  TopZipperProvider(){

    getAllAppUsers();

  }
  getAllAppUsers()async{

    setState(ViewState.busy);
    allAppUsers = await databaseServices.getAppUsers();
    notifyListeners();
    setState(ViewState.idle);
  }




  ///
  /// search user by name
  ///
  searchUserByName(String keyword) {
    print("Searched keyword : $keyword");
    keyword.isEmpty ? isSearching = false : isSearching = true;
    searchedUsers = allAppUsers
        .where((e) => (e.userName!.toLowerCase().contains(keyword.toLowerCase()))).toList();

    searchedUsers = allAppUsers.where((e) => (e.userName!.toLowerCase().contains(keyword.toLowerCase()))).toList();


    notifyListeners();
  }



}