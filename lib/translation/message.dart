import 'package:get/get.dart';

part 'en_us.dart';
part 'ja_jp.dart';

class Message extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUs,
        'ja_JP': jaJp,
      };
}
