





import 'package:face_card/core/enums/view_state.dart';
import 'package:face_card/core/models/base_view_model.dart';
import 'package:face_card/core/models/chart_data.dart';

import '../../../core/models/app_user.dart';
import '../../../core/services/database_services.dart';

class RankingProvider extends BaseViewModal{



List<ChartData> chartData = [];
final databaseServices = DatabaseServices();

List<AppUser> allAppUsers = [];

int limit =0;


  RankingProvider(){
    getChartData();


  }


  getChartData()async{


    setState(ViewState.busy);


    allAppUsers = await databaseServices.getTopThreeUsers();

    limit = allAppUsers.length>3?3:allAppUsers.length;

    for(int i=0;i<limit;i++){

     print("zaps : "+ allAppUsers[i].zaps.toString());

      chartData.add(ChartData(allAppUsers[i].userName.toString(), allAppUsers[i].zaps!.toDouble()),

      );
      notifyListeners();

    }
    setState(ViewState.idle);

  }
}