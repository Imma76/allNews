import 'package:all_news/business/business_news_page_list.dart';
import 'package:all_news/entertaiment/entertainment_news_page_list.dart';
import 'package:all_news/health/health_news_page_list.dart';
import 'package:all_news/sports/sports_news_page_list.dart';
import 'package:all_news/technology/technology_news_page_list.dart';
import 'package:flutter/material.dart';
import 'package:all_news/responsive.dart';

class HeadlineNewsPageList extends StatefulWidget {
  final countryName;

  HeadlineNewsPageList({this.countryName});

  @override
  _HeadlineNewsPageListState createState() => _HeadlineNewsPageListState();
}

class _HeadlineNewsPageListState extends State<HeadlineNewsPageList> {
  var code;
  int currentIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  var unselectColor = Color(0xff737373);
  var selectColor = Colors.blue;
  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetOptions = [
      BusinessNewsPageList(countryName: widget.countryName),
      EntertainmentNewsPageList(countryName: widget.countryName),
      HealthNewsPageList(countryName: widget.countryName),
      // ScienceNewsPageList(countryName: widget.countryName),
      SportsNewsPageList(countryName: widget.countryName),
      TechNewsPageList(countryName: widget.countryName),
    ];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            children: [
              Text('all', style: TextStyle(color: Colors.black)),
              Text('News', style: TextStyle(color: Color(0xff72bcd4))),
            ],
          ),
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_rounded),
              color: Colors.black,
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.business,
                  color: currentIndex == 0 ? selectColor : unselectColor,
                ),
                title: Text(
                  'Business',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Lobster',
                    fontSize:
                        AdaptiveTextSize().getAdaptiveTextSize(context, 13),
                  ),
                )),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.movie,
                color: currentIndex == 1 ? selectColor : unselectColor,
              ),
              title: Text(
                'Entertainment',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Lobster',
                  fontSize: AdaptiveTextSize().getAdaptiveTextSize(context, 13),
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.local_hospital,
                color: currentIndex == 2 ? selectColor : unselectColor,
              ),
              title: Text(
                'Health',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Lobster',
                  fontSize: AdaptiveTextSize().getAdaptiveTextSize(context, 13),
                ),
              ),
            ),
            // BottomNavigationBarItem(icon: Icon(Icons.science,color: currentIndex==3?Colors.blue:Colors.yellow,),title: Text('Science'),backgroundColor: Colors.blue),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.sports,
                color: currentIndex == 3 ? selectColor : unselectColor,
              ),
              title: Text(
                'Sports',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Lobster',
                  fontSize: AdaptiveTextSize().getAdaptiveTextSize(context, 13),
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.biotech,
                color: currentIndex == 4 ? selectColor : unselectColor,
              ),
              title: Text(
                'Technology',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Lobster',
                  fontSize: AdaptiveTextSize().getAdaptiveTextSize(context, 13),
                ),
              ),
            ),
          ],
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
        body: widgetOptions.elementAt(currentIndex),
      ),
    );
  }
}
