import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart';


class NewsCode {
  List headlineNews = [];

  Future getHeadlineNewsData(var countryCode) async {
    try {
      String hUrl = 'http://newsapi.org/v2/top-headlines?country=$countryCode&apiKey=cf9d9880c23044aa92c6f9c08a315479';
      Response response = await get(hUrl);
      return response.body;
    } on SocketException {
      return Text('No Internet');
      //print('no internet connection ');
    } on HttpException {
      throw Text('No Internet');
      // print('couldnt find the post');
    } on FormatException {
      print('Bad response format');
    }
  }
  Future getBusinessNewsData(var countryCode) async {
    try {
      String url = 'http://newsapi.org/v2/top-headlines?country=$countryCode&category=business&apiKey=cf9d9880c23044aa92c6f9c08a315479';
      Response response = await get(url);
      return response.body;
    } on SocketException {
      return Text('No Internet');
      //print('no internet connection ');
    } on HttpException {
      throw Text('No Internet');
      // print('couldnt find the post');
    } on FormatException {
      print('Bad response format');
    }
  }
  Future getEntertainmentNewsData(var countryCode)async {
    try {
      String url = 'http://newsapi.org/v2/top-headlines?country=$countryCode&category=entertainment&apiKey=cf9d9880c23044aa92c6f9c08a315479';
      Response response = await get(url);
      return response.body;
    } on SocketException {
      return Text('No Internet');
      //print('no internet connection ');
    } on HttpException {
      throw Text('No Internet');
      // print('couldnt find the post');
    } on FormatException {
      print('Bad response format');
    }
  }
  Future getHealthNewsData(var countryCode)async {
    try{
      String url = 'http://newsapi.org/v2/top-headlines?country=$countryCode&category=health&apiKey=cf9d9880c23044aa92c6f9c08a315479';
      Response response = await get(url);
      return response.body;
    } on SocketException {
      return Text('No Internet');
      //print('no internet connection ');
    } on HttpException {
      throw Text('No Internet');
      // print('couldnt find the post');
    } on FormatException {
      print('Bad response format');
    }
  }
  Future getScienceNewsData(var countryCode)async {
    try{
      String url = 'http://newsapi.org/v2/top-headlines?country=$countryCode&category=science&apiKey=cf9d9880c23044aa92c6f9c08a315479';
      Response response = await get(url);
      return response.body;
    } on SocketException {
      return Text('No Internet');
      //print('no internet connection ');
    } on HttpException {
      throw Text('No Internet');
      // print('couldnt find the post');
    } on FormatException {
      print('Bad response format');
    }
  }

  Future getSportsNewsData(var countryCode)async {
    try{
      String url = 'http://newsapi.org/v2/top-headlines?country=$countryCode&category=sports&apiKey=cf9d9880c23044aa92c6f9c08a315479';
      Response response = await get(url);
      return response.body;
    } on SocketException {
      return Text('No Internet');
      //print('no internet connection ');
    } on HttpException {
      throw Text('No Internet');
      // print('couldnt find the post');
    } on FormatException {
      print('Bad response format');
    }
  }
  Future getTechnologyNewsData(var countryCode)async {
    try{
      String url = 'http://newsapi.org/v2/top-headlines?country=$countryCode&category=technology&apiKey=cf9d9880c23044aa92c6f9c08a315479';
      Response response = await get(url);
      return response.body;
    } on SocketException {
      return Text('No Internet');
      //print('no internet connection ');
    } on HttpException {
      throw Text('No Internet');
      // print('couldnt find the post');
    } on FormatException {
      print('Bad response format');
    }
  }


}

class PostService {
  final dataCode ;
  PostService({this.dataCode});
 final httpClient = NewsCode();
  Future<NewsModel> getHeadlinePost(var dataA) async {
    try {
      final responseBody = await httpClient.getHeadlineNewsData('$dataA');
      return NewsModel.fromJson(responseBody);
    } catch (e) {
      print(e);
    }
  }
  Future<NewsModel> getBusinessPost(var dataA,) async {
    try {
      final responseBody = await httpClient.getBusinessNewsData('$dataA');
      return NewsModel.fromJson(responseBody);
    } catch (e) {
      print(e);
    }
  }
  Future<NewsModel> getEntPost(var dataA,) async {
    try {
      final responseBody = await httpClient.getEntertainmentNewsData('$dataA');
      return NewsModel.fromJson(responseBody);
    } catch (e) {
      print(e);
    }
  }
  Future<NewsModel> getHealthPost(var dataA,) async {
    try {
      final responseBody = await httpClient.getHealthNewsData('$dataA');
      return NewsModel.fromJson(responseBody);
    } catch (e) {
      print(e);
    }
  }
  Future<NewsModel> getSportsPost(var dataA,) async {
    try {
      final responseBody = await httpClient.getSportsNewsData('$dataA');
      return NewsModel.fromJson(responseBody);
    } catch (e) {
      print(e);
    }
  }
  Future<NewsModel> getTechPost(var dataA,) async {
    try {
      final responseBody = await httpClient.getTechnologyNewsData('$dataA');
      return NewsModel.fromJson(responseBody);
    } catch (e) {
      print(e);
    }
  }
  Future<NewsModel> getSciencePost(var dataA,) async {
    try {
      final responseBody = await httpClient.getScienceNewsData('$dataA');
      return NewsModel.fromJson(responseBody);
    } catch (e) {
      print(e);
    }
  }



}


class NewsModel{
  final imageUrl;
  final newsDesc;
  final newsTitle;
  final url;
  final articlesLength;
  final articleJsonBody;
  NewsModel({this.imageUrl,this.newsDesc,this.newsTitle,this.url,this.articlesLength,this.articleJsonBody});




   static NewsModel fromMap({Map<String, dynamic> map}) {
     // print(map[0]['title']);
     // print(map['status']);
     //  if (map['status'] == 'ok') {
     //    map['articles'].forEach((element) {
     //      if (element['urlToImage'] != null && element['description'] != null) {
     //        return  NewsModel(
     //          imageUrl: element['urlToImage'],
     //          newsDesc: element['description'],
     //          newsTitle: element['title'],
     //          url: element['url'],
     //          articlesLength: map['articles'],
     //        );
     //      }
     //    });
     //  }
     // }
     if (map == null) return null;

     return NewsModel(
       imageUrl: map['articles'],
       newsDesc: map['articles'],
       newsTitle: map['articles'],
       url: map['articles'],
       articlesLength: map['articles'],
       articleJsonBody: map,
     );
   }

   static NewsModel fromJson(String source) =>fromMap(map:json.decode(source));

  @override
   toString() {
 //   print();
    return 'Post : $imageUrl, userId: $newsDesc, title: $newsTitle, body: $url';
  }
}