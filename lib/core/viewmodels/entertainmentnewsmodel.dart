import 'package:all_news/core/services/entertainmentservices.dart';
import 'package:all_news/locator.dart';
import 'package:all_news/ui/views/view_state.dart';

import 'base_model.dart';

class EntertainmentViewModel extends BaseModel {
  EntertainmentServices _entertainmentServices = getLocator<EntertainmentServices>();
  var _entertainmentNews = [];
  get entertainmentNews => _entertainmentNews;
  Future getEntertainmentNews(String countryCode) async {
    setState(ViewState.Busy);
    var news = await _entertainmentServices.getEntertainmentNews(
        countryCode: countryCode, );
     setState(ViewState.Idle);   
    if (news != null && news['status'] == 'ok') {
      news['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
         _entertainmentNews.add(element);
        }
      });
      // print(businessNews);
      setState(ViewState.Idle);
    }
  }
}
