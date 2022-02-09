import 'package:get/get.dart';
import 'package:zmovies/app_route.dart';
import 'package:zmovies/getx/app_controller.dart';
import 'package:zmovies/service/app_settings_service.dart';
import 'package:zmovies/service/movie_service.dart';

class SplashController extends AppController {
  @override
  void onReady() {
    super.onReady();
    const func = 'onReady';
    logIn(func);
    fadein(true);
    _process();
    logOut(func);
  }

  Future _process() async {
    const func = '_process';
    logIn(func);
    Future.wait([
      AppSettingsService.me
          .loadAppSettings()
          .then((settings) =>
              MovieService.me.config(settings.region, settings.language))
          .then((_) => MovieService.me.fetchConfiguration())
          .whenComplete(() => log('fetch config completed.', func: func)),
      MovieService.me.fetchMovieGenres(),
      Future.delayed(_kSplashDuration).then((_) {
        log('splash timeout.', func: func);
        gotoHome();
      }),
    ]);

    logOut(func);
  }

  var fadein = false.obs;
  static const _kSplashDuration = Duration(seconds: 2);
}

extension SplashControllerTransation on SplashController {
  String get tag => 'TRANS';
  void gotoHome() {
    const func = 'gotoHome';
    logIn(func, tag);
    Get.offNamed(AppRoute.home.path);
    logOut(func, tag);
  }
}
