import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart';


class NewsCode extends ChangeNotifier {

  Future getHeadlineNewsData(var countryCode) async {
    try {
      String hUrl = 'http://newsapi.org/v2/top-headlines?country=$countryCode&apiKey=cf9d9880c23044aa92c6f9c08a315479';
      Response response = await get(hUrl);
      return NewsCode.fromJson(response);
    } on SocketException {
      return 'No Internet';
      //print('no internet connection ');
    } on HttpException {
      throw 'No Internet';
      // print('couldnt find the post');
    } on FormatException {
      print('Bad response format');
    }
  }

  Future getNewsData({String countryCode, String newsType}) async {
    try {
      String url = 'http://newsapi.org/v2/top-headlines?country=ng&category=$newsType&apiKey=cf9d9880c23044aa92c6f9c08a315479';
      Response response = await get(url);
      
      return NewsCode.fromJson(response);
    } on SocketException {
      return 'No Internet';
      //print('no internet connection ');
    } on HttpException {
      throw 'No Internet';
      // print('couldnt find the post');
    } on FormatException {
      print('Bad response format');
    }
  }
   static  fromJson(Response source) {
   var decodedSource = jsonDecode(source.body);
  //print(decodedSource);
   return decodedSource;
   }
  // Future getEntertainmentNewsData(var countryCode)async {
  //   try {
  //     String url = 'http://newsapi.org/v2/top-headlines?country=$countryCode&category=entertainment&apiKey=cf9d9880c23044aa92c6f9c08a315479';
  //     Response response = await get(url);
  //     return response.body;
  //   } on SocketException {
  //     return Text('No Internet');
  //     //print('no internet connection ');
  //   } on HttpException {
  //     throw Text('No Internet');
  //     // print('couldnt find the post');
  //   } on FormatException {
  //     print('Bad response format');
  //   }
  // }
  // Future getHealthNewsData(var countryCode)async {
  //   try{
  //     String url = 'http://newsapi.org/v2/top-headlines?country=$countryCode&category=health&apiKey=cf9d9880c23044aa92c6f9c08a315479';
  //     Response response = await get(url);
  //     return response.body;
  //   } on SocketException {
  //     return Text('No Internet');
  //     //print('no internet connection ');
  //   } on HttpException {
  //     throw Text('No Internet');
  //     // print('couldnt find the post');
  //   } on FormatException {
  //     print('Bad response format');
  //   }
  // }
  // Future getScienceNewsData(var countryCode)async {
  //   try{
  //     String url = 'http://newsapi.org/v2/top-headlines?country=$countryCode&category=science&apiKey=cf9d9880c23044aa92c6f9c08a315479';
  //     Response response = await get(url);
  //     return response.body;
  //   } on SocketException {
  //     return Text('No Internet');
  //     //print('no internet connection ');
  //   } on HttpException {
  //     throw Text('No Internet');
  //     // print('couldnt find the post');
  //   } on FormatException {
  //     print('Bad response format');
  //   }
  // }

  // Future getSportsNewsData(var countryCode)async {
  //   try{
  //     String url = 'http://newsapi.org/v2/top-headlines?country=$countryCode&category=sports&apiKey=cf9d9880c23044aa92c6f9c08a315479';
  //     Response response = await get(url);
  //     return response.body;
  //   } on SocketException {
  //     return Text('No Internet');
  //     //print('no internet connection ');
  //   } on HttpException {
  //     throw Text('No Internet');
  //     // print('couldnt find the post');
  //   } on FormatException {
  //     print('Bad response format');
  //   }
  // }
  // Future getTechnologyNewsData(var countryCode)async {
  //   try{
  //     String url = 'http://newsapi.org/v2/top-headlines?country=$countryCode&category=technology&apiKey=cf9d9880c23044aa92c6f9c08a315479';
  //     Response response = await get(url);
  //     return response.body;
  //   } on SocketException {
  //     return Text('No Internet');
  //     //print('no internet connection ');
  //   } on HttpException {
  //     throw Text('No Internet');
  //     // print('couldnt find the post');
  //   } on FormatException {
  //     print('Bad response format');
  //   }
  // }


}

// class NewsModel{
//   final imageUrl;
//   final newsDesc;
//   final newsTitle;
//   final url;
//   final articlesLength;
//   final articleJsonBody;
//   NewsModel({this.imageUrl,this.newsDesc,this.newsTitle,this.url,this.articlesLength,this.articleJsonBody});
//    static NewsModel fromJson(Response source) {
//    var decodedSource = jsonDecode(source.toString());
//    return NewsModel(
//        imageUrl: decodedSource['articles'],
//        newsDesc: decodedSource['articles'],
//        newsTitle: decodedSource['articles'],
//        url: decodedSource['articles'],
//        articlesLength: decodedSource['articles'],
//        articleJsonBody: decodedSource,
//      );
//    }
//   @override
//    toString() {
//  //   print();
//     return 'Post : $imageUrl, userId: $newsDesc, title: $newsTitle, body: $url';
//   }
//}