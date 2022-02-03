import 'package:all_news/core/viewmodels/businessviewmodel.dart';
import 'package:all_news/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:all_news/ui/widgets/responsive.dart';

import 'base_view.dart';
import 'view_state.dart';


class BusinessNewsPageList extends StatelessWidget {
  static const id = 'BusinessNewsPageList';
  final countryName;
  BusinessNewsPageList({this.countryName});
  var checkLoad = true;
  @override
  Widget build(BuildContext context) {
    return BaseView<BusinessViewModel>(
      onReady: (model){
      model.getBusinessNews(countryName);
      model.headlineViewModel.getHeadlineNews(countryName);
    },
      builder: (context, model, child){
        return   Container(
      child: ListView(shrinkWrap: true, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('On Today\'s Headlines',
                  style: TextStyle(
                      fontFamily: 'Lobster',
                      fontWeight: FontWeight.bold,
                      fontSize:
                          AdaptiveTextSize().getAdaptiveTextSize(context, 20),
                      color: Colors.black)),
            ),
          model.viewState  == ViewState.Idle?   Flexible(
                    fit: FlexFit.loose,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 3,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: model.headlineViewModel.headLineNews.length.toInt(),
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          
                          return SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            child: FittedBox(
                              fit: BoxFit.fill,
                              alignment: Alignment.topCenter,
                              child: HeadlineTileList(
                                urlImage: model.headlineViewModel.headLineNews[index]['urlToImage'],
                                newsName: model.headlineViewModel.headLineNews[index]['title'],
                                desc: model.headlineViewModel.headLineNews[index]['description'],
                                checkLoad: checkLoad,
                                newsBody: model.headlineViewModel.headLineNews[index]['url'],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ):CircularProgressIndicator(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('On Today\'s Business',
                  style: TextStyle(
                      fontFamily: 'Lobster',
                      fontWeight: FontWeight.bold,
                      fontSize:
                          AdaptiveTextSize().getAdaptiveTextSize(context, 20),
                      color: Colors.black)),
            ),
//FutureNewsView(checkLoad: checkLoad,newsJson: model.businessNews,getNews: model.getBusinessNews(countryName, 'business'),)
            
          model.viewState  == ViewState.Idle? Flexible(
                    fit: FlexFit.loose,
                    child: Container(

                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: model.businessNews.length.toInt(),
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                             
      
                            return SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              child: Column(

                                children: [
                                  CustomListItem(
                                    thumbnail: model.businessNews[index]['urlToImage'],
                                    title: model.businessNews[index]['title'],
                                    subTitle: model.businessNews[index]['description'],
                                    checkLoad: checkLoad,
                                    newsBody: model.businessNews[index]['url'],
                                  ),
                                  Divider(),
                                ],
                              ),
                              // Divider(
                              //   height: 10,
                              // ),
                            );
                          }
                        ),
                      ),
                    ),
                  )
            :CircularProgressIndicator(),
          ],
        ),
      ]),
    );
      },
    );
  
  }
}

