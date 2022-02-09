import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zmovies/app.dart';

Future<void> main() async {
  runZonedGuarded(() async {
    runApp(App());
  }, (error, stackTrace) {});
}
