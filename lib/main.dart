import 'package:all_news/select_page.dart';
import 'package:all_news/welcome _screen.dart';
import 'package:flutter/material.dart';
import 'technology/technology_news_page_list.dart';
import 'science/science_news_page_list.dart';
import 'sports/sports_news_page_list.dart';
import 'business/business_news_page_list.dart';
import 'entertaiment/entertainment_news_page_list.dart';
import 'health/health_news_page_list.dart';
import 'business/news_viewer.dart';

import 'select_page.dart';
import 'package:all_news/screens/12_artical_not_found.dart';
import 'package:all_news/screens/19_connection_faild.dart';
import 'package:all_news/screens/7_error_2.dart';

void main() {
   WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Center(child: CircularProgressIndicator());
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
      routes:{
        BusinessNewsPageList.id:(context)=>BusinessNewsPageList(),
        EntertainmentNewsPageList.id:(context)=>EntertainmentNewsPageList(),
        HealthNewsPageList.id:(context)=>HealthNewsPageList(),
        ScienceNewsPageList.id:(context)=>ScienceNewsPageList(),
        SportsNewsPageList.id:(context)=>SportsNewsPageList(),
        TechNewsPageList.id:(context)=>TechNewsPageList(),
        NewsViewer.id:(context)=>NewsViewer(),
        SelectionPage.id:(context)=>SelectionPage(),
        ArticleNotFoundScreen.id:(context)=>ArticleNotFoundScreen(),
      ConnectionFailedScreen.id:(context)=>ConnectionFailedScreen(),
      Error2Screen.id:(context)=>Error2Screen(),
      },
    );
  }
}

