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

// String getWeekDayLabel(int day) {
//   String label = 'Сегодня';
//   switch (day) {
//     case 7:
//       label = "Воскресенье";
//       break;
//     case 1:
//       label = "Понедельник";
//       break;
//
//     case 2:
//       label = "Вторник";
//       break;
//
//     case 3:
//       label = "Среда";
//       break;
//
//     case 4:
//       label = "Четверг";
//       break;
//
//     case 5:
//       label = "Пятница";
//       break;
//
//     case 6:
//       label = "Суббота";
//       break;
//
//     default:
//       label = "Понедельник";
//       break;
//   }
//   return label;
// }




// Future<XFile?> getImage() async {
//   final image = await ImagePicker().pickImage(
//     source: ImageSource.gallery,
//     imageQuality: 50,
//   );
//   if (image == null) {
//     return null;
//   } else {
//     return image;
//   }
// }

// Future<FilePickerResult?> filePicker() async {
//   FilePickerResult? myFile = await FilePicker.platform.pickFiles(
//     type: FileType.any,
//   );
//
//   return myFile;
// }


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


// String formatTime({required int? time}) {
//   int sec = time! % 60;
//   int min = (time / 60).floor();
//   int hrs = ((time / 3600).floor());
//   String hour = hrs.toString().length <= 1 ? "0$hrs" : "$hrs";
//   String minute = min.toString().length <= 1 ? "0$min" : "$min";
//   String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
//   return "$hour : $minute : $second";
// }

// String formattingPhone(String text) {
//   //регулярка протиа букв. в телефоне только цифры
//   text = text.replaceAll(RegExp(r'\D'), '');
//   if (text.isNotEmpty) {
//     String phone = '';
//     //проверяем российски ли номер
//     if (['7', '8', '9'].contains(text[0])) {
//       //если пользователь начал с 9, то добавим 7
//       if (text[0] == '9') {
//         text = '7$text';
//       }
//       //Проверяем нужен ли +
//       String firstSymbols = (text[0] == '8') ? '8' : '+7';
//       //само форматирование
//       phone = '$firstSymbols ';
//       if (text.length > 1) {
//         phone += '(${text.substring(1, (text.length < 4) ? text.length : 4)}';
//       }
//       if (text.length >= 5) {
//         phone += ') ${text.substring(4, (text.length < 7) ? text.length : 7)}';
//       }
//       if (text.length >= 8) {
//         phone += '-${text.substring(7, (text.length < 9) ? text.length : 9)}';
//       }
//       if (text.length >= 10) {
//         phone += '-${text.substring(9, (text.length < 11) ? text.length : 11)}';
//       }
//       return phone;
//     } else {
//       return '+$text';
//     }
//   }
//   return '';
// }

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
