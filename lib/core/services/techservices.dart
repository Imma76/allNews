
import 'package:all_news/core/model/news_model.dart';
import 'package:all_news/core/viewmodels/base_model.dart';
import 'package:all_news/locator.dart';

class TechServices extends BaseModel{
  NewsCode _newsCode = getLocator<NewsCode>();

  Future getTechNews({String countryCode, })async{
   // setState(ViewState.Busy);
    var newsData = await _newsCode.getNewsData(countryCode: countryCode, newsType:'technology');
    if(newsData != null){
      return newsData;
    }
    return newsData;
    
     //setState(ViewState.Idle);
  }
}
