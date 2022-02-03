import 'package:all_news/core/services/businessservices.dart';
import 'package:all_news/locator.dart';
import 'package:all_news/ui/views/view_state.dart';

import 'base_model.dart';
import 'headlineviewmodel.dart';

class BusinessViewModel extends BaseModel{
  HeadlineViewModel headlineViewModel = getLocator<HeadlineViewModel>();
  BusinessServices _businessServices = getLocator<BusinessServices>();
  var _businessNews = [];
  get businessNews => _businessNews;
  Future getBusinessNews(String countryCode,) async {
    setState(ViewState.Busy);
    var news = await _businessServices.getBusinessNews(
        countryCode: countryCode);
     setState(ViewState.Idle);   
    if (news != null && news['status'] == 'ok') {
      news['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
        _businessNews.add(element);
        
        }
      });
       //print(businessNews);
      setState(ViewState.Idle);
    }
  }

}
