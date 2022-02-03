import 'package:all_news/core/services/headlineservices.dart';
import 'package:all_news/locator.dart';
import 'package:all_news/ui/views/view_state.dart';









import 'base_model.dart';

class HeadlineViewModel extends BaseModel {
  HeadlineServices _headlineServices = getLocator<HeadlineServices>();
  var _headlineNews = [];
  get headLineNews => _headlineNews;
  Future getHeadlineNews(String countryCode) async {
    setState(ViewState.Busy);
    var news = await _headlineServices.getHeadlineNews(
        countryCode: countryCode,);
     setState(ViewState.Idle);   
    if (news != null && news['status'] == 'ok') {
      news['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
        _headlineNews = news['articles'];
        }
      });
       //print(businessNews);
      setState(ViewState.Idle);
    }
  }
}
