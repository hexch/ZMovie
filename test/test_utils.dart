import 'package:zmovies/constants.dart';
import 'package:zmovies/flavor.dart';

const String kBaseUrl = 'https://test.baseurl.com';
const String kApiKey = 'abcdefghijklmn';
void initializeUnitTest() {
  Constants.mock(Flavor.develop, kBaseUrl, kApiKey);
}
