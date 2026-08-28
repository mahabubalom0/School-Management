import 'package:get/get.dart';
import 'langs/ar_sa.dart';
import 'langs/bn_bd.dart';
import 'langs/en_us.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'bn_BD': bnBD,
        'ar_SA': arSA,
      };
}
