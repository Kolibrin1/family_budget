import 'package:family_budget/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_button.dart';

void showConfirmDialog({
  required BuildContext context,
  required String title,
  required String message,
  required VoidCallback onConfirm,
  String confirmText = "Удалить",
  String cancelText = "Отмена",
  List<Color> confirmColors = const [
    AppColors.complementaryBlue,
    AppColors.primary,
    AppColors.primary,
    AppColors.complementaryBlue,
  ],
  List<Color> cancelColors = const [
    AppColors.surface,
    AppColors.surface,
    AppColors.surface,
    AppColors.surface,
  ],
}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: AppColors.background,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.white,
        ),
      ),
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.subText,
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        Column(
          children: [
            SizedBox(
              width: 200,
              child: AppButton(
                title: confirmText,
                textColor: AppColors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                radius: 10,
                height: 39,
                onPressed: () {
                  onConfirm();
                  Navigator.of(context).pop();
                },
                gradientColors: confirmColors,
              ),
            ),
            SizedBox(
              width: 200,
              child: AppButton(
                title: cancelText,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                radius: 10,
                height: 39,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                gradientColors: cancelColors,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
