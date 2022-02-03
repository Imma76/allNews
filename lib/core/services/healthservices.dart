
import 'package:all_news/core/model/news_model.dart';
import 'package:all_news/core/viewmodels/base_model.dart';
import 'package:all_news/locator.dart';

class HealthServices{
  NewsCode _newsCode = getLocator<NewsCode>();

  Future getHealthNews({String countryCode})async{
   // setState(ViewState.Busy);
    var newsData = await _newsCode.getNewsData(countryCode: countryCode, newsType:'health');
    if(newsData != null){
      return newsData;
    }
    return newsData;
    
     //setState(ViewState.Idle);
  }
}
