import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

enum PageState {
  error,
  success,
  info,
  load,
}

enum IconsType {
  catalog,
  basket,
  profile,
}

class Formats {
  static final phoneFormat = MaskTextInputFormatter(
    mask: '+# (###) ### ## ##',
    filter: {
      "#": RegExp(r'[0-9]'),
    },
  );
}

String pattern = r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
    r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
    r"{0,253}[a-zA-Z0-9])?)*$";

final RegExp emailRegex = RegExp(pattern);

RegExp emailRegExp =
RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

DateFormat inputDateFormat = DateFormat('dd-MM-yyyy hh:mm:ss a');

List<String> monthList = [
  'Январь',
  'Февраль',
  'Март',
  'Апрель',
  'Май',
  'Июнь',
  'Июль',
  'Август',
  'Сентябрь',
  'Октябрь',
  'Ноябрь',
  'Декабрь',
];


enum AppRoute {
  splash('Цветы');

  const AppRoute(this.title);

  final String title;

  static AppRoute fromJson(String json) {
    if (AppRoute.values.contains(values.byName(json))) {
      return values.byName(json);
    }
    return AppRoute.splash;
  }
}

