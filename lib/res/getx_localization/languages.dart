import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'name': 'Ahsan',
          'message': 'I am a Flutter Developer',
          'email_hint': 'Enter you email',
          'password_hint': 'Enter you password',
          'login_now': 'Login Now!',
          'empty': 'Empty Field',
        },
        'es_ES': {
          'name': 'Ahsan',
          'message': 'Soy desarrollador de Flutter',
        },
        'ur_PK': {
          'name': 'احسن',
          'message': 'میں ایک فلٹر ڈویلپر ہوں۔',
        },
      };
}
