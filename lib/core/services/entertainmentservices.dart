
import 'package:all_news/core/model/news_model.dart';
import 'package:all_news/core/viewmodels/base_model.dart';
import 'package:all_news/locator.dart';

class EntertainmentServices{
  NewsCode _newsCode = getLocator<NewsCode>();

  Future getEntertainmentNews({String countryCode, })async{
   // setState(ViewState.Busy);
    var newsData = await _newsCode.getNewsData(countryCode: countryCode, newsType:'entertainment');
    if(newsData != null){
      return newsData;
    }
    return newsData;
    
     //setState(ViewState.Idle);
  }
}
