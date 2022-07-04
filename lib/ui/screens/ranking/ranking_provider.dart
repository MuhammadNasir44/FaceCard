





import 'package:face_card/core/enums/view_state.dart';
import 'package:face_card/core/locator.dart';
import 'package:face_card/core/models/base_view_model.dart';
import 'package:face_card/core/models/chart_data.dart';
import 'package:face_card/core/services/auth_services.dart';

import '../../../core/models/app_user.dart';
import '../../../core/services/database_services.dart';

class RankingProvider extends BaseViewModal{



List<ChartData> chartData = [];
final databaseServices = DatabaseServices();

List<AppUser> topThreeUserList = [];
List<AppUser> allUserList = [];

List<AppUser> sameHomeTownList = [];
int lengthOfHomeTown = 0;

var appUser = AppUser();

int worldRankingNumber=0;
int homeTownRanking = 1;

int limit =0;


  RankingProvider(){
    this.appUser = AppUser();
    getChartData();
    getALlUsers();

  }


  getChartData()async{
    setState(ViewState.busy);
    topThreeUserList = await databaseServices.getTopThreeUsers();
    limit = topThreeUserList.length>3?3:topThreeUserList.length;
    for(int i=0;i<limit;i++){
      chartData.add(ChartData(topThreeUserList[i].userName.toString(), topThreeUserList[i].faceCardNumber!.toDouble()),

      );
      notifyListeners();

    }
    setState(ViewState.idle);

  }
getALlUsers()async{
    setState(ViewState.busy);
    allUserList = await databaseServices.getWholeUsers();
    for(int i=0;i<allUserList.length;i++){
      if(allUserList[i].appUserId.toString() == locator<AuthServices>().appUser.appUserId){
        worldRankingNumber = i+1;
        notifyListeners();
        print("rankend number: "+i.toString());
      }
      if(allUserList[i].userLocation.toString() == locator<AuthServices>().appUser.userLocation){
        sameHomeTownList.add(allUserList[i]);
      }
    }
    lengthOfHomeTown = sameHomeTownList.length;
    sameHomeTownFun();
    notifyListeners();
    setState(ViewState.idle);

}

sameHomeTownFun(){


    setState(ViewState.busy);
    for(int i =0;i<lengthOfHomeTown;i++){

      if(sameHomeTownList[i].appUserId.toString() == locator<AuthServices>().appUser.appUserId ){
        homeTownRanking = i+1;
        notifyListeners();
      }
      print(sameHomeTownList[i].userName.toString());
    }
    setState(ViewState.idle);
}
}