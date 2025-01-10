import 'package:family_budget/widgets/app_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'constants.dart';


String getMaskToPhone(String phone) {
  late dynamic mask;
  String result = '';
  mask = Formats.phoneFormat;
  if (mask != null) {
    mask.clear();
    mask.formatEditUpdate(
      TextEditingValue.empty,
      TextEditingValue(text: phone),
    );
    result = mask.getMaskedText() as String;
  }
  return result;
}


String getWeekDayAbbr(int day) {
  switch (day) {
    case 7:
      return "вс";
    case 1:
      return "пн";
    case 2:
      return "вт";
    case 3:
      return "ср";
    case 4:
      return "чт";
    case 5:
      return "пт";
    case 6:
      return "сб";

    default:
      return "пн";
  }
}

String getWelcome() {
  String result = '';
  int hour = DateTime.now().hour;
  if (hour >= 5 && hour < 12) {
    result = 'Доброе утро';
  } else if (hour >= 12 && hour < 18) {
    result = 'Добрый день';
  } else if (hour >= 18 && hour < 23) {
    result = 'Добрый вечер';
  } else if (hour >= 23 || hour < 5) {
    result = 'Здравствуйте';
  }
  return result;
}

void showSnackBar({
  required BuildContext context,
  required String title,
  required PageState type,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        title,
      ),
      backgroundColor: getMessageColor(type),
    ),
  );
}

void showMessage({
  required String message,
  required PageState type,
}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: kIsWeb ? ToastGravity.TOP_RIGHT : ToastGravity.TOP,
    timeInSecForIosWeb: 3,
    backgroundColor: getMessageColor(type),
    textColor: Colors.white,
    fontSize: 16,
    webBgColor: getMessageHexColor(type),
  );
}

Color getMessageColor(PageState type) {
  switch (type) {
    case PageState.error:
      return Colors.red;
    case PageState.success:
      return Colors.green;
    case PageState.info:
      return Colors.blue;
    case PageState.load:
    default:
      return Colors.red;
  }
}

String getMessageHexColor(PageState type) {
  switch (type) {
    case PageState.error:
      return 'linear-gradient(to right, #ff0000, #ff5050)';
    case PageState.success:
      return "linear-gradient(to right, #00b09b, #96c93d)";
    case PageState.info:
      return 'linear-gradient(to right, #33ccff, #00ffff)';
    case PageState.load:
    default:
      return 'linear-gradient(to right, #ff0000, #ff0000)';
  }
}

Future<T?> showAppDialog<T>({
  required BuildContext context,
  required Widget child,
  Color barrierColor = Colors.black54,
  double? maxWidth,
  EdgeInsets? padding,
  EdgeInsetsGeometry? margin,
}) {
  return showDialog<T>(
    barrierColor: barrierColor,
    context: context,
    builder: (context) => AppDialog(
      margin: margin,
      padding: padding,
      maxWidth: maxWidth,
      child: child,
    ),
  );
}

class Format {
  static final phoneFormat = MaskTextInputFormatter(
    mask: '+7 (###) ###-##-##',
    filter: {
      "#": RegExp(r'[0-9]'),
    },
  );
}

String getPhoneFormat(String phone) {
  return '${phone.substring(0, 2)}${phone.substring(4, 7)}${phone.substring(9, 12)}${phone.substring(13, 15)}${phone.substring(16, 18)}';
}
