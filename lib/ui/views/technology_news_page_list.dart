import 'package:all_news/core/viewmodels/techviewmodel.dart';
import 'package:all_news/ui/views/view_state.dart';
import 'package:all_news/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:all_news/ui/widgets/responsive.dart';

import 'base_view.dart';


class TechPageList extends StatelessWidget {
  static const id = 'EntertainmentPageList';
  final countryName;
  TechPageList({this.countryName});
  var checkLoad = true;
  @override
  Widget build(BuildContext context) {
    return BaseView<TechViewModel>(
      onReady: (model){
     model.getTechNews(countryName);
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
              child: Text('On Today\'s Technology',
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
                          itemCount: model.techNews.length.toInt(),
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                             
      
                            return SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              child: Column(

                                children: [
                                  CustomListItem(
                                    thumbnail:model.techNews[index]['urlToImage'],
                                    title: model.techNews[index]['title'],
                                    subTitle: model.techNews[index]['description'],
                                    checkLoad: checkLoad,
                                    newsBody: model.techNews[index]['url'],
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

