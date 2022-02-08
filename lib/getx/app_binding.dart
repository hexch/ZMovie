import 'package:get/get.dart';
import 'package:zmovies/utils/app_log.dart';

class AppBinding<T> extends Bindings with AppLog {
  AppBinding(this.builder, [this.isLazyPut = true]);

  @override
  void dependencies() {
    if (isLazyPut) {
      Get.lazyPut(builder);
    } else {
      Get.put(builder.call());
    }
  }

  final T Function() builder;
  final bool isLazyPut;
}
