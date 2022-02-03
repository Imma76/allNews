
import 'package:all_news/ui/widgets/responsive.dart';
import 'package:all_news/ui/views/news_viewer.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NewsTextDescription extends StatelessWidget {
  const NewsTextDescription({

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
                child: NewsTextDescription(
                  title: '$title',
                  subTitle: '$subTitle',
                  //          viewCount: viewCount,
                ),
              ),

            ],
          ),
        ));
  }
}



class NewsListTile extends StatelessWidget {
  const NewsListTile({
    Key key,
    //@required this.post,
    @required this.urlToImage,
    @required this.title,
    @required this.newsBody,
    @required this.newsDesc,
  }) : super(key: key);


  final newsBody;
  final urlToImage;
  final title;
  final newsDesc;

  @override
  Widget build(BuildContext context) {
    return CustomListItem(
      thumbnail: Container(
        width: 100.0,
        height: 100.0,
        child: CachedNetworkImage(
          imageUrl: urlToImage,
          fit: BoxFit.cover,
          width: 70.0,
        ),
      ),
      title: Text(
        '$title',
        style: TextStyle(
            fontSize: AdaptiveTextSize().getAdaptiveTextSize(context, 14),
            fontWeight: FontWeight.bold),
      ),
      subTitle: Text(
        '$newsDesc',
        style: TextStyle(
            fontSize: AdaptiveTextSize().getAdaptiveTextSize(context, 10),
            fontWeight: FontWeight.bold),
      ),
    );

  }
}




class HeadlineTileList extends StatelessWidget {
  HeadlineTileList({
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
          return NewsViewer(
                  newsBody: '$newsBody',
                );
        }));
      },
      child: Container(

        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width / 1.1,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: CachedNetworkImage(
                  imageUrl: '$urlImage',
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
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
                        child: Text(
                          '$newsName',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: AdaptiveTextSize()
                                .getAdaptiveTextSize(context, 18),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '$desc',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: AdaptiveTextSize()
                                .getAdaptiveTextSize(context, 11),
                          ),
                        ),
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
