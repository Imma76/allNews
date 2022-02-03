import 'package:all_news/locator.dart';
import 'package:all_news/ui/views/select_page.dart';
import 'package:all_news/ui/views/news_viewer.dart';
import 'package:all_news/ui/views/welcome%20_screen.dart';
import 'package:flutter/material.dart';
import 'error_screens/12_artical_not_found.dart';
import 'error_screens/19_connection_faild.dart';
import 'error_screens/7_error_2.dart';
import 'ui/views/business_news_page_list.dart';
import 'ui/views/select_page.dart';

void main() {
  setUp();
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
        NewsViewer.id:(context)=>NewsViewer(),
        SelectionPage.id:(context)=>SelectionPage(),
        ArticleNotFoundScreen.id:(context)=>ArticleNotFoundScreen(),
      ConnectionFailedScreen.id:(context)=>ConnectionFailedScreen(),
      Error2Screen.id:(context)=>Error2Screen(),
      },
    );
  }
}

