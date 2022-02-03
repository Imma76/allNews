
import 'package:all_news/error_screens/12_artical_not_found.dart';
import 'package:flutter/material.dart' ;
import 'package:webview_flutter/webview_flutter.dart';

class NewsViewer extends StatefulWidget {
static const id = 'NewsViewer';
final newsBody;
NewsViewer({ this.newsBody, });

  @override
  _NewsViewerState createState() => _NewsViewerState();
}

class _NewsViewerState extends State<NewsViewer> {
  WebViewController controller;
  String newsBody;
  bool check  = true;
  String result = '';
  bool showErrorPage = false;
  var colorsValue = Colors.white;
  num position = 1;
  void newsData(String newsBodyData){
    newsBody = newsBodyData;
    setState(() {
      check = false;
    });
  }
@override
void initState() {
    super.initState();
    newsData(widget.newsBody);
  //  checkStatus();

  }


  doneLoading(String A){
    setState(() {
      position = 0;
    });
  }
  startLoading(String A){
    setState(() {
      position = 0;
    });
  }
errorLoading(String A){
    setState((){
      position = 0;
    });
}
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton:FloatingActionButton(child:Icon(Icons.import_export), onPressed:  ()async => controller.loadUrl(newsBody),),
        appBar:AppBar(
          elevation:0.0,
          backgroundColor: Colors.white,
            leading: IconButton(icon:Icon(Icons.arrow_back_ios_rounded),color: Colors.black,onPressed:(){Navigator.pop(context);}),
          title:Row(
            children: [
              Text('all', style:TextStyle(color:Colors.black)),
              Text('News', style:TextStyle(color:Color(0xff63b8ff),),),
            ],
          )
        ),
        body:Container(
          height:MediaQuery.of(context).size.height,
            width:MediaQuery.of(context).size.width,
            child:IndexedStack(
              index: position,
                children:[
                  WebView(
                initialUrl: '$newsBody',
                  javascriptMode: JavascriptMode.unrestricted,
                  onPageFinished: doneLoading,
                  onPageStarted: startLoading,
                  onWebResourceError: (error){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return Container(
                        height: MediaQuery.of(context).size.height * 1,
                        child: ArticleNotFoundScreen());
                  }));
                  },
                  onWebViewCreated: (WebViewController wc){
                  setState(() {
                    controller = wc;
                  });
                  },

              ),
                  Container(child: Center(child: CircularProgressIndicator(),),)
         ])

        )
      ),
    );
  }
}
