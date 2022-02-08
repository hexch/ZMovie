import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zmovies/app_route.dart';
import 'package:zmovies/constants.dart';
import 'package:zmovies/data/repository/api_repository.dart';
import 'package:zmovies/data/repository/local_info_repository.dart';
import 'package:zmovies/service/app_settings_service.dart';
import 'package:zmovies/service/movie_service.dart';
import 'package:zmovies/translation/message.dart';

void main() {
  runApp(
    GetMaterialApp(
      locale: Get.deviceLocale,
      translations: Message(),
      initialBinding: BindingsBuilder(
        () {
          Get.put<ApiRepository>(ApiRepositoryImpl(Constants.of().apiKey));
          Get.put<LocalInfoRepository>(LocalInfoRepositoryImpl());
          Get.put(AppSettingsService());
          Get.put(MovieService());
        },
      ),
      getPages: gAppRoutes,
      initialRoute: AppRoute.splash.path,
    ),
  );
}
