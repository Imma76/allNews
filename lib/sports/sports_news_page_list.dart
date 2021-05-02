import 'package:all_news/business/news_viewer.dart';
import 'package:all_news/screens/12_artical_not_found.dart';
import 'package:all_news/screens/19_connection_faild.dart';
import 'package:all_news/screens/7_error_2.dart';
import 'package:flutter/material.dart';
import 'package:all_news/network_module/news_module.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:all_news/responsive.dart';

class SportsNewsPageList extends StatefulWidget {
  static const id = 'SportsNewsPageList';
  final countryName;

  SportsNewsPageList({this.countryName});

  @override
  _SportsNewsPageListState createState() => _SportsNewsPageListState();
}

class _SportsNewsPageListState extends State<SportsNewsPageList> {
  var checkLoad = true;
  List newsJson = [
  ];
  List newsJsonHeadline = [
  ];
  Future<NewsModel> getHeadlineData;
  var headlinesData;
  Future<NewsModel> sportsData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    headlinesData = PostService(dataCode: widget.countryName);

  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      getHeadlineData = headlinesData.getHeadlinePost(
        widget.countryName,
      );
      sportsData = headlinesData.getSportsPost(
        widget.countryName,
      );
    });

    return Container(
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
            FutureBuilder<NewsModel>(
              future: getHeadlineData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  final error = snapshot.error;
                  return Container(
                      height: MediaQuery.of(context).size.height * 1,
                      child: Error2Screen());

                } else if (snapshot.hasData) {
                  final post = snapshot.data;

                  return

                    Flexible(
                      fit: FlexFit.loose,
                      child: Container(
                        height: MediaQuery.of(context).size.height / 3,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: post.articlesLength.length.toInt(),
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            if (post.articleJsonBody['status'] == 'ok') {
                              post.articlesLength.forEach((element) {
                                if (element['urlToImage'] != null && element['description'] != null) {
                                  var data =   NewsModel(
                                    imageUrl: element['urlToImage'],
                                    newsDesc: element['description'],
                                    newsTitle: element['title'],
                                    url: element['url'],
                                    articlesLength: post.articlesLength,
                                  );
                                  newsJsonHeadline.add(data);
                                }
                              });
                            }
                            //final data = post.articlesLength;
                            return SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              child: FittedBox(
                                fit: BoxFit.fill,
                                alignment: Alignment.topCenter,
                                child: SportsTileList(
                                  urlImage: newsJsonHeadline[index].imageUrl,
                                  newsName: newsJsonHeadline[index].newsTitle,
                                  desc: newsJsonHeadline[index].newsDesc,
                                  checkLoad: checkLoad,
                                  newsBody: newsJsonHeadline[index].url,

                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                } else if (snapshot.hasData == null) {
                  return Container(
                      height: MediaQuery.of(context).size.height * 1,
                      child: ArticleNotFoundScreen());

                } else {
                  return Container(
                      height: MediaQuery.of(context).size.height * 1,
                      child: ConnectionFailedScreen());
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('On Today\'s Sports',
                  style: TextStyle(
                      fontFamily: 'Lobster',
                      fontWeight: FontWeight.bold,
                      fontSize:
                      AdaptiveTextSize().getAdaptiveTextSize(context, 20),
                      color: Colors.black)),
            ),
            FutureBuilder<NewsModel>(
              future: sportsData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  final error = snapshot.error;
                  return Container(
                      height: MediaQuery.of(context).size.height * 1,
                      child: Error2Screen());
                } else if (snapshot.hasData) {
                  final post = snapshot.data;

                  return

                    Flexible(
                      fit: FlexFit.loose,
                      child: Container(

                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: post.articlesLength.length.toInt(),
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            if (post.articleJsonBody['status'] == 'ok') {
                              post.articlesLength.forEach((element) {
                                if (element['urlToImage'] != null && element['description'] != null) {
                                  var data =   NewsModel(
                                    imageUrl: element['urlToImage'],
                                    newsDesc: element['description'],
                                    newsTitle: element['title'],
                                    url: element['url'],
                                    articlesLength: post.articlesLength,
                                  );
                                  newsJson.add(data);
                                }
                              });
                            }
                            return SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              child: Column(

                                children: [
                                  CustomListItem(
                                    thumbnail: newsJson[index].imageUrl,
                                    title: newsJson[index].newsTitle,
                                    subTitle: newsJson[index].newsDesc,
                                    checkLoad: checkLoad,
                                    newsBody: newsJson[index].url,
                                  ),
                                  Divider(),
                                ],
                              ),

                            );
                          },
                        ),
                      ),
                    );
                } else if (snapshot.hasData == null) {
                  return Container(
                      height: MediaQuery.of(context).size.height * 1,
                      child: ArticleNotFoundScreen());
                } else {
                  return Container(
                      height: MediaQuery.of(context).size.height * 1,
                      child: ConnectionFailedScreen());

                }
              },
            ),
          ],
        ),
      ]),
    );
  }
}
class SportsTileList extends StatelessWidget {
  SportsTileList({
    @required this.checkLoad,
    @required this.newsName,
    @required this.urlImage,
    @required this.newsBody,
    @required this.desc,
  });

  final String newsName;
  final String urlImage;
  final String newsBody;
  final String desc;

  final checkLoad;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Center(child: CircularProgressIndicator());
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return checkLoad
              ? Center(child: CircularProgressIndicator())
              : NewsViewer(
            newsBody: '$newsBody',
          );
        }));
      },
      child: Container(

        height: MediaQuery.of(context).size.height/2,
        width: MediaQuery.of(context).size.width/1.1,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: CachedNetworkImage(
                  imageUrl: '$urlImage',
                  height:double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  width: double.infinity,
                  color: Color(0xff737373).withOpacity(0.4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('$newsName',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: AdaptiveTextSize().getAdaptiveTextSize(context, 18),
                            fontWeight: FontWeight.bold,


                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('$desc',style:TextStyle(color: Colors.white,fontSize: AdaptiveTextSize().getAdaptiveTextSize(context, 11),),),
                      ),
                    ],
                  ),
                ),
              ),
            ),


            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
class CustomListItem extends StatelessWidget {
  const CustomListItem({

    @required this.thumbnail,
    @required this.title,
    @required this.subTitle,
    @required this.newsBody,
    @required this.checkLoad,

  });



  final thumbnail;
  final title;
  final subTitle;
  final checkLoad;
  final newsBody;



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Center(child: CircularProgressIndicator());
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return NewsViewer(
              newsBody: '$newsBody',
            );
          }));
        },
        child: Container(
          child: Row(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 4,
                child: CachedNetworkImage(
                  imageUrl: '$thumbnail',
                  fit: BoxFit.cover,
                  width: 70.0,
                ),

              ),
              SizedBox(width: 20.0,),
              Expanded(
                flex: 7,
                child: _VideoDescription(
                  title: '$title',
                  subTitle: '$subTitle',

                ),
              ),

            ],
          ),
        ));
  }
}

class _VideoDescription extends StatelessWidget {
  const _VideoDescription({

    @required this.title,
    @required this.subTitle,

  });



  final title;
  final subTitle;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '$title',
          style: TextStyle(
              fontSize: AdaptiveTextSize().getAdaptiveTextSize(context, 14),
              fontWeight: FontWeight.bold),
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
        Text(
          '$subTitle',
          style: TextStyle(
            fontSize: AdaptiveTextSize().getAdaptiveTextSize(context, 10),
          ),
        ),


      ],
    );
  }
}