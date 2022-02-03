import 'package:all_news/core/services/healthservices.dart';
import 'package:all_news/locator.dart';
import 'package:all_news/ui/views/view_state.dart';

import 'base_model.dart';

class HealthViewModel extends BaseModel {
  HealthServices _healthServices = getLocator<HealthServices>();
  var _healtNews = [];
  get healthNews => _healtNews;
  Future getHealthNews(String countryCode) async {
    setState(ViewState.Busy);
    var news = await _healthServices.getHealthNews(
        countryCode: countryCode, );
     setState(ViewState.Idle);   
    if (news != null && news['status'] == 'ok') {
      news['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
         _healtNews = news['articles'];
        }
      });
      // print(businessNews);
      setState(ViewState.Idle);
    }
  }
}
