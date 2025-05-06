import 'package:get/get_navigation/src/root/internacionalization.dart';

class Language extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {'message': 'what is your name', 'name': 'my name is sahil'},
        'en_IN': {'message': 'आपका क्या नाम है', 'name': 'मेरा नाम गोकुल है'}
      };
}
