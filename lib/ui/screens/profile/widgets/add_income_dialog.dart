import 'package:family_budget/helpers/constants.dart';
import 'package:family_budget/helpers/extensions.dart';
import 'package:family_budget/helpers/functions.dart';
import 'package:family_budget/styles/app_colors.dart';
import 'package:family_budget/widgets/app_button.dart';
import 'package:family_budget/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> showAddIncomeDialog({
  required BuildContext context,
  required String dialogTitle,
  String okButtonTitle = 'Добавить',
  String? hintText,
  required Function(
      String title,
      DateTime date,
      double totalCount,
      ) onTap,
}) async {
  await showAppDialog(
    context: context,
    padding: const EdgeInsets.all(20),
    margin: const EdgeInsets.all(16),
    child: IntrinsicHeight(
      child: _WarningDialogBody(
        onTap: onTap,
        dialogTitle: dialogTitle,
        okButtonTitle: okButtonTitle,
        hintText: hintText,
      ),
    ),
  );
}

class _WarningDialogBody extends StatefulWidget {
  const _WarningDialogBody({
    required this.dialogTitle,
    required this.okButtonTitle,
    this.hintText,
    required this.onTap,
  });

  final String dialogTitle;
  final String okButtonTitle;
  final String? hintText;
  final Function(
      String title,
      DateTime date,
      double totalCount,
      ) onTap;

  @override
  State<_WarningDialogBody> createState() => _WarningDialogBodyState();
}

class _WarningDialogBodyState extends State<_WarningDialogBody> {
  bool validate() {
    if (_titleController.text.isNotEmpty &&
        _totalCountController.text.isNotEmpty &&
        curDate != null) {
      return true;
    } else {
      showMessage(message: 'Не все поля заполнены!', type: PageState.info);
      return false;
    }
  }

  Future<DateTime> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(2010),
      initialDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
    );
    if (pickedDate != null) {
      return pickedDate;
    }
    return DateTime.now();
  }

  final _titleController = TextEditingController();

  final _totalCountController = TextEditingController();

  DateTime? curDate;

  @override
  Widget build(BuildContext context) {
    final hintText = widget.hintText;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: Navigator.of(context).pop,
              child: const Icon(
                Icons.close,
                color: AppColors.subText,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Column(
          children: [
            Text(
              widget.dialogTitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            AppTextField(
              textController: _titleController,
              colorBorder: AppColors.colorScheme.primary,
              hintText: 'Укажите название',
            ),
            const SizedBox(
              height: 10,
            ),
            AppTextField(
              textController: _totalCountController,
              colorBorder: AppColors.colorScheme.primary,
              hintText: 'Укажите сумму',
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () async {
                curDate = await selectDate(context);
                setState(() {});
              },
              child: curDate == null
                  ? Text(
                'Выбрать дату',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.colorScheme.secondary,
                ),
              )
                  : Text(
                curDate!.formatNumberDate,
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.colorScheme.secondary,
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (hintText != null)
              Text(
                hintText,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            const SizedBox(height: 16),
          ],
        ),
        AppButton(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          radius: 10,
          title: widget.okButtonTitle,
          textColor: AppColors.white,
          color: Theme.of(context).colorScheme.primary,
          onPressed: () {
            if (validate()) {
              Navigator.of(context).pop();
              widget.onTap(
                _titleController.text,
                curDate!,
                double.tryParse(_totalCountController.text) ?? 0,
              );
            }
          },
        ),
      ],
    );
  }
}
