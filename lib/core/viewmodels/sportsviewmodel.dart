import 'package:all_news/core/services/sportsservices.dart';import 'package:all_news/core/services/techservices.dart';
import 'package:all_news/locator.dart';
import 'package:all_news/ui/views/view_state.dart';

import 'base_model.dart';

class SportsViewModel extends BaseModel {
  SportsServices _sportsServices = getLocator<SportsServices>();
  var _sportsNews = [];
  get sportNews => _sportsNews;
  Future getSportsNews(String countryCode) async {
    setState(ViewState.Busy);
    var news = await _sportsServices.getSportsNews(
        countryCode: countryCode, );
     setState(ViewState.Idle);   
    if (news != null && news['status'] == 'ok') {
      news['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
         _sportsNews = news['articles'];
        }
      });
      // print(businessNews);
      setState(ViewState.Idle);
    }
  }
}
