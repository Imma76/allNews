
import 'package:all_news/core/viewmodels/businessviewmodel.dart';
import 'package:all_news/core/viewmodels/entertainmentnewsmodel.dart';
import 'package:all_news/core/viewmodels/headlineviewmodel.dart';
import 'package:all_news/core/viewmodels/healthviewmodel.dart';
import 'package:all_news/core/viewmodels/sportsviewmodel.dart';
import 'package:all_news/core/viewmodels/techviewmodel.dart';
import 'package:get_it/get_it.dart';

import 'core/model/news_model.dart';
import 'core/services/businessservices.dart';
import 'core/services/entertainmentservices.dart';
import 'core/services/headlineservices.dart';
import 'core/services/healthservices.dart';
import 'core/services/sportsservices.dart';
import 'core/services/techservices.dart';

GetIt getLocator = GetIt.instance;
void setUp(){
 getLocator.registerLazySingleton(() => NewsCode());
 getLocator.registerLazySingleton(() => BusinessServices());
 getLocator.registerLazySingleton(() => SportsServices());
 getLocator.registerLazySingleton(() => TechServices());
 getLocator.registerLazySingleton(() => HealthServices());
 
 getLocator.registerLazySingleton(() => HeadlineViewModel());
 getLocator.registerLazySingleton(() => HeadlineServices());
 getLocator.registerLazySingleton(() => EntertainmentServices());
 getLocator.registerLazySingleton(() => BusinessViewModel());
 getLocator.registerLazySingleton(() => EntertainmentViewModel());
 getLocator.registerLazySingleton(() => HealthViewModel());
 getLocator.registerLazySingleton(() => TechViewModel());
 getLocator.registerLazySingleton(() => SportsViewModel());
}