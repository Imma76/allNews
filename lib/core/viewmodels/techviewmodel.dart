import 'package:all_news/core/services/techservices.dart';
import 'package:all_news/locator.dart';
import 'package:all_news/ui/views/view_state.dart';

import 'base_model.dart';

class TechViewModel extends BaseModel {
  TechServices _techServices = getLocator<TechServices>();
  var _techNews = [];
  get techNews => _techNews;
  Future getTechNews(String countryCode) async {
    setState(ViewState.Busy);
    var news = await _techServices.getTechNews(
        countryCode: countryCode, );
     setState(ViewState.Idle);   
    if (news != null && news['status'] == 'ok') {
      news['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
         _techNews = news['articles'];
        }
      });
      // print(businessNews);
      setState(ViewState.Idle);
    }
  }
}
