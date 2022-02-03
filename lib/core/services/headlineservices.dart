
import 'package:all_news/core/model/news_model.dart';
import 'package:all_news/locator.dart';

class HeadlineServices{
  NewsCode _newsCode = getLocator<NewsCode>();
  Future getHeadlineNews({String countryCode})async{
   // setState(ViewState.Busy);
    var newsData = await _newsCode.getHeadlineNewsData(countryCode);
    if(newsData != null){
      return newsData;
    }
    return newsData;    
     //setState(ViewState.Idle);
  }
}
